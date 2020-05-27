<?php

/**
 * 0 = tắt
 * 1 = PHP, Database trừ trên service
 * 10 = tất cả
 */
$exports['debugMode'] = 0;

//kết nối database
$exports['db'] = array(
    'type' => 'mysqli',
    'host' => 'localhost',
    'name' => 'frame-work',
    'user' => 'root',
    'pass' => ''
);

$exports['cryptSecrect'] = 'abM)(*2312';

date_default_timezone_set('Asia/Bangkok');
