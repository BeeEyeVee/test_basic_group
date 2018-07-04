<?php

namespace app\models\forms;

use app\models\User;
use Yii;
use yii\base\Model;
/**
 * LoginForm is the model behind the login form.
 *
 * @property User|null $user This property is read-only.
 *
 */
class LoginForm extends Model
{
    /**
     * @var string
     */
    public $username;

    private $_user;


    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            ['username', 'required'],
            ['username', 'required'],
        ];
    }

    /**
     * Logs in a user using the provided username and password.
     * @return bool whether the user is logged in successfully
     */
    public function login()
    {
        if ($this->validate() && $user = $this->getUser()) {
            return Yii::$app->user->login($user, 3600*24*30);
        }
        return false;
    }

    /**
     * Finds user by [[username]]
     *
     * @return User|null
     */
    public function getUser()
    {
        if (!$this->_user) {
            $user = User::findByUsername($this->username);
            if(!$user){
                $user = new User([
                    'username' => $this->username,
                    'auth_key' => Yii::$app->security->generateRandomString()
                ]);
                if(!$user->save()){
                    $this->addError('username', $user->getFirstError('username'));
                    return null;
                }
            }
            $this->_user = $user;
        }

        return $this->_user;
    }
}
