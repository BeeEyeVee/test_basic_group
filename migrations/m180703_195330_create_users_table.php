<?php

use yii\db\Migration;
use yii\db\mysql\Schema;

/**
 * Handles the creation of table `users`.
 */
class m180703_195330_create_users_table extends Migration
{
    private $tableName = '{{%users}}';

    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable($this->tableName, [
            'id' => Schema::TYPE_PK,
            'username' => Schema::TYPE_STRING . '(16) NOT NULL UNIQUE',
            'auth_key' => Schema::TYPE_STRING . '(32) NOT NULL',
            'score' => Schema::TYPE_FLOAT . ' DEFAULT 0.00',
            'created_at' => Schema::TYPE_INTEGER . ' NOT NULL',
            'updated_at' => Schema::TYPE_INTEGER . ' NOT NULL',
        ], 'ENGINE InnoDB');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable($this->tableName);
    }
}
