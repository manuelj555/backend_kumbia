<?php

/**
 * Description of instalacion_controller
 *
 * @author manuel
 */
class InstalacionController extends AppController
{

    public function index()
    {
//        View::select(NULL);
//        try{
//            ob_start();
//            //var_dump(Load::model('usuarios')->find());
//            //$r = current(Db::factory()->find('usuarios'));
//            //var_dump($r['roles_id']);
//            var_dump(Db::factory()->find('usuarios'));
//            Flash::info(Db::factory()->last_sql_query());
//            Flash::info(Db::factory()->last_sql_query());
//            $usuarios = Load::model('usuarios');
//            $usuarios->find();
//            Flash::info($usuarios->db->last_sql_query());
//
//        } catch (KumbiaException $e){
//            //si llegamos aqui es porque no se pudo conectar y no se ha configurado
//            //la conección
//            ob_clean();
//            Flash::info('Configurar COnexion a la Bd');
//        }
        Config::read('databases');
        $this->database = Config::get('databases.development');

        if (Input::hasPost('database')) {
            Config::set('databases.development', Input::post('database'));
            MyConfig::save('databases');
            Flash::info('se guardó');
        }
    }

}