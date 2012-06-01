<?php
Load::model('authtoken');
class RestController extends AppController {
	protected $need_auth = array();
	
	protected function before_filter()
	{
		/*El nombre de la accion se convierte en parametro*/
	    if(is_numeric($this->action_name)){
			$this->parameters = array($this->action_name);
		}
	    $this->action_name = Rest::init();
	    /*
	     * Verifico si el metodo esta protegido
	     */
	    if($this->need_auth===true or in_array($this->action_name, $this->need_auth)){
			/*
			 * Hago la autenticación, si falla manda error
			 */
			$token = $_SERVER['HTTP_AUTH_TOKEN'];
			$app   = $_SERVER['HTTP_APP_TOKEN'];
			$auth = new Authtoken();
			if(!$auth->is_valid($token, $app)){
				header('HTTP/1.0 401 Unauthorized');
				die();
			}
		}
	    View::template(null);
	    View::setPath('');
	    View::select('api/response');
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
