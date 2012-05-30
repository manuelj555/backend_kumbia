<?php

/**
 *
 * @author 
 **/
interface AuthInterface2
{
	public static function autenticar($user, $pass, $encriptar = TRUE);

	public static function estaLogueado();

	public static function cerrarSesion();

	public static function hash($pass);

	public static function cookiesActivas();

	public static function setCookies($user, $pass);

	public static function getCookies();

	public static function deleteCookies();
} // END interface 