<?php

/* @var $this \yii\web\View */

/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use \machour\yii2\notifications\widgets\NotificationsWidget;
use yii\widgets\Pjax;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?= NotificationsWidget::widget([
    'theme' => NotificationsWidget::THEME_GROWL,
    'delay' => 2000,
    'pollInterval' => 2000,
    'clientOptions' => [
        'location' => 'br',
    ],
    'counters' => [
        '.notifications-header-count',
        '.notifications-icon-count'
    ],
    'markAllSeenSelector' => '#notification-seen-all',
    'listSelector' => '#notifications',
]);
?>
<?php $this->beginBody() ?>

<?php Pjax::begin(['id' => 'menuPjaxContent']); ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => Yii::$app->name,
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
            [
                'label' => 'Users',
                'url' => ['/site/index'],
                'linkOptions' => ['data-pjax' => '0']
            ],
            !Yii::$app->user->isGuest ?
                [
                    'label' => 'Account',
                    'url' => ['/site/score-actions'],
                    'linkOptions' => ['data-pjax' => '0']
                ] :
                '',
            Yii::$app->user->isGuest ? (
            [
                'label' => 'Login',
                'url' => ['/site/login'],
                'linkOptions' => ['data-pjax' => '0']
            ]
            ) : (
                '<li>'
                . Html::beginForm(['/site/logout'], 'post', ['data-pjax' => '0'])
                . Html::submitButton(
                    'Logout (' . Yii::$app->user->identity->username . ' : ' . Yii::$app->user->identity->score . ')',
                    ['class' => 'btn btn-link logout']
                )
                . Html::endForm()
                . '</li>'
            )
        ],
    ]);
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>

<?php Pjax::end(); ?>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; My Company <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
