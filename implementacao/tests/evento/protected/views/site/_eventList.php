<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Razvan
 * Date: 4/21/14
 * Time: 4:11 PM
 * To change this template use File | Settings | File Templates.
 */


$ok = false;

?>

<div class="container-fluid">


<?php foreach($events as $event): ?>

    <div class="row story">

        <div class="span3">
            <div class="storymainimage">
                <?php

                if($event['MainImagePath'] != null && $event['MainImagePath'] != ''){

                    $media = $event['MainImagePath'];
                    echo '<IMG SRC="',$media,'" style="padding-top: 0px;"/>';

                    }
                    else{

                    $category = Categories::model()->findByPk($event['Id_Category']);
                    $media = $category->MainPhotoPath;
                    echo '<IMG SRC="',$media,'" style="padding-top: 0px;"/>';
                }
                ?>
            </div>
        </div>


        <div class="span9">

        <?php
        if($event['Link'] != null && $event['Link'] != ''){

        $media = $event['Link'];
        echo '<a href="', $media, '" class="title">'.$event['Title'].'</a>';

        }
        else{

           echo CHtml::link($event['Title'],array('events/view',
                'id'=>$event['Id']),array('class'=>'title'));
        }

        ?>
            <h5>
                <?php

                if($event['PublishedBy'] != null){

                    $editor = User::model()->findByPk($event['PublishedBy']);

                    $editorName = $editor->Name;

                    echo "By"." ".$editorName;
                }

                echo " • ";

                if($event['PublishedAt'] != null){

                    echo "At ".$event['PublishedAt'];
                }

                if($event['StartDate'] != null && $event['StartDate'] != '' && $event['EndDate'] != null && $event['EndDate'] != ''){

                    echo " • "."Between ".$event['StartDate']." and ".$event['EndDate'];


                }

                ?>


            </h5>
            <p>
                <?php


                if($event['Headline'] != null && $event['Headline'] != ''){

                    echo $event['Headline'];
                }
                else{

                    if($event['Content'] != null && $event['Content'] != ''){

                        if(strlen($event['Content']) > 50){
                            echo substr($event['Content'], 0, 50)."...";

                        }
                        else{
                            echo $event['Content'];
                        }

                    }
                    else{
                        echo 'No information.';
                    }

                }

                ?>

            </p>

            <h5>
        <?php



            ?>

            </h5>



        <?php

            echo CHtml::link('Read More',array('events/view',
                'id'=>$event['Id']),array('class'=>'pull-left btn btn-inverse btn-border'));


            $ok = true;
            ?>
        </div>

    </div>
    <br />

<?php endforeach; ?>


<?php if (!$ok) : ?>
<div class="alert alert-info">
Sorry, no events for the moment.
</div>
<?php endif; ?>

</div>
