<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use kartik\slider\Slider;
use app\models\application\Users;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Public Users');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="users-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(['id' => 'userPjaxContent']); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'username',
            'score',
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{register}{slider}{approve}',
                'options' => [
                    'class' => 'block--actions '
                ],
                'visibleButtons' => [
                    'approve' => !Yii::$app->user->isGuest,
                    'slider' => !Yii::$app->user->isGuest,
                    'register' => Yii::$app->user->isGuest,
                ],
                'buttons' => [
                    'register' => function ($url, $model) {
                        return Html::a(
                            '<span class="glyphicon glyphicon-user"></span>',
                            '/site/login',
                            [
                                'title' => 'Register | Login',
                            ]
                        );
                    },
                    'approve' => function ($url, $model) {
                        return Html::button(
                            '<span class="glyphicon glyphicon-arrow-down"></span>',
                            [
                                'title' => 'Approve',
                                'class' => 'js-approve-transfer',
                                'data-username' => $model->username,
                                'data-url' => \yii\helpers\Url::toRoute(['site/transfer', 'username' => $model->username, 'amount' => ''])
                            ]
                        );
                    },
                    'slider' => function ($url, $model) {
                        return '<div class="col-md-10">' . Slider::widget([
                                'value' => 0,
                                'name' => 'slider_user_' . $model->username,
                                'pluginOptions' => [
                                    'min' => 0,
                                    'max' => Yii::$app->user->identity->score - Users::MIN_VALUE_SCORE,
                                    'step' => 0.01,
                                    'tooltip' => 'always',
                                    'precision' => 2,
                                    'handle' => 'triangle',
                                ],
                                'options' => [
                                    'disabled' => (Yii::$app->user->identity->score - Users::MIN_VALUE_SCORE) <= 0
                                ]
                            ]) . '</div>';
                    },
                ],
            ],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
