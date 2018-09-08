<?php
/* * ****************************************************************
 * SIGPEX - SISTEMA  DE GERENCIAMENTO DE PROJETOS DE EXTENSÃO

 * O SigPex foi desenvolvido como Trabalho de Conclusão de Curso
 * e apresentado ao IFNMG – Campus Januária como parte das
 *  exigências do Programa de Graduação em Tecnologia em Análise
 *  e Desenvolvimento de Sistemas.
 *
 * Desenvolvido pela acadêmica: Janielly Araújo Lopes.
 * Orientadora: Cleiane Gonçalves Oliveira.
 *
  /***************************************************************** */

use yii\helpers\Html;
use kartik\grid\GridView;
use yii\helpers\Url;

$this->title = 'Base de Dados - Administrador';
?>
<div class="responsive">

    <div class="panel panel-info">

        <div class="panel-heading">
            <h5 class="panel-title"><i class="fa fa-database"></i> BACKUP</h5>
        </div>

        <div class="box-body">
            <div class="pull-right">       

                <?= Html::a('<i class="glyphicon glyphicon-plus"></i>  Criar Backup ', ['create'], ['class' => 'btn btn-success create-backup margin-right5']) ?>

            </div><br>

            <!-- BEGIN SAMPLE TABLE PORTLET-->
            <?php
            echo
            GridView::widget([
                'id' => 'install-grid',
                'export' => false,
                'dataProvider' => $dataProvider,
                'resizableColumns' => false,
                'showPageSummary' => false,
                'headerRowOptions' => ['class' => 'kartik-sheet-style'],
                'filterRowOptions' => ['class' => 'kartik-sheet-style'],
                'summary' => "Exibindo <strong> {begin}</strong> - <strong>{end}</strong> de <strong>{totalCount}</strong> itens",
                
                //'responsive' => true,
                'hover' => true,
                'panel' => [
                //'heading' => '<h4 class="body"></h4>',
                //'type' => 'primary',
                //'showFooter' => false
                ],
                // set your toolbar
                'toolbar' => [
                        ['content' =>
                        Html::a('<i class="glyphicon glyphicon-plus"></i>  Criar Backup ', ['create'], ['class' => 'btn btn-success create-backup margin-right5'])
                    ],
                ],
                'columns' => array(
                    'name',
                    'size:size',
                    'create_time',
                    'modified_time:relativeTime',
                        [
                        'class' => 'kartik\grid\ActionColumn',
                        'template' => '{restore_action}',
                        'header' => 'Restaurar',
                        'buttons' => [
                            'restore_action' => function ($url, $model) {
                                return Html::a('<span class="glyphicon glyphicon-import"></span>', $url, [
                                            'title' => 'Restaurar', 'class' => 'restore'
                                ]);
                            }
                        ],
                        'urlCreator' => function ($action, $model, $key, $index) {
                            if ($action === 'restore_action') {
                                $url = Url::to(['backuprestore/restore', 'filename' => $model['name']]);
                                return $url;
                            }
                        }
                    ],
                        [
                        'class' => 'kartik\grid\ActionColumn',
                        'template' => '{delete_action}',
                        'header' => 'Excluir',
                        'buttons' => [
                            'delete_action' => function ($url, $model) {
                                return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                            'title' => Yii::t('app', 'Excluir Base de Dados'), 'class' => 'delete',
                                ]);
                            }
                        ],
                        'urlCreator' => function ($action, $model, $key, $index) {
                            if ($action === 'delete_action') {
                                $url = Url::to(['backuprestore/delete', 'filename' => $model['name']]);
                                return $url;
                            }
                        }
                    ],
                ),
            ]);
            ?>
        </div>
    </div>
</div>



