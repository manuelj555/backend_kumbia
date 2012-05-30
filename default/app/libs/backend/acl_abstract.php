<?php

/**
 * undocumented class
 *
 * @author 
 **/

Load::lib('backend/acl_interface');	

abstract class AclAbstract implements AclInterface
{

    /**
     * Verifica si un usuario a excedido el numero de intentos de entrar a un
     * recursos consecutivamente sin tener permisos.
     *
     * @return boolean devuelve true si se ha sobrepasado el limite de intentos
     */
    public function limiteDeIntentosPasado(){
		if (Session::has('intentos_acceso')) {
            $intentos = Session::get('intentos_acceso') + 1;
            Session::set('intentos_acceso', $intentos);
            $max_intentos = Config::get('config.application.intentos_acceso');
            return $intentos >= $max_intentos;
        } else {
            Session::set('intentos_acceso', 0);
        }
        return FALSE;
    }

    /**
     * Reinicia el numero de intentos de un usuario por acceder a un recurso en cero.
     */
    public function resetearIntentos(){
    	Session::set('intentos_acceso', 0);
    }
} // END interface 