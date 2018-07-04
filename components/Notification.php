<?php

namespace components;

namespace app\components;

use app\models\application\Users;
use Yii;
use machour\yii2\notifications\models\Notification as BaseNotification;

class Notification extends BaseNotification
{
    /**
     * Key For Send Error Message
     */
    const KEY_ERROR_TRANSFER_MESSAGE = 'error_transfer_message';
    /**
     * Key For Send Success Message
     */
    const KEY_SUCCESS_TRANSFER_MESSAGE = 'success_transfer_message';

    /**
     * @var array Holds all usable notifications
     */
    public static $keys = [
        self::KEY_SUCCESS_TRANSFER_MESSAGE,
        self::KEY_ERROR_TRANSFER_MESSAGE,
    ];

    /**
     * @var Users|null
     */
    public $sender;

    /**
     * @var Users|null
     */
    public $receiver;

    public function rules()
    {
        return array_merge(
            parent::rules(),
            [
                ['sender', 'filter', 'filter' => function ($value) {
                    return $this->user_id ? Users::findOne($this->user_id) : null;
                }],
                ['receiver', 'filter', 'filter' => function ($value) {
                    return $this->key_id ? Users::findOne($this->key_id) : null;
                }]
            ]
        );
    }

    /**
     * @inheritdoc
     */
    public function getTitle()
    {
        switch ($this->key) {
            case self::KEY_SUCCESS_TRANSFER_MESSAGE:
                return Yii::t('app', 'Transfer ended successfully.');

            case self::KEY_ERROR_TRANSFER_MESSAGE:
                return Yii::t('app', 'Transfer resulted in an error.');
        }
    }

    /**
     * @inheritdoc
     */
    public function getDescription()
    {
        switch ($this->key) {
            case self::KEY_SUCCESS_TRANSFER_MESSAGE:
            case self::KEY_ERROR_TRANSFER_MESSAGE:
                return Yii::t('app', 'Transfer from - {sender_name}, to - {recipient_name}.', [
                    'sender_name' => $this->sender ? $this->sender->username : 'You',
                    'recipient_name' => $this->receiver ? $this->receiver->username : 'recipient'
                ]);
        }
    }

    /**
     * @inheritdoc
     */
    public function getRoute()
    {
        switch ($this->key) {
            case self::KEY_SUCCESS_TRANSFER_MESSAGE:
            case self::KEY_ERROR_TRANSFER_MESSAGE:
            default:
                return ['site/index'];
        }
    }

}