<?php

/**
 * Description of instalacion_controller
 *
 * @author manuel
 */
class InstalacionController extends AppController
{

    protected function before_filter()
    {
        if ($_SERVER['REMOTE_ADDR'] != '127.0.0.1') { //seguridad
            header('HTTP/1.0 403 Forbidden');
            exit('No tienes permisos para acceder a esta dirección...!!!');
        }
        if (defined('SIN_MOD_REWRITE')) {
            Flash::error('Debes tener instalado el Mod Rewrite de Apache para poder usar KumbiaPHP');
        }
    }

    public function index($index_entorno = 0)
    {
        Config::read('databases');
        $this->entornos_bd = array_keys(Config::get('databases'));
        $this->entorno = $this->entornos_bd[$index_entorno];
        $this->database = Config::get("databases.{$this->entorno}");

        if (Input::hasPost('database')) {
//            if (!$_POST['database']['pdo'])
//                unset($_POST['database']['pdo']);
            Config::set("databases.{$this->entornos_bd[Input::post('entorno')]}", Input::post('database'));
            MyConfig::save('databases');
            //Flash::info('se guardó');
            Router::redirect('paso2');
        } elseif (Input::isAjax()) {
            View::response('ajax', NULL);
        }
    }

    public function paso2()
    {
        try {
            $this->config = Configuracion::leer();
            $this->entornos = array_keys(Config::read('databases'));
            $this->entornos = array_combine($this->entornos, $this->entornos);
            if (Input::hasPost('config')) {
                foreach (Input::post('config') as $variable => $valor) {
                    Configuracion::set($variable, $valor);
                }
                if (Configuracion::guardar()) {
                    Flash::valid('La Configuración fue Actualizada Exitosamente...!!!');
                    Acciones::add("Editó la Configuración de la aplicación", 'archivo config.ini');
                    $this->config = Configuracion::leer();
                    Router::redirect('paso3');
                } else {
                    Flash::warning('No se Pudieron guardar los Datos...!!!');
                }
                $this->config = Configuracion::leer();
            }
        } catch (KumbiaException $e) {
            View::excepcion($e);
        }
    }

    public function describe()
    {
        View::select(NULL);

        Config::read('bd_scheme');
        var_dump(Config::get('bd_scheme.usuarios'));
        var_dump(Db::factory()->drop_table('usuarios'));
        var_dump(Db::factory()->create_table('usuarios', Config::get('bd_scheme.usuarios')));
        var_dump(Db::factory()->describe_table('usuarios'));
        var_dump(Db::factory()->list_tables());
    }

    public function paso3()
    {
        try {
            ob_start();
            $con = Db::factory();
        } catch (KumbiaException $e) {
            ob_clean();
            View::response('error');
            Flash::error('No se Pudo Conectar a la Base de datos');
            Flash::info('Verifica que el Nombre de usuario y contraseña de conexion a la BD son Correctos');
            View::excepcion($e);
            return;
        }
        $esquema = Config::read('bd_scheme');
        $this->tablas_crear = array_keys($esquema);
        if (Input::hasPost('tablas')) {
            $exito = TRUE;
            foreach (Input::post('tablas') as $key => $t) {
                if (substr($key, 0, 5) == 'data_')
                    continue;
                $con->drop_table($t);
                if ($con->create_table($t, $esquema[$t])) {
                    if (isset($esquema["data_$t"])) {
                        $con->query($esquema["data_$t"]['data']);
                    }
                } else {
                    Flash::error("No se pudo crear la tabla <b>$t</b>");
                    $exito = FALSE;
                }
            }
            if ($exito)
                Router::redirect('instalacion_finalizada');
        }
        $this->tablas_existentes = array();
        foreach ((array) $con->list_tables() as $t) {
            $this->tablas_existentes[] = $t[0];
        }
    }

    public function instalacion_finalizada()
    {
        
    }

    public function quitar_instalacion()
    {
        Configuracion::leer();
        Configuracion::set('routes', 'Off');
        Configuracion::guardar();
        Router::redirect('/');
    }

}