<?php
class AuthController extends AppController {
	
	function token(){
		View::template(null);
		$user = $_POST['user'];
		$password = $_POST['pass'];
		$app = $_POST['app'];
		$u = Load::model('usuarios');
		$a = $u->find_by_login($user);
		if($a->clave == MyAuth::hash($password)){
			$hash = sha1(date('M-D-i-s-m-h').$user);
			$token = Load::model('authtoken'); 
			$token->token = $hash;
			$token->usuarios_id = $a->id;
			$token->apps_id = $a->id;
			$token->save();
			echo  json_encode(array('token'=>$hash, 'id' => $a->id));
		}else{
			header('HTTP/1.0 403 Unauthorized');
		}
		die();
	}
}
?>
