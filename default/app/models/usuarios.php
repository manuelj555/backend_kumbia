<?php

/**
 * Backend - KumbiaPHP Backend
 * PHP version 5
 * LICENSE
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * ERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 * @package Modelos
 * @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GENERAL PUBLIC LICENSE version 3.
 * @author Manuel José Aguirre Garcia <programador.manuel@gmail.com>
 */
class Usuarios extends ActiveRecord {

//put your code here
//    public $debug = true;

    public function initialize() {
        $min_clave = Config::get('config.application.minimo_clave');
        //$this->belongs_to('roles');
        $this->has_many('auditorias');
        $this->has_many('roles_usuarios');
        $this->has_and_belongs_to_many('roles', 'model: roles', 'fk: roles_id', 'through: roles_usuarios', 'key: usuarios_id');
        $this->validates_presence_of('login', 'message: Debe escribir un <b>Login</b> para el Usuario');
        $this->validates_presence_of('clave', 'message: Debe escribir una <b>Contraseña</b>');
        $this->validates_length_of('clave', 50, $min_clave, "too_short: La Clave debe tener <b>Minimo {$min_clave} caracteres</b>");
        $this->validates_presence_of('clave2', 'message: Debe volver a escribir la <b>Contraseña</b>');
        $this->validates_presence_of('nombres', 'message: Debe escribir su <b>nombre completo</b>');
        $this->validates_presence_of('email', 'message: Debe escribir un <b>correo electronico</b>');
    }

    public function before_validation_on_create() {
        $this->validates_uniqueness_of('login', 'message: El <b>Login</b> ya está siendo utilizado');
    }

    public function before_save() {
        if (isset($this->clave2) and $this->clave !== $this->clave2) {
            Flash::error('Las <b>CLaves</b> no Coinciden...!!!');
            return 'cancel';
        } elseif (isset($this->clave2)) {
            $this->clave = md5($this->clave);
        }
    }

    public function obtener_usuarios($pagina = 1) {
//        $cols = "usuarios.*";
//        $join = "INNER JOIN roles_usuarios ru ON ru.usuarios_id = usuarios.id";
//        $join .= " INNER JOIN roles r ON r.id = ru.roles_id";
//        $group = "usuarios.id";
        return $this->paginate("page: $pagina"); //, "columns: $cols", "join: $join", "group: $group");
    }

    public function obtener_usuarios_con_num_acciones($pagina = 1) {
        $cols = "usuarios.*,roles.rol,COUNT(auditorias.id) as num_acciones";
        $join = "INNER JOIN roles ON roles.id = usuarios.roles_id ";
        $join .= "LEFT JOIN auditorias ON usuarios.id = auditorias.usuarios_id";
        $group = 'usuarios.' . join(',usuarios.', $this->fields);
        $sql = "SELECT $cols FROM $this->source $join GROUP BY $group";
        return $this->paginate_by_sql($sql, "page: $pagina");
        //comentada la siguiente linea debido a que el active record lanzaba
        //una advertencia de que el count esta devolviendo mas de 1 registro,
        //esto es por el group by
        //return $this->paginate("page: $pagina", "columns: $cols", "join: $join", "group: $group");
    }

    public function cambiar_clave($datos) {
        if (md5($datos['clave_actual']) != $this->clave) {
            Flash::error('Las <b>CLave Actual</b> es Incorrecta...!!!');
            return false;
        }
        $this->clave = $datos['nueva_clave'];
        $this->clave2 = $datos['nueva_clave2'];
        return $this->update();
    }

    /**
     * Guarda los datos de un usuario, y los roles que va a poseer
     *
     * @param array $data datos que se enviaron del form
     * @param array $roles ids de los roles a guardar para el user
     * @return boolean retorna TRUE si se pudieron guardar los datos con exito
     */
    public function guardar($data, $roles) {
        $this->begin();

        if (!$this->save($data)) {
            return FALSE;
        }

        $rolUser = Load::model('roles_usuarios');

        if (is_array($roles) && count($roles)) {

            if (!$rolUser->delete_all("usuarios_id = '$this->id'")) {
                Flash::error('No se pudieron Guardar los Roles para el usuario');
                $this->rollback();
                return FALSE;
            }

            foreach ($roles as $e) {
                $rolUser->usuarios_id = $this->id;
                $rolUser->roles_id = $e;
                if (!$rolUser->create()) {
                    Flash::error('No se pudieron Guardar los Roles para el usuario');
                    $this->rollback();
                    return FALSE;
                }
            }
        } else {
            Flash::error('Debe seleccionar al menos un Rol para el Usuario');
            $this->rollback();
            return FALSE;
        }

        $this->commit();
        return TRUE;
    }

    public function rolesUserIds() {
        $roles_id = array();
        if ($this->roles_usuarios) {
            foreach ($this->roles_usuarios as $e) {
                $roles_id["$e->roles_id"] = $e->roles_id;
            }
        } else {
            Flash::warning('Hay algo extraño, este user no tiene roles asignados aun...!!!');
        }
        return $roles_id;
    }

}
