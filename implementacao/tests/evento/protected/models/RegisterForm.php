<?php
class RegisterForm extends CFormModel {

	public $Name ;
	public $Mail;
	public $Pass ;
	public $RePass;

	private $_identity;

	public function rules() {
		return array( array('Name, Mail, Pass, RePass', 'required'),
		array('Name, Pass, RePass, Mail', 'length', 'max'=>256),
		array('Pass RePass','length', 'min'=> 8),
		array('Mail','email'),
		array('Mail','unique','className' => 'User','message'=>"Email already exists!"),
		array('RePass', 'required', 'on'=>'Register'),
		array('RePass', 'compare', 'compareAttribute'=>'Pass'),
		array('Name, Pass, Mail', 'safe', 'on'=>'search'), );
	}

	public function register(){

		$newUser = new User;
		
		$newUser->Name = $this->Name ;
		$newUser->Mail = $this->Mail;
		$newUser->Pass = md5($this->Pass);
		$newUser->Type = 1;

		if($newUser->save()) {

			$this->_identity = new UserIdentity($this->Mail,$this->Pass);

			if($this->_identity->authenticate())

			Yii::app()->user->login($this->_identity);

			return true;
		}
		return false;

	}

}