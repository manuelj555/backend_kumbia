<?php
class Authtoken extends ActiveRecord{
	function is_valid($token, $app){
		return $this->find_by_token($token);
	}

}
