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
 * @package Helper
 * @license http://www.gnu.org/licenses/agpl.txt GNU AFFERO GENERAL PUBLIC LICENSE version 3.
 * @author Manuel José Aguirre Garcia <programador.manuel@gmail.com>
 */
Load::models('menus');

class Menu {
    /**
     * Constante que define que solo va a mostrar los
     * Items del menu para app
     */
    const APP = 1;

    /**
     * Constante que define que solo va a mostrar los
     * Items del menu para el backend
     */
    const BACKEND = 2;

    /**
     * Id del usuario logueado actualmente
     *
     * @var int 
     */
    protected static $_id_user = NULL;

    public static function render(MenuInterface $menu, $entorno = self::BACKEND) {
        $registros = $menu->getItems($entorno);
        $html = '';
        if ($registros) {
            $html .= '<ul class="nav">' . PHP_EOL;
            foreach ($registros as $e) {
                $html .= self::_generarItem($e, $entorno);
            }
            $html .= '</ul>' . PHP_EOL;
        }
        return $html;
    }

    protected static function _generarItem(MenuInterface $menu, $entorno) {
        $sub_menus = $menu->hasSubItems(); //devuelve los sub items de existir
        $sub_menus = $menu->getSubItems(); //devuelve los sub items de existir
        $class = 'menu_' . str_replace('/', '_', $menu->getUrl()); //la url formará parte de las clases
        $class .= ' '. h($menu->getClasses()); //obtenemos las clases del item actual
        if ($sub_menus) { //si tiene items hijos
            $html = "<li class='" . h($class) . " dropdown'>" .
                    Html::link($menu->getUrl() . '#', h($menu->getTitle()) .
                            ' <b class="caret"></b>',
                            'class="dropdown-toggle" data-toggle="dropdown"') . PHP_EOL;
        } else {
            $html = "<li class='" . h($class) . "'>" .
                    Html::link($menu->getUrl(), h($menu->getTitle())) . PHP_EOL;
        }
        if ($sub_menus) {
            $html .= '<ul class="dropdown-menu">' . PHP_EOL;
            foreach ($sub_menus as $e) {
                $html .= self::_generarItem($e, $entorno);
            }
            $html .= '</ul>' . PHP_EOL;
        }
        return $html . "</li>" . PHP_EOL;
    }
}