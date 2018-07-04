<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\ScoreActionsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Events with Score');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="score-actions-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'label' => 'Action',
                'value' => function($model) {
                    if($model->sender_id === Yii::$app->user->id){
                        return 'Sent to ' . $model->receiver->username;
                    }
                    return 'Received from ' . $model->receiver->username;
                }
            ],
            'amount',
            [
                'label' => 'Created Time',
                'attribute' => 'created_at',
                'value' => function ($model) {
                    return date('Y-m-d H:i:s', $model->created_at);
                }
            ],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
