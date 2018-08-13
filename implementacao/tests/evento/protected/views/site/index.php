<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;
?>

    <div class="row-fluid js-mainContainer">

    <div class="article_list js-eventsList span9">
        <?php  $this->renderPartial('_eventList',array(
            'events'=> $events
        )); ?>
    </div>

    <div class="span3">

        <div class="well">
            <div class="form-search js-categoryContainer">
                <h5>EVENT TYPE</h5>

                <?php foreach($categories as $category): ?>
                <div class="js-checkboxCategory" data-id="<?php echo $category['Id']; ?>">
                    <label>
                        <input type="checkbox" /> <?php echo $category['Name']; ?>
                    </label>
                </div>

                <?php endforeach; ?>

            </div>
        </div>

    </div>

    </div>

<script>


    $('.js-mainContainer').find('.js-categoryContainer').find('.js-checkboxCategory' + ' :checkbox').each(
        function () {

            $(this).attr('checked',false);
        }
    );

$('.js-mainContainer').on('click','.js-checkboxCategory :input', function(ev){

    var categoriesList = [];
    var $searchContainer = $('.js-mainContainer').find('.js-categoryContainer');
    $searchContainer.find('.js-checkboxCategory' + ' :checkbox').each(function () {
        if ($(this).prop('checked')) {
            var currentValue = $(this).parents('.js-checkboxCategory').attr('data-id');
            categoriesList.push(currentValue);
        }
    });

    $.ajax({
        type: 'post',
        url:  'site/filter' ,
        data:  {
            categories:categoriesList
        },
        success: function(html){
            $('.js-eventsList').html(html);
        },
        error: function(){
            console.log('Error')
        }
    });


});


</script>

