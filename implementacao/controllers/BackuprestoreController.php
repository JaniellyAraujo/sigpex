<?php

/******************************************************************
 * SIGPEX - SISTEMA  DE GERENCIAMENTO DE PROJETOS DE EXTENSÃO

 * O SigPex foi desenvolvido como Trabalho de Conclusão de Curso
 * e apresentado ao IFNMG – Campus Januária como parte das
 *  exigências do Programa de Graduação em Tecnologia em Análise
 *  e Desenvolvimento de Sistemas.
 *
 * Desenvolvido pela acadêmica: Janielly Araújo Lopes.
 * Orientadora: Cleiane Gonçalves Oliveira.
 *
 /******************************************************************/

namespace app\controllers;

use Yii;
use yii\web\Controller;
use app\models\UploadForm;
use yii\data\ArrayDataProvider;
use \yii\web\ForbiddenHttpException;
use yii\web\UploadedFile;

class BackuprestoreController extends Controller {

    public $menu = [];
    public $tables = [];
    public $fp;
    public $file_name;
    public $_path = null;
    public $back_temp_file = 'db_backup_';

    public function actions() {
        //
    }

    protected function getPath() {
        if (isset($this->module->path))
            $this->_path = $this->module->path;
        else
            $this->_path = Yii::$app->basePath . '/_backup/';

        if (!file_exists($this->_path)) {
            mkdir($this->_path);
            chmod($this->_path, '777');
        }
        return $this->_path;
    }

    public function execSqlFile($sqlFile) {
        $message = "ok";
        if (file_exists($sqlFile)) {
            $sqlArray = file_get_contents($sqlFile);

            $tables = $this->getTables();
            $query = "";
            foreach ($tables as $tableName) {
                $query = $query . "drop table if exists $tableName; ";
            }

            $LastQuery = "SET FOREIGN_KEY_CHECKS = 0; $query SET FOREIGN_KEY_CHECKS = 1;";

            $LastQuery = $LastQuery . " " . $sqlArray;
            $cmd1 = Yii::$app->db->createCommand($LastQuery);
            try {
                $cmd1->execute();
            } catch (CDbException $e) {
                $message = $e->getMessage();
            }
        }
        return $message;
    }

    public function getColumns($tableName) {
        $sql = 'SHOW CREATE TABLE ' . $tableName;
        $cmd = Yii::$app->db->createCommand($sql);
        $table = $cmd->queryOne();

        $create_query = $table['Create Table'] . ';';

        $create_query = preg_replace('/^CREATE TABLE/', 'CREATE TABLE IF NOT EXISTS', $create_query);
        $create_query = preg_replace('/AUTO_INCREMENT\s*=\s*([0-9])+/', '', $create_query);
        if ($this->fp) {
            $this->writeComment('TABLE `' . addslashes($tableName) . '`');
            $final = 'DROP TABLE IF EXISTS `' . addslashes($tableName) . '`;' . PHP_EOL . $create_query . PHP_EOL . PHP_EOL;
            fwrite($this->fp, $final);
        } else {
            $this->tables[$tableName]['create'] = $create_query;
            return $create_query;
        }
    }

    public function getData($tableName) {
        $sql = 'SELECT * FROM ' . $tableName;
        $cmd = Yii::$app->db->createCommand($sql);
        $dataReader = $cmd->query();

        $data_string = '';

        foreach ($dataReader as $data) {
            $itemNames = array_keys($data);
            $itemNames = array_map("addslashes", $itemNames);
            $items = join('`,`', $itemNames);
            $itemValues = array_values($data);
            $itemValues = array_map("addslashes", $itemValues);
            $valueString = join("','", $itemValues);
            $valueString = "('" . $valueString . "'),";
            $values = "\n" . $valueString;
            if ($values != "") {
                $data_string .= "INSERT INTO `$tableName` (`$items`) VALUES" . rtrim($values, ",") . ";" . PHP_EOL;
            }
        }

        if ($data_string == '')
            return null;

        if ($this->fp) {
            $this->writeComment('TABLE DATA ' . $tableName);
            $final = $data_string . PHP_EOL . PHP_EOL . PHP_EOL;
            fwrite($this->fp, $final);
        } else {
            $this->tables[$tableName]['data'] = $data_string;
            return $data_string;
        }
    }

    public function getTables($dbName = null) {
        $sql = 'SHOW TABLES';
        $cmd = Yii::$app->db->createCommand($sql);
        $tables = $cmd->queryColumn();
        return $tables;
    }

    public function StartBackup($addcheck = true) {
        $this->file_name = $this->path . $this->back_temp_file . date('Y.m.d_H.i.s') . '.sql';

        $this->fp = fopen($this->file_name, 'w+');

        if ($this->fp == null)
            return false;
        fwrite($this->fp, '-- -------------------------------------------' . PHP_EOL);
        if ($addcheck) {
            fwrite($this->fp, 'SET AUTOCOMMIT=0;' . PHP_EOL);
            fwrite($this->fp, 'START TRANSACTION;' . PHP_EOL);
            fwrite($this->fp, 'SET SQL_QUOTE_SHOW_CREATE = 1;' . PHP_EOL);
        }
        fwrite($this->fp, 'SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;' . PHP_EOL);
        fwrite($this->fp, 'SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;' . PHP_EOL);
        fwrite($this->fp, '-- -------------------------------------------' . PHP_EOL);
        $this->writeComment('START BACKUP');
        return true;
    }

    public function EndBackup($addcheck = true) {
        fwrite($this->fp, '-- -------------------------------------------' . PHP_EOL);
        fwrite($this->fp, 'SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;' . PHP_EOL);
        fwrite($this->fp, 'SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;' . PHP_EOL);

        if ($addcheck) {
            fwrite($this->fp, 'COMMIT;' . PHP_EOL);
        }
        fwrite($this->fp, '-- -------------------------------------------' . PHP_EOL);
        $this->writeComment('END BACKUP');
        fclose($this->fp);
        $this->fp = null;
    }

    public function writeComment($string) {
        fwrite($this->fp, '-- -------------------------------------------' . PHP_EOL);
        fwrite($this->fp, '-- ' . $string . PHP_EOL);
        fwrite($this->fp, '-- -------------------------------------------' . PHP_EOL);
    }

    public function actionCreate() {
        $message = ' are deleted.';
        $flashError = 'success';
        $flashMsg = 'success';

        $tables = $this->getTables();
        if (Yii::$app->user->can('admin')) {
            if (!$this->StartBackup()) {
                //render error
                $flashError = 'success';
                $flashMsg = 'Error: File create';
                return $this->render('index');
            }

            foreach ($tables as $tableName) {
                $this->getColumns($tableName);
            }
            foreach ($tables as $tableName) {
                $this->getData($tableName);
            }
            $this->EndBackup();

            $flashError = 'success';
            $flashMsg = 'Backup de banco de dados gerado com sucesso!!!';
            //Yii::$app->session->setFlash('success', $message);
            Yii::$app->getSession()->setFlash('info', [
                'type' => 'success',
                'icon' => 'glyphicon glyphicon-ok-sign',
                'showSeparator' => true,
                'duration' => 10000,
                'message' => 'Backup criado com sucesso.  '
                . '',
                'title' => '',
                'pluginOptions' => [
                    'showProgressbar' => true,
                    'positonY' => 'top',
                    'positonX' => 'right'
                ]
            ]);

            $this->redirect(array('index'));
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    public function actionClean($redirect = true) {
        $ignore = array('tbl_user', 'tbl_user_role', 'tbl_event');
        $tables = $this->getTables();

        if (!$this->StartBackup()) {
            //render error
            Yii::$app->user->setFlash('success', "Erro");
            return $this->render('index');
        }

        //$message = '';

        foreach ($tables as $tableName) {
            if (in_array($tableName, $ignore))
                continue;
            fwrite($this->fp, '-- -------------------------------------------' . PHP_EOL);
            fwrite($this->fp, 'DROP TABLE IF EXISTS ' . addslashes($tableName) . ';' . PHP_EOL);
            fwrite($this->fp, '-- -------------------------------------------' . PHP_EOL);

            $message .= $tableName . ',';
        }
        $this->EndBackup();

        // logout so there is no problme later .
        Yii::$app->user->logout();

        $this->execSqlFile($this->file_name);
        unlink($this->file_name);
        $message .= ' are deleted.';
        Yii::$app->session->setFlash('success', $message);
        return $this->redirect(array('index'));
    }

    public function actionDelete($filename = null) {
        //$flashError = '';
        //$flashMsg = '';

        $file = $filename;

        $this->updateMenuItems();
        if (Yii::$app->user->can('admin')) {
            if (isset($file)) {
                $sqlFile = $this->path . basename($file);
                if (file_exists($sqlFile)) {
                    unlink($sqlFile);
                    Yii::$app->getSession()->setFlash('info', [
                        'type' => 'error',
                        'icon' => 'glyphicon glyphicon-ok-sign',
                        'showSeparator' => true,
                        'duration' => 10000,
                        'message' => 'Backup excluído com sucesso.'
                        . '',
                        'title' => '',
                        'pluginOptions' => [
                            'showProgressbar' => true,
                            'positonY' => 'top',
                            'positonX' => 'right'
                        ]
                    ]);
                    //$flashMsg = 'Banco de Dados: ' . $sqlFile . ' excluído.';
                } else {
                    $flashError = 'error';
                    $flashMsg = ' ' . $sqlFile . ' Banco de dados não encontrado.';
                }
            } else {
                $flashError = 'error';
                $flashMsg = 'Arquivo não encontrado.';
            }
            //\Yii::$app->getSession()->setFlash($flashError, $flashMsg);
            $this->redirect(array('index'));
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    public function actionDownload($file = null) {
        $this->updateMenuItems();
        if (Yii::$app->user->can('admin')) {
            if (isset($file)) {
                $sqlFile = $this->path . basename($file);
                if (file_exists($sqlFile)) {
                    $request = Yii::$app->getRequest();
                    $request->sendFile(basename($sqlFile), file_get_contents($sqlFile));
                }
            }
            throw new CHttpException(404, Yii::t('app', 'Arquivo não encontrado'));
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    public function actionIndex() {

        $this->updateMenuItems();
        $path = $this->path;
        $dataArray = array();

        $list_files = glob($path . '*.sql');
        if (Yii::$app->user->can('admin')) {
            if ($list_files) {
                $list = array_map('basename', $list_files);
                sort($list);
                foreach ($list as $id => $filename) {
                    $columns = array();
                    $columns['id'] = $id;
                    $columns['name'] = basename($filename);
                    $columns['size'] = filesize($path . $filename);

                    $columns['create_time'] = date('d-m-Y H:i:s', filectime($path . $filename));
                    $columns['modified_time'] = date('d-m-Y H:i:s', filemtime($path . $filename));

                    $dataArray[] = $columns;
                }
            }
            $dataProvider = new ArrayDataProvider(['allModels' => $dataArray]);
            return $this->render('index', array(
                        'dataProvider' => $dataProvider,
            ));
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    public function actionSyncdown() {
        $tables = $this->getTables();

        if (!$this->StartBackup()) {
            //render error
            return $this->render('index');
        }

        foreach ($tables as $tableName) {
            $this->getColumns($tableName);
        }
        foreach ($tables as $tableName) {
            $this->getData($tableName);
        }
        $this->EndBackup();
        return $this->actionDownload(basename($this->file_name));
    }

    public function actionRestore($filename = NULL) {
        //$flashError = '';
        //$flashMsg = '';

        $file = $filename;

        $this->updateMenuItems();
        $sqlFile = $this->path . basename($file);

        if (Yii::$app->user->can('admin')) {
            if (isset($file)) {
                $sqlFile = $this->path . basename($file);

                $flashError = 'success';
                $flashMsg = 'Restauração do banco de dados com sucesso!';
            } else {
                $flashError = 'error';
                $flashMsg = 'Erro: nome de arquivo incorreto!';
            }
            $this->execSqlFile($sqlFile);

            \Yii::$app->getSession()->setFlash($flashError, $flashMsg);
            $this->redirect(array('index'));
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    public function actionUpload() {

        $model = new UploadForm();
        if (Yii::$app->user->can('admin')) {
            if (isset($_POST['UploadForm'])) {
                $model->attributes = $_POST['UploadForm'];
                //oe change cUploaded for this
                $model->upload_file = UploadedFile::getInstance($model, 'upload_file');
                if ($model->upload_file->saveAs($this->path . $model->upload_file)) {
                    // redirect to success page
                    return $this->redirect(array('index'));
                }
            }

            return $this->render('upload', array('model' => $model));
        } else {
            throw new ForbiddenHttpException('Você não tem permissão para acessar esta página.');
        }
    }

    protected function updateMenuItems($model = null) {
        // create static model if model is null
        if ($model == null)
            $model = new UploadForm();

        switch ($this->action->id) {
            case 'restore': {
                    $this->menu[] = array('label' => Yii::t('app', 'Visualizar'), 'url' => Yii::$app->HomeUrl);
                }
            case 'create': {
                    $this->menu[] = array('label' => Yii::t('app', 'Listar Backup'), 'url' => array('index'));
                }
                break;
            case 'upload': {
                    $this->menu[] = array('label' => Yii::t('app', 'Criar Backup'), 'url' => array('create'));
                }
                break;
            default: {
                    $this->menu[] = array('label' => Yii::t('app', 'Listar Backup'), 'url' => array('index'));
                    $this->menu[] = array('label' => Yii::t('app', 'Criar Backup'), 'url' => array('create'));
                    $this->menu[] = array('label' => Yii::t('app', 'Enviar Backup'), 'url' => array('upload'));
                    $this->menu[] = array('label' => Yii::t('app', 'Restaurar Backup'), 'url' => array('restore'));
                    //$this->menu[] = array('label' => Yii::t('app', 'Limpar Database'), 'url' => array('clean'));
                    //$this->menu[] = array('label' => Yii::t('app', 'Visualizar Site'), 'url' => Yii::$app->HomeUrl);
                }
                break;
        }
    }

}
