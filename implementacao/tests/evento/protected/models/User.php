<?php

/**
 * This is the model class for table "users".
 *
 * The followings are the available columns in table 'users':
 * @property integer $Id
 * @property string $Name
 * @property string $Pass
 * @property string $Mail
 * @property string $Timestamp
 * @property integer $Type
 *
 * The followings are the available model relations:
 * @property Commentsevents[] $commentsevents
 * @property UsersEvents[] $usersEvents
 */
class User extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'users';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
		array('Mail,Name, Pass, Type', 'required'),
		array('Type', 'numerical', 'integerOnly'=>true),
		array('Name, Pass, Mail', 'length', 'max'=>256),
		array('Pass','length', 'min'=> 8),
		array('Mail','email'),
		array('Mail', 'unique','message'=>"Email already exists!"),
		array('Name, Mail, Timestamp, Type', 'safe', 'on'=>'search'),
		);

	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'commentsevents' => array(self::HAS_MANY, 'Commentsevents', 'Id_User'),
			'usersEvents' => array(self::HAS_MANY, 'UsersEvents', 'Id_User'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'Id' => 'ID',
			'Name' => 'Name',
			'Pass' => 'Pass',
			'Mail' => 'Mail',
			'Timestamp' => 'Signed On',
			'Type' => 'Type',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('Name',$this->Name,true);
		$criteria->compare('Mail',$this->Mail,true);
		$criteria->compare('Timestamp',$this->Timestamp,true);
		$criteria->compare('Type',$this->Type);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}


	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
