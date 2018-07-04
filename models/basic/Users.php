<?php

namespace app\models\basic;

use Yii;

/**
 * This is the model class for table "{{%users}}".
 *
 * @property int $id
 * @property string $username
 * @property string $auth_key
 * @property double $score
 * @property int $created_at
 * @property int $updated_at
 *
 * @property ScoreActions[] $scoreActions
 * @property ScoreActions[] $scoreActions0
 */
class Users extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%users}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['username', 'auth_key', 'created_at', 'updated_at'], 'required'],
            [['score'], 'number'],
            [['created_at', 'updated_at'], 'integer'],
            [['username'], 'string', 'max' => 16],
            [['auth_key'], 'string', 'max' => 32],
            [['username'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'username' => Yii::t('app', 'Username'),
            'auth_key' => Yii::t('app', 'Auth Key'),
            'score' => Yii::t('app', 'Score'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getScoreActions()
    {
        return $this->hasMany(ScoreActions::className(), ['receiver_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getScoreActions0()
    {
        return $this->hasMany(ScoreActions::className(), ['sender_id' => 'id']);
    }
}
