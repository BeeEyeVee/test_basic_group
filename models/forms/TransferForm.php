<?php

namespace app\models\forms;

use app\models\application\ScoreActions;
use app\models\application\Users;
use Yii;
use yii\base\Model;

/**
 * Class TransferForm
 * @property string $username
 * @property float $amount
 * @property Users | null $sender
 * @property Users | null $receiver
 * @package app\models\forms
 */
class TransferForm extends Model
{
    /**
     * @var string
     */
    public $username;

    /**
     * @var float
     */
    public $amount = 0.01;

    /**
     * @var Users | null
     */
    private $sender;
    /**
     * @var Users | null
     */
    private $receiver;

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['username', 'amount'], 'required'],
            ['username', 'string'],
            ['amount', 'number', 'min' => 0.01],
            ['username', 'filter', 'filter' => function ($value) {
                $this->sender = Users::findOne(Yii::$app->user->id);
                $this->receiver = Users::findOne(['username' => $value]);
                return $value;
            }]
        ];
    }

    /**
     * Function for run action `transfer between two users`
     * @return bool
     */
    public function transfer()
    {
        if ($this->validate() && $this->sender && $this->receiver) {
            if ($this->createTransferAction($this->sender, $this->receiver)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Additional function
     *
     * @return Users|null
     */
    public function getSender()
    {
        return $this->sender;
    }

    /**
     * Additional function
     *
     * @return Users|null
     */
    public function getReceiver()
    {
        return $this->receiver;
    }

    /**
     * Transfer points between two users
     * @return bool
     */
    private function createTransferAction()
    {
        $transaction = Yii::$app->db->beginTransaction();
        try {

            $this->receiver->score += $this->amount;
            $this->sender->score -= $this->amount;
            $action = new ScoreActions([
                'receiver_id' => $this->receiver->id,
                'sender_id' => $this->sender->id,
                'amount' => $this->amount,
            ]);
            if ($action->save() && $this->receiver->save() && $this->sender->save()) {
                $transaction->commit();
                return true;
            }
            $this->addErrors(array_merge($this->sender->errors, $action->errors, $this->receiver->errors));
            $transaction->rollBack();
        } catch (\Exception $exception) {
        }

        return false;
    }

}
