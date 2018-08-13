<?php

/**
 * This is the model class for table "categories".
 *
 * The followings are the available columns in table 'categories':
 * @property integer $Id
 * @property string $Name
 * @property string $MainPhotoPath
 * @property string $Timestamp
 *
 * The followings are the available model relations:
 * @property Events[] $events
 */
class Categories extends CActiveRecord
{

	public function tableName()
	{
		return 'categories';
	}

	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('Name, MainPhotoPath, Timestamp', 'required'),
			array('Name', 'length', 'max'=>256),
			array('MainPhotoPath', 'length', 'max'=>512),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('Id, Name, MainPhotoPath, Timestamp', 'safe', 'on'=>'search'),
		);
	}

	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'events' => array(self::HAS_MANY, 'Events', 'Id_Category'),
		);
	}

	public function attributeLabels()
	{
		return array(
			'Id' => 'ID',
			'Name' => 'Name',
			'MainPhotoPath' => 'Main Photo Path',
			'Timestamp' => 'Timestamp',
		);
	}

	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('Id',$this->Id);
		$criteria->compare('Name',$this->Name,true);
		$criteria->compare('MainPhotoPath',$this->MainPhotoPath,true);
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
