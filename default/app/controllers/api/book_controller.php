<?php
Load::model('books');
class BookController extends RestController {
	protected $need_auth =true;
	
	public function  get($id=null){
		$book = new Books();
		$this->data = $book->find();
	}
	
	public function put($id){
		$data =  Rest::param();
		$book = new Books();
		$book->find($id);
		$book->update($data);
		$this->data = $book;
	}
	
	public function post(){
		$data =  Rest::param();
		$book = new Books($data);
		$book->save();
		$this->data = $book;
	}
	
	public function delete($id){
		$book = new Books($data);
		$book->delete($id);
		$this->data = null;
	}
}
?>
