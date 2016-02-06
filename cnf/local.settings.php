<?php
$db_url='mysql://default:default@localhost/default';
$databases=array('default' => array(
    'default' => array(
        'database' => 'default',
        'username' => 'default',
        'password' => 'default',
        'driver' => 'mysql',
        'host' => 'localhost',
    ),
),);
error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);

require_once DRUPAL_ROOT . '/sites/default/vendor/autoload.php';
