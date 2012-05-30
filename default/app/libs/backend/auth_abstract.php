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
 * @package Libs
 * @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GENERAL PUBLIC LICENSE version 3.
 * @author Manuel José Aguirre Garcia <programador.manuel@gmail.com>
 */

Load::lib('backend/auth_interface2');

abstract class AuthAbstract implements AuthInterface2
{

    /**
     * Namespace de las cookies y el hash de clave que se va a encriptar
     * Recordar que si se cambian, se deben actualizar las claves en la bd.
     */ 
    protected static $_clave_sesion = 'backend_kumbiaphp';

    public static function hash($pass)
    {
        return crypt($pass, self::$_clave_sesion);
    }

    public static function cookiesActivas()
    {
        return isset($_COOKIE[md5(self::$_clave_sesion)]) && is_array(self::getCookies());
    }

    public static function setCookies($user, $pass)
    {
        setcookie(md5(self::$_clave_sesion), serialize(array(
                    'login' => $user,
                    'clave' => $pass
                )), time() + 60 * 60 * 24 * 30);
    }

    public static function getCookies()
    {
        if (isset($_COOKIE[md5(self::$_clave_sesion)])) {
            return unserialize($_COOKIE[md5(self::$_clave_sesion)]);
        } else {
            return NULL;
        }
    }

    public static function deleteCookies()
    {
        setcookie(md5(self::$_clave_sesion),'',time()- 1);
        unset($_COOKIE[md5(self::$_clave_sesion)]);
    }

}

