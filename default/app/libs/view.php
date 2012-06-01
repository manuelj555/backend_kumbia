<?php

/**
 * Esta clase permite extender o modificar la clase ViewBase de Kumbiaphp.
 *
 * @category KumbiaPHP
 * @package View
 * */
// @see KumbiaView
require_once CORE_PATH . 'kumbia/kumbia_view.php';

class View extends KumbiaView {

    public static function renderMenu($entorno) {
        if (MyAuth::es_valido()) {
            echo $var = Menu::render(Auth::get('id'), $entorno);
        } else {
            return '';
        }
    }

    public static function excepcion(KumbiaException $e) {
        Flash::warning('Lo sentimos, Ha Ocurrido un Error...!!!');
        if (Config::get('config.application.log_exception') || !PRODUCTION) {
            Flash::error($e->getMessage());
        }
        if (!PRODUCTION) {
            Flash::error($e->getTraceAsString());
        }
        Logger::critical($e);
        Flash::info('Si el problema persiste por favor informe al administrador del sistema...!!!');
    }
	
	public function notFound(){
		throw new KumbiaException(NULL, 'no_controller');
	}
	
	static function jsTemplate($tpl){
		ob_start();
		parent::partial("client/$tpl");
		$content = ob_get_clean();
		return sprintf('<script type="txt/tpl" id="tpl-%s">%s</script>',
			$tpl, $content);
	}
	
	static function jsTpl(){
		$out = array();
		$a_tpl = func_get_args();
		foreach($a_tpl as $tpl){
			$out[] =  self::jsTemplate($tpl);
		}
		return implode($out);
	}


}
