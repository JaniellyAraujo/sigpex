<?php

/**
 * This is the model class for table "countries".
 *
 * The followings are the available columns in table 'countries':
 * @property string $Code
 * @property string $Name
 * @property string $Continent
 * @property string $Region
 * @property double $SurfaceArea
 * @property integer $IndepYear
 * @property integer $Population
 * @property double $LifeExpectancy
 * @property double $GNP
 * @property double $GNPOld
 * @property string $LocalName
 * @property string $GovernmentForm
 * @property string $HeadOfState
 * @property integer $Capital
 * @property string $Code2
 *
 * The followings are the available model relations:
 * @property Cities[] $cities
 * @property Events[] $events
 */
class Countries extends CActiveRecord
{
	public function tableName()
	{
		return 'countries';
	}

	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('IndepYear, Population, Capital', 'numerical', 'integerOnly'=>true),
			array('SurfaceArea, LifeExpectancy, GNP, GNPOld', 'numerical'),
			array('Code', 'length', 'max'=>3),
			array('Name', 'length', 'max'=>52),
			array('Continent', 'length', 'max'=>13),
			array('Region', 'length', 'max'=>26),
			array('LocalName, GovernmentForm', 'length', 'max'=>45),
			array('HeadOfState', 'length', 'max'=>60),
			array('Code2', 'length', 'max'=>2),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, GNPOld, LocalName, GovernmentForm, HeadOfState, Capital, Code2', 'safe', 'on'=>'search'),
		);
	}

	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'cities' => array(self::HAS_MANY, 'Cities', 'CountryCode'),
			'events' => array(self::HAS_MANY, 'Events', 'Id_Country'),
		);
	}

	public function attributeLabels()
	{
		return array(
			'Code' => 'Code',
			'Name' => 'Name',
			'Continent' => 'Continent',
			'Region' => 'Region',
			'SurfaceArea' => 'Surface Area',
			'IndepYear' => 'Indep Year',
			'Population' => 'Population',
			'LifeExpectancy' => 'Life Expectancy',
			'GNP' => 'Gnp',
			'GNPOld' => 'Gnpold',
			'LocalName' => 'Local Name',
			'GovernmentForm' => 'Government Form',
			'HeadOfState' => 'Head Of State',
			'Capital' => 'Capital',
			'Code2' => 'Code2',
		);
	}

	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('Code',$this->Code,true);
		$criteria->compare('Name',$this->Name,true);
		$criteria->compare('Continent',$this->Continent,true);
		$criteria->compare('Region',$this->Region,true);
		$criteria->compare('SurfaceArea',$this->SurfaceArea);
		$criteria->compare('IndepYear',$this->IndepYear);
		$criteria->compare('Population',$this->Population);
		$criteria->compare('LifeExpectancy',$this->LifeExpectancy);
		$criteria->compare('GNP',$this->GNP);
		$criteria->compare('GNPOld',$this->GNPOld);
		$criteria->compare('LocalName',$this->LocalName,true);
		$criteria->compare('GovernmentForm',$this->GovernmentForm,true);
		$criteria->compare('HeadOfState',$this->HeadOfState,true);
		$criteria->compare('Capital',$this->Capital);
		$criteria->compare('Code2',$this->Code2,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
