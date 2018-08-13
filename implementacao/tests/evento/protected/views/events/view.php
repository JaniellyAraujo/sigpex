<?php
/* @var $this EventsController */
/* @var $model Events */

$participate = false;
?>


<style>
    table,th,td
    {
        border:1px solid black;
        border-collapse:collapse;
    }
    th,td
    {
        padding:5px;
    }
</style>


<?php

Yii::import('ext.jquery-gmap.*');

$gmap = new EGmap3Widget();
$gmap->setSize(1170, 300);

$options = array(
'scaleControl' => true,
'streetViewControl' => false,
'zoom' => 1,
'center' => array(0, 0),
'mapTypeId' => EGmap3MapTypeId::HYBRID,
'mapTypeControlOptions' => array(
'style' => EGmap3MapTypeControlStyle::DROPDOWN_MENU,
'position' => EGmap3ControlPosition::TOP_CENTER,
),
'zoomControlOptions' => array(
'style' => EGmap3ZoomControlStyle::SMALL,
'position' => EGmap3ControlPosition::BOTTOM_CENTER
),
);
$gmap->setOptions($options);

$marker = new EGmap3Marker(array('title' => 'Event Location'));
$countryName = Countries::model()->findByPk($model->Id_Country)->Name;
$cityName = Cities::model()->findByPk($model->Id_City)->Name;
$marker->address = $model->Address.",".$cityName.",".$countryName;
$marker->centerOnMap();
$marker->setMapZoom(8);
$gmap->add($marker);

?>

<div class="span12 pagination-centered">

<div class="row-fluid">

    <div class="post js-post">

    <h2> <?php

        if($model->Link != null && $model->Link != ''){

            $media = $model->Link;
            echo '<a href="', $media, '">'.$model->Title.'</a>';

        }
        else{

            echo CHtml::link($model->Title,array('events/view',
                'id'=>$model->Id));
        }

        ?></h2>

    <div class="meta-wrap">
            <div class="pull-left">
                <h5>
                    <?php

                    $publisher = User::model()->findByPk($model->PublishedBy);

                    $category = Categories::model()->findByPk($model->Id_Category);

                    echo "By ".$publisher->Name." • "."At ".$model->PublishedAt." • ".$category->Name." • "."Between ".$model->StartDate." and ".$model->EndDate;



                    ?>
                </h5>
            </div>

            <div class="post-share pull-right" style="padding-right: 10px">
                <div class="meta-comments pull-right">
                    <a href="#participants">PARTICIPATING<div class="comments-bubble pull-right"><?php echo sizeof($users)?></div></a>
                </div>
            </div>

        </div>

    <?php $gmap->renderMap(); ?>

    <div class="span12" style="padding-top: 20px; margin-left: 0px;">
    <?php

    if($model->MainImagePath != null && $model->MainImagePath != ''){

    $media = $model->MainImagePath;

    echo '<IMG SRC="',Yii::app()->getBaseUrl()."/".$media,'" class="attachment-post-thumbnail pull-right"/>';

    }

    else{

        $category = Categories::model()->findByPk($model->Id_Category);
        $media = $category->MainPhotoPath;
        echo '<IMG SRC="',Yii::app()->getBaseUrl()."/".$media,'" class="attachment-post-thumbnail pull-right"/>';
    }

    ?>

    <h2>
            <?php

            if($model->Headline != null && $model->Headline != ''){


                echo $model->Headline;

            }
            ?>

        </h2>

    <p>
        <?php

        if($model->Content != null && $model->Content != ''){


            echo $model->Content;

        }
        ?>
    </p>

    </div>

    <div id="participants" class="span12 js-participants" style="padding-top: 20px; margin-left: 0px;">

        <?php if($users!= null) : ?>
        <table>
            <tr>
                <th>Name</th>
                <th>Role</th>
                <th>Email</th>
            </tr>

        <?php foreach($users as $user) : ?>
            <tr>
                <td><?php echo $user['Name'] ?></td>
                <td><?php echo $user['Type'] == 4 ? "Admin" :($user['Type'] == 3 ? "Editor" : ($user['Type'] == 2 ? "Organizer" : "Normal")) ?></td>
                <td><?php echo $user['Mail'] ?></td>
             </tr>
        <?php endforeach; ?>

        </table>
        <?php endif; ?>

    </div>


        <div class="row-fluid">
            <?php

            foreach($users as $user){

                if($user['Id_User'] == Yii::app()->user->id){
                    $participate = true;
                }
            }

            ?>

            <?php if($participate == true && !Yii::app()->user->isGuest ) : ?>
            <button class="btn btn-danger pull-right js-annul">Annul</button>
            <?php endif; ?>

            <?php if($participate == false && !Yii::app()->user->isGuest) : ?>
                <button class="btn btn-success pull-left js-participate" >Participate</button>
            <?php endif; ?>


        </div>

    </div>

    </div>

</div>


<script>

    var $postContainer = $('.js-post');
    var $annulBtn = $postContainer.find('.js-annul');
    var $participateBtn = $postContainer.find('.js-participate');

    var eventId = <?php echo $model->Id ?>;
    var userId = <?php echo Yii::app()->user->id ?>;

    $postContainer.on('click','.js-annul',function(ev){

        $.ajax({
            type: 'post',
            url:  'ChangeParticipationStatus' ,
            data:  {
                participate:false,
                eventId:eventId,
                userId:userId
            },
            success: function(){
                window.location.reload(true);
            },
            error: function(){
                console.log('error annul');
            }
        });
    });

    $postContainer.on('click','.js-participate',function(ev){

        $.ajax({
            type: 'post',
            url:  'ChangeParticipationStatus' ,
            data:  {
                participate:true,
                eventId:eventId,
                userId:userId
            },
            success: function(){
                window.location.reload(true);
            },
            error: function(){
                console.log('error participate');
            }
        });
    });


</script>