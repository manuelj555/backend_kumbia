<?php
/**
 * Todas las controladores heredan de esta clase en un nivel superior
 * por lo tanto los metodos aqui definidos estan disponibles para
 * cualquier controlador.
 *
 * @category Kumbia
 * @package Controller
 * */
// @see Controller nuevo controller
require_once CORE_PATH . 'kumbia/controller.php';

class AdminController extends Controller
{

    final protected function initialize()
    {
        if (MyAuth::estaLogueado()) {
            return $this->_tienePermiso(new MyAcl());
        } elseif (Input::hasPost('login') && Input::hasPost('clave')) {
            return $this->_logueoValido(Input::post('login'), Input::post('clave'));
        } elseif (MyAuth::cookiesActivas()) {
            $data = MyAuth::getCookies();
            return $this->_logueoValido($data['login'], $data['clave'], FALSE);
        } else {
            View::select(NULL, 'backend/logueo');
            return FALSE;
        }
    }

    protected function _tienePermiso(AclInterface $acl)
    {
        View::template('backend/backend');
        if (!$acl->check()) {
            if ($acl->limiteDeIntentosPasado()) {
                $acl->resetearIntentos();
                return $this->intentos_pasados();
            }
            Flash::error('no posees privilegios para acceder a <b>' . Router::get('route') . '</b>');
            View::select(NULL);
            return FALSE;
        } else {
            $acl->resetearIntentos();
            return TRUE;
        }
    }

    protected function _logueoValido($user, $pass, $encriptar = TRUE)
    {
        if (MyAuth::autenticar($user, $pass, $encriptar)) {
            Flash::info('Bienvenido al Sistema <b>' . h(Auth::get('nombres')) . '</b>');
            return $this->_tienePermiso(new MyAcl());
        } else {
            Input::delete();
            Flash::warning('Datos de Acceso invalidos');
            View::select(NULL, 'backend/logueo');
            return FALSE;
        }
    }

    public function logout()
    {
        MyAuth::cerrarSesion();
        return Router::redirect('/');
    }

    protected function intentos_pasados()
    {
        MyAuth::cerrarSesion();
        Flash::warning('Has Sobrepasado el limite de intentos fallidos al tratar acceder a ciertas partes del sistema');
        return Router::redirect('/');
    }

    final protected function finalize()
    {

    }

}