<?php

namespace app\models\query;

/**
 * This is the ActiveQuery class for [[\app\models\Projetos]].
 *
 * @see \app\models\Projetos
 */
class ProjetosQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return \app\models\Projetos[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return \app\models\Projetos|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
