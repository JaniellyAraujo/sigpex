<?php

/**
 * This is the model class for table "events".
 *
 * The followings are the available columns in table 'events':
 * @property integer $Id
 * @property string $Title
 * @property string $Link
 * @property string $Headline
 * @property string $MainImagePath
 * @property string $Content
 * @property integer $PublishedBy
 * @property string $PublishedAt
 * @property integer $Id_Category
 * @property string $Address
 * @property integer $Id_City
 * @property string $Id_Country
 * @property string $StartDate
 * @property string $EndDate
 *
 * The followings are the available model relations:
 * @property Commentsevents[] $commentsevents
 * @property Cities $idCity
 * @property Countries $idCountry
 * @property Categories $idCategory
 * @property UsersEvents[] $usersEvents
 */
class Events extends CActiveRecord
{

    public $city_search;
    public $country_search;
    public $category_search;
    public $image;

	public function tableName()
	{
		return 'events';
	}

    // date comparer for startdate & enddate validation
	public function rules()
	{


		return array(
			array('Title, Content, PublishedBy, PublishedAt, Id_Category, Address, Id_City, Id_Country, StartDate, EndDate', 'required'),
			array('PublishedBy, Id_Category, Id_City', 'numerical', 'integerOnly'=>true),
			array('Title, Link, Headline', 'length', 'max'=>256),
			array('MainImagePath, Address', 'length', 'max'=>512),
			array('Id_Country', 'length', 'max'=>3),
            array('StartDate',
                'compare',
                'compareAttribute' => 'EndDate',
                'operator' => '<',
                'allowEmpty'=> false,
                'message' => 'Begin date must be before finish date.'
            ),
            array('EndDate',
                'compare',
                'compareAttribute' => 'StartDate',
                'operator' => '>',
                'allowEmpty'=> false,
                'message' => 'End date must be after begin date.'
            ),
            array('image',
                'file', 'types'=>'jpg, gif, png', 'safe'=>true,'allowEmpty'=>true),
            array('Title, category_search, Address, city_search, country_search, StartDate, EndDate', 'safe', 'on'=>'search'),
		);
	}

	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'commentsevents' => array(self::HAS_MANY, 'CommentsEvents', 'Id_Event'),
			'city' => array(self::BELONGS_TO, 'Cities', 'Id_City'),
			'country' => array(self::BELONGS_TO, 'Countries', 'Id_Country'),
			'category' => array(self::BELONGS_TO, 'Categories', 'Id_Category'),
			'usersEvents' => array(self::HAS_MANY, 'UsersEvents', 'Id_Event'),
		);
	}

	public function attributeLabels()
	{
		return array(
			'Title' => 'Title',
			'Link' => 'Link',
			'Headline' => 'Headline',
			'MainImagePath' => 'Main Image',
			'Content' => 'Content',
			'Id_Category' => 'Category',
			'Address' => 'Address',
			'Id_City' => 'City',
			'Id_Country' => 'Country',
			'StartDate' => 'Start Date',
			'EndDate' => 'End Date',
            'category_search' => 'Category',
            'country_search' => 'Country',
            'city_search' => 'City',
            'image' => 'Image / Cover'
		);
	}

	public function search()
	{
		$criteria=new CDbCriteria;
        $criteria->with = array( 'city','country','category' );
		$criteria->compare('Title',$this->Title,true);
        $criteria->compare('category.Name', $this->category_search, true );
		$criteria->compare('Address',$this->Address,true);
		$criteria->compare('city.Name',$this->city_search,true);
		$criteria->compare('country.Name',$this->country_search,true);
		$criteria->compare('StartDate','>'.$this->StartDate,true);
		$criteria->compare('EndDate','<'.$this->EndDate,true);

        return new CActiveDataProvider( $this, array(
            'criteria'=>$criteria,
            'sort'=>array(
                'attributes'=>array(
                    'category_search'=>array(
                        'asc'=>'category.Name',
                        'desc'=>'category.Name DESC',
                    ),
                    'country_search'=>array(
                        'asc'=>'country.Name',
                        'desc'=>'country.Name DESC',
                    ),
                    'city_search'=>array(
                        'asc'=>'city.Name',
                        'desc'=>'city.Name DESC',
                    ),
                    '*',
                ),
            ),
        ));
	}

	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
