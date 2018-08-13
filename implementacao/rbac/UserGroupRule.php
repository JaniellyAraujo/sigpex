<?php
namespace app\rbac;

use Yii;
use yii\rbac\Rule;
 
class UserGroupRule extends Rule {
    public $name = 'userGroup';
    
    public function execute($user, $item, $params) {
         if (!Yii::$app->user->isGuest) {
            $group = Yii::$app->user->identity->role;
            if ($item->name === 'admin') {
                return $group == 1;
            } elseif ($item->name === 'coordenador') {
                return $group == 2;
            } elseif ($item->name === 'servidor') {
                return $group == 3;
            } elseif ($item->name === 'discente') {
                return $group == 4;
            } 
        }
        return false;
    
    }
    
     protected function executeRule($user, $item, $params)
    {
        if (empty($item->ruleName)) {
            return true;
        }

         return parent::executeRule($user, $item, $params);
    }

}
