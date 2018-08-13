<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
	private $_id;
	
	/**
	 * Authenticates a user.
	 * @return boolean whether authentication succeeds.
	 */
	public function authenticate()
	{
		
		$record=User::model()->findByAttributes(array('Mail'=>$this->username));  // username will be mail in our case 
       	if($record===null)
               {
                       $this->_id='null';
                       $this->errorCode=self::ERROR_USERNAME_INVALID;
               }
       else if($record->Pass!==md5($this->password))
               {       $this->_id=$record['Id'];
                       $this->errorCode=self::ERROR_PASSWORD_INVALID;
               }
                       
       else
       {  
           $this->_id=$record['Id'];
           $this->setState('logged', $record['Name']);
           $this->errorCode=self::ERROR_NONE;
       }
       return !$this->errorCode;
       
	}
	
 	public function getId()       
   	{
       return $this->_id;
   	}
	
}