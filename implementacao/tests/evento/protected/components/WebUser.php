<?php
 
class WebUser extends CWebUser {
 
  // Store model to not repeat query.
  private $_model;
 

  // access it by Yii::app()->user->name
  function getName(){
    $user = $this->loadUser(Yii::app()->user->id);
    return $user['Name'];
  }


  // access it by Yii::app()->user->isAdmin()
  function isAdmin(){
    $user = $this->loadUser(Yii::app()->user->id);
    return intval($user['Type']) == 4;
  }
  
  function isEditor(){
    $user = $this->loadUser(Yii::app()->user->id);
    return intval($user['Type']) == 3;
  }
  
  function isOrganizer(){
    $user = $this->loadUser(Yii::app()->user->id);
    return intval($user['Type']) == 2;
  }
  
  function isNormal(){
    $user = $this->loadUser(Yii::app()->user->id);
    return intval($user['Type']) == 1;
  }
 
  // Load user model.
  protected function loadUser($id=null)
    {
        if($this->_model===null)
        {
            if($id!==null)
                $this->_model=User::model()->findByPk($id);
        }
        return $this->_model;
    }
}
?>