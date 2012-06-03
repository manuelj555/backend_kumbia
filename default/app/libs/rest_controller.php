<?php
Load::model('authtoken');
class RestController extends AdminController {
	
	protected function initialize()
	{
		/*El nombre de la accion se convierte en parametro*/
	    if(is_numeric($this->action_name)){
			$this->parameters = array($this->action_name);
		}
	    $this->action_name = Rest::action();
	    parent::initialize();
	    View::template(null);
	    View::setPath('');
	    View::select('api/response');
	}

	protected function checkAuth(){
		$token = $_SERVER['HTTP_AUTH_TOKEN'];
		$app   = $_SERVER['HTTP_APP_TOKEN'];
		$auth = new Authtoken();
		if($auth->is_valid($token, $app)){
            return $this->_tienePermiso();
        } else {
        	Rest::getHeader(401);
            return FALSE;
        }

    }

    protected function _tienePermiso()
    {
        $acl = new MyAcl();
        if (!$acl->check()) {
            if ($acl->limiteDeIntentosPasado()) {
                $acl->resetearIntentos();
                return $this->intentos_pasados();
            }
            Rest::getHeader(403);
            return FALSE;
        } else {
            $acl->resetearIntentos();
            return TRUE;
        }
    }
	
	
	public function  get($id=null){

	}
	
	public function put($id){

	}
	
	public function post(){

	}
	
	public function delete($id){

	}
}
?>
