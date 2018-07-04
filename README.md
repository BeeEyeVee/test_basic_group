<p align="center">
    <a href="https://www.facebook.com/bohdan.vovchak" target="_blank">
        <img src="https://scontent.fiev9-1.fna.fbcdn.net/v/t1.0-9/29694461_1610415005739685_9203625409391315483_n.jpg?_nc_cat=0&oh=a777a3631e9f9fbe23cce472096aeacf&oe=5BA0C6D0" height="100px">
    </a>
    <h1 align="center">Yii 2 Basic Project Template</h1>
    <br>
</p>

Testing Task for [Basic Group](http://www.basicgroup.ua/).

DIRECTORY STRUCTURE
-------------------

      assets/             contains assets definition
      components/         contains additional classes
      commands/           contains console commands (controllers)
      config/             contains application configurations
      controllers/        contains Web controller classes
      mail/               contains view files for e-mails
      models/             contains model classes
      runtime/            contains files generated during runtime
      tests/              contains various tests for the basic application
      vendor/             contains dependent 3rd-party packages
      views/              contains view files for the Web application
      web/                contains the entry script and Web resources



REQUIREMENTS
------------

The minimum requirement by this project template that your Web server supports PHP 7.0.0.


INSTALLATION
------------

### Install with Vagrant

~~~
vagrant up
vagrant ssh
cd /app
~~~

CONFIGURATION
-------------

### Database

Edit the file `config/db.php` with real data, for example:

```php
return [
    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host=*your_host*;dbname=*your_db_name*',
    'username' => '*your_username*',
    'password' => '*your_password*',
    'charset' => 'utf8',
];
```
### Init migrations
~~~
php yii migrate
php yii migrate/up --migrationPath=vendor/machour/yii2-notifications/migrations/
~~~
    
You can then access the application through the following URL:

[local](http://yii2basic.dev) - http://yii2basic.dev

[site](http://test-basic-group.epizy.com) - http://test-basic-group.epizy.com


