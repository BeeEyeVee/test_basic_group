<?php

namespace app\models\application;

use app\models\basic\Users as BasicUsers;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

class Users extends BasicUsers
{
    const MIN_VALUE_SCORE = -1000;

    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'updated_at'],
                    ActiveRecord::EVENT_BEFORE_UPDATE => ['updated_at'],
                ],
                // если вместо метки времени UNIX используется datetime:
                // 'value' => new Expression('NOW()'),
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['username'], 'required'],
            ['score', 'number', 'min' => self::MIN_VALUE_SCORE],
            [['created_at', 'updated_at'], 'integer'],
            [['username'], 'string', 'max' => 16],
            [['auth_key'], 'string', 'max' => 32],
            [['username'], 'unique'],
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFromScoreActions()
    {
        return $this->hasMany(ScoreActions::className(), ['from_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getToScoreActions()
    {
        return $this->hasMany(ScoreActions::className(), ['to_id' => 'id']);
    }
}
