<?php
$db_url='mysql://ubuntu:@localhost/circle_test';
$databases=array('default' => array(
    'default' => array(
        'database' => 'circle_test',
        'username' => 'ubuntu',
        'password' => '',
        'driver' => 'mysql',
        'host' => '127.0.0.1',
    ),
),);

require_once DRUPAL_ROOT . '/sites/default/vendor/autoload.php';
