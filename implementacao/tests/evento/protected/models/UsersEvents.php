<?php

/**
 * This is the model class for table "usersevents".
 *
 * The followings are the available columns in table 'usersevents':
 * @property integer $Id
 * @property integer $Id_User
 * @property integer $Id_Event
 * @property integer $Rating
 * @property string $Timestamp
 *
 * The followings are the available model relations:
 * @property User $idUser
 * @property Events $idEvent
 */
class UsersEvents extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'usersevents';
	}

	public function rules()
	{

		return array(
			array('Id_User, Id_Event, Timestamp', 'required'),
			array('Id_User, Id_Event, Rating', 'numerical', 'integerOnly'=>true),
			array('Id, Id_User, Id_Event, Rating, Timestamp', 'safe', 'on'=>'search'),
		);
	}

	public function relations()
	{
		return array(
			'users' => array(self::BELONGS_TO, 'User', 'Id_User'),
			'events' => array(self::BELONGS_TO, 'Events', 'Id_Event'),
		);
	}

	public function attributeLabels()
	{
		return array(
			'Id' => 'ID',
			'Id_User' => 'Id User',
			'Id_Event' => 'Id Event',
			'Rating' => 'Rating',
			'Timestamp' => 'Timestamp',
		);
	}

	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('Id',$this->Id);
		$criteria->compare('Id_User',$this->Id_User);
		$criteria->compare('Id_Event',$this->Id_Event);
		$criteria->compare('Rating',$this->Rating);
		$criteria->compare('Timestamp',$this->Timestamp,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
