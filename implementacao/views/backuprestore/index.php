<div class="body">
    <div class="responsivve">
    <div class="backup-default-index">


        <?php if (Yii::$app->session->hasFlash('success')): ?>
            <div class="alert alert-success">
                <?php echo Yii::$app->session->getFlash('success'); ?>
            </div>
        <?php endif; ?>


        <div class="row">
            <div class="col-md-12">
                <?php
                echo $this->render('_list', array(
                    'dataProvider' => $dataProvider
                ));
                ?>
            </div>
        </div>
      </div>
    </div>
</div>