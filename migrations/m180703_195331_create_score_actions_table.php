<?php

use yii\db\Migration;
use yii\db\mysql\Schema;

/**
 * Handles the creation of table `score_actions`.
 */
class m180703_195331_create_score_actions_table extends Migration
{
    private $tableName = '{{%score_actions}}';

    private $refTable = '{{%users}}';

    private $fk1 = 'users_sender_id_fk';

    private $fk2 = 'users_receiver_id_fk';

    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable($this->tableName, [
            'id' => Schema::TYPE_PK,
            'sender_id' => Schema::TYPE_INTEGER . ' NOT NULL',
            'receiver_id' => Schema::TYPE_INTEGER . ' NOT NULL',
            'amount' => Schema::TYPE_FLOAT . ' NOT NULL DEFAULT 0.00',
            'created_at' => Schema::TYPE_INTEGER . ' NOT NULL',
            'updated_at' => Schema::TYPE_INTEGER . ' NOT NULL',
        ], 'ENGINE InnoDB');

        $this->addForeignKey($this->fk1, $this->tableName, 'sender_id', $this->refTable, 'id', 'NO ACTION', 'NO ACTION');

        $this->addForeignKey($this->fk2, $this->tableName, 'receiver_id', $this->refTable, 'id', 'NO ACTION', 'NO ACTION');

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropForeignKey($this->fk1, $this->tableName);

        $this->dropForeignKey($this->fk2, $this->tableName);

        $this->dropTable($this->tableName);
    }
}
