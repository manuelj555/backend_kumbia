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
 * @package Controller
 * @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GENERAL PUBLIC LICENSE version 3.
 * @author Manuel José Aguirre Garcia <programador.manuel@gmail.com>
 */
Load::models('roles');

class RolesController extends AdminController {

    public function index($pag= 1) {
        try {
            $roles = new Roles();
            $this->roles = $roles->paginate("page: $pag");
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function crear() {
        $this->titulo = 'Crear Rol (Perfil)';
        try {

            if (Input::hasPost('rol')) {
                $rol = new Roles(Input::post('rol'));
                if (Input::hasPost('roles_padres')) {
                    //$rol->padres = join(',', Input::post('roles_padres'));
                }
                if ($rol->save()) {
                    Flash::valid('El Rol Ha Sido Agregado Exitosamente...!!!');
                    return Router::redirect();
                } else {
                    Flash::warning('No se Pudieron Guardar los Datos...!!!');
                }
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function editar($id) {
        $this->titulo = 'Editar Rol (Perfil)';
        try {

            $id = (int) $id;

            View::select('crear');

            $rol = new Roles();

            $this->rol = $rol->find_first($id);

            if ($this->rol) {//verificamos la existencia del rol

                if (Input::hasPost('rol')) {

                    if (Input::hasPost('roles_padres')) {
//                    $padres = Input::post('roles_padres');
//                    sort($padres);
//                    $rol->padres = join(',', $padres);
                    }

                    if ($rol->update(Input::post('rol'))) {
                        Flash::valid('El Rol Ha Sido Actualizado Exitosamente...!!!');
                        return Router::redirect();
                    } else {
                        Flash::warning('No se Pudieron Guardar los Datos...!!!');
                    }
                }
            } else {
                Flash::warning("No existe ningun rol con id '{$id}'");
                return Router::redirect();
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function eliminar($id) {
        try {
            $id = (int) $id;

            $rol = new Roles();

            if (!$rol->find_first($id)) { //si no existe
                Flash::warning("No existe ningun rol con id '{$id}'");
            } else if ($rol->delete()) {
                Flash::valid("El rol <b>{$rol->rol}</b> fué Eliminado...!!!");
            } else {
                Flash::warning("No se Pudo Eliminar el Rol <b>{$rol->rol}</b>...!!!");
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Router::redirect();
    }

    public function activar($id) {
        try {
            $id = (int) $id;

            $rol = new Roles();

            if (!$rol->find_first($id)) { //si no existe
                Flash::warning("No existe ningun rol con id '{$id}'");
            } else if ($rol->activar()) {
                Flash::valid("El rol <b>{$rol->rol}</b> Esta ahora <b>Activo</b>...!!!");
            } else {
                Flash::warning("No se Pudo Activar el Rol <b>{$rol->rol}</b>...!!!");
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        Router::redirect();
    }

    public function desactivar($id) {
        try {
            $id = (int) $id;

            $rol = new Roles();

            if (!$rol->find_first($id)) { //si no existe
                Flash::warning("No existe ningun rol con id '{$id}'");
            } else if ($rol->desactivar()) {
                Flash::valid("El rol <b>{$rol->rol}</b> Esta ahora <b>Inactivo</b>...!!!");
            } else {
                Flash::warning("No se Pudo Desactivar el Rol <b>{$rol->rol}</b>...!!!");
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
        return Router::redirect();
    }

}
