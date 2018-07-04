<?php

namespace app\controllers;

use app\components\Notification;
use app\models\application\Users;
use app\models\basic\ScoreActions;
use app\models\forms\TransferForm;
use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\forms\LoginForm;

class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'index'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                    [
                        'actions' => ['index'],
                        'allow' => true,
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function beforeAction($action)
    {
        return parent::beforeAction($action);

    }

    /**
     * Lists all Users models.
     * @return mixed
     */
    public function actionIndex()
    {
        $query = Users::find();
        if(!Yii::$app->user->isGuest){
            $query->andWhere(['!=', 'id', Yii::$app->user->id]);
        }
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'defaultPageSize' => 10,
                'pageSize' => 10,
                'pageSizeLimit' => [1, 10]
            ],
            'sort'=> ['defaultOrder' => ['score'=>SORT_DESC]]
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Lists all ScoreActions models.
     * @return mixed
     */
    public function actionScoreActions()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => ScoreActions::find()
                ->where([
                    'or',
                    ['sender_id' => Yii::$app->user->id],
                    ['receiver_id' => Yii::$app->user->id]
                ]),
            'pagination' => [
                'defaultPageSize' => 10,
                'pageSize' => 10,
                'pageSizeLimit' => [1, 10]
            ],
            'sort'=> ['defaultOrder' => ['created_at'=>SORT_DESC]]
        ]);

        return $this->render('score_actions', [
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionTransfer($username, $amount){
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

        $form = new TransferForm(['username' => $username, 'amount' => $amount]);

        if(Yii::$app->request->isAjax && $form->validate() && $form->transfer()){

            Yii::$app->response->statusCode = 200;

            Notification::success(
                Notification::KEY_SUCCESS_TRANSFER_MESSAGE,

                $form->getReceiver() ? $form->getReceiver()->id : null,
                $form->getSender() ? $form->getSender()->id : null
            );
        } else {
            Notification::error(
                Notification::KEY_ERROR_TRANSFER_MESSAGE,
                $form->getReceiver() ? $form->getReceiver()->id : null,
                $form->getSender() ? $form->getSender()->id : null
            );

            Yii::$app->response->statusCode = 422;

            Yii::$app->response->data = $form->errors;
        }
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }

        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }
}
