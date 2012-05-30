<?php

/**
 * undocumented class
 *
 * @author 
 **/
interface AclInterface
{
	/**
     * Verifica si el usuario conectado tiene permisos de acceso al recurso actual
     *
     * @return boolean resultado del chequeo
     */
    public function check();

    /**
     * Verifica si un usuario a excedido el numero de intentos de entrar a un
     * recursos consecutivamente sin tener permisos.
     *
     * @return boolean devuelve true si se ha sobrepasado el limite de intentos
     */
    public function limiteDeIntentosPasado();

    /**
     * Reinicia el numero de intentos de un usuario por acceder a un recurso en cero.
     */
    public function resetearIntentos();
} // END interface 