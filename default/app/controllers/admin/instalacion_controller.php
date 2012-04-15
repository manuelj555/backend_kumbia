<?php

/**
 * Description of instalacion_controller
 *
 * @author manuel
 */
class InstalacionController extends AppController
{

    public function index($index_entorno = 0)
    {
        Config::read('databases');
        $this->entornos_bd = array_keys(Config::get('databases'));
        $this->entorno = $this->entornos_bd[$index_entorno];
        $this->database = Config::get("databases.{$this->entorno}");

        if (Input::hasPost('database')) {
            Config::set("databases.{$this->entornos_bd[Input::post('entorno')]}", Input::post('database'));
            MyConfig::save('databases');
            Flash::info('se guardó');
        } elseif (Input::isAjax()) {
            View::response('ajax', NULL);
        }
    }

    public function describe()
    {
        View::select(NULL);

        Config::read('bd_scheme');
        var_dump(Config::get('bd_scheme.usuarios'));
        var_dump(Db::factory()->drop_table('usuarios'));
        var_dump(Db::factory()->create_table('usuarios',Config::get('bd_scheme.usuarios')));
        var_dump(Db::factory()->describe_table('usuarios'));
    }

}