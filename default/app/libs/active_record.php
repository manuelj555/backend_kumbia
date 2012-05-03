<?php

/**
 * ActiveRecord
 *
 * Esta clase es la clase padre de todos los modelos
 * de la aplicacion
 *
 * @category Kumbia
 * @package Db
 * @subpackage ActiveRecord
 */
// Carga el active record
Load::coreLib('kumbia_active_record');

class ActiveRecord extends KumbiaActiveRecord {

//    public $debug = true;
//    public $logger = true;


    public function activar() {
        $this->activo = '1';
        return $this->update();
    }

    public function desactivar() {
        $this->activo = '0';
        return $this->update();
    }

    protected function after_save() {
        $this->log();
    }

    protected function after_delete() {
        $this->log();
    }

    protected function log() {
        if ($this->source != 'auditorias') { //mucho ojo con esto
            //solo debemos hacer el log si la tabla no es la de auditorias;
            $tabla = $this->schema ? "$this->schema.$this->source" : $this->source;
            $sql = $this->db->last_sql_query();
            if (strpos($sql, 'SELECT ') > 10 || strpos($sql, 'SELECT ') === false) {
                //las consultas SELECT no las vamos a guardar
                Acciones::add($this->db->last_sql_query(), $tabla);
            }
        }
    }

}
