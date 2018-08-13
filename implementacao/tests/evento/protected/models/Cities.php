<?php

/**
 * This is the model class for table "cities".
 *
 * The followings are the available columns in table 'cities':
 * @property integer $ID
 * @property string $Name
 * @property string $CountryCode
 * @property string $District
 * @property integer $Population
 *
 * The followings are the available model relations:
 * @property Countries $countryCode
 * @property Events[] $events
 */
class Cities extends CActiveRecord
{

	public function tableName()
	{
		return 'cities';
	}


	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('Population', 'numerical', 'integerOnly'=>true),
			array('Name', 'length', 'max'=>35),
			array('CountryCode', 'length', 'max'=>3),
			array('District', 'length', 'max'=>20),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('ID, Name, CountryCode, District, Population', 'safe', 'on'=>'search'),
		);
	}


	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'countryCode' => array(self::BELONGS_TO, 'Countries', 'CountryCode'),
			'events' => array(self::HAS_MANY, 'Events', 'Id_City'),
		);
	}


	public function attributeLabels()
	{
		return array(
			'ID' => 'ID',
			'Name' => 'Name',
			'CountryCode' => 'Country Code',
			'District' => 'District',
			'Population' => 'Population',
		);
	}

	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('ID',$this->ID);
		$criteria->compare('Name',$this->Name,true);
		$criteria->compare('CountryCode',$this->CountryCode,true);
		$criteria->compare('District',$this->District,true);
		$criteria->compare('Population',$this->Population);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}


	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
