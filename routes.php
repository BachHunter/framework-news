<?php

use Lib\MvcContext;

$routes[] = new MvcContext(array('/', '/admin(/)'), 'GET', "App\\Controller\HomeCtrl", 'index');

$routes[] = new MvcContext('/admin/config.js', 'GET', "App\\Controller\HomeCtrl", 'configJS');

$routes[] = new MvcContext('/admin/user', 'GET', "App\\Controller\UserCtrl", 'index');
$routes[] = new MvcContext('/admin/user/import', 'GET,POST', "App\\Controller\UserCtrl", 'importUser');
$routes[] = new MvcContext('/admin/group', 'GET', "App\\Controller\UserCtrl", 'group');
$routes[] = new MvcContext('/admin/cate-news', 'GET', "App\\Controller\CateNewsCtrl", 'cateNews');
$routes[] = new MvcContext('/admin/news', 'GET', "App\\Controller\NewsCtrl", 'news');

$routes[] = new MvcContext('/admin/application', 'GET', "App\\Controller\SettingCtrl", 'application');
$routes[] = new MvcContext('/admin/setting', 'GET', "App\\Controller\SettingCtrl", 'setting');
$routes[] = new MvcContext('/admin/setting/update', 'POST', "App\\Controller\SettingCtrl", 'update');


$routes[] = new MvcContext('/rest/department/move', 'PUT', "App\\Controller\Rest\UserCtrl", 'moveDepartments');
$routes[] = new MvcContext('/rest/department/:id', 'GET', "App\\Controller\Rest\UserCtrl", 'getDepartment');
$routes[] = new MvcContext('/rest/department/:id', 'PUT', "App\\Controller\Rest\UserCtrl", 'updateDepartment');
$routes[] = new MvcContext('/rest/department', 'DELETE', "App\\Controller\Rest\UserCtrl", 'deleteDepartments');

$routes[] = new MvcContext('/rest/group', 'GET', "App\\Controller\Rest\UserCtrl", 'getGroups');
$routes[] = new MvcContext('/rest/group/:id/user', 'GET', "App\\Controller\Rest\UserCtrl", 'getGroupUsers');
$routes[] = new MvcContext('/rest/group/:id', 'PUT', "App\\Controller\Rest\UserCtrl", 'updateGroup');
$routes[] = new MvcContext('/rest/group', 'DELETE', "App\\Controller\Rest\UserCtrl", 'deleteGroups');

//-----------------------------------------------------------------------------------------------------
$routes[] = new MvcContext('/rest/cate-news', 'GET', "App\\Controller\Rest\CateNewsCtrl", 'getCategory');
$routes[] = new MvcContext('/rest/cate-news/delete', 'GET', "App\\Controller\Rest\CateNewsCtrl", 'deleteCategory');
$routes[] = new MvcContext('/rest/cate-news/update', 'POST', "App\\Controller\Rest\CateNewsCtrl", 'updateCategory');
$routes[] = new MvcContext('/rest/cate-news/:id', 'PUT', "App\\Controller\Rest\CateNewsCtrl", 'updateCate');
$routes[] = new MvcContext('/rest/cate-news', 'DELETE', "App\\Controller\Rest\CateNewsCtrl", 'deleteCates');

//-----------------------------------------------------------------------------------------------------
$routes[] = new MvcContext('/rest/news', 'GET', "App\\Controller\Rest\NewsCtrl", 'getNews');
$routes[] = new MvcContext('/rest/news/delete', 'GET', "App\\Controller\Rest\NewsCtrl", 'deleteNews');
$routes[] = new MvcContext('/rest/news/update', 'POST', "App\\Controller\Rest\NewsCtrl", 'updateNews');
$routes[] = new MvcContext('/rest/news/upload-file', 'POST', "App\\Controller\Rest\NewsCtrl", 'uploadFile');
//-----------------------------------------------------------------------------------------------------
$routes[] = new MvcContext('/rest/home/news', 'GET', "App\\Controller\Rest\HomePageCtrl", 'getNewsHome');
$routes[] = new MvcContext('/rest/home/news/like', 'GET', "App\\Controller\Rest\HomePageCtrl", 'getNewslike');
$routes[] = new MvcContext('/rest/home/detail', 'GET', "App\\Controller\Rest\HomePageCtrl", 'getNewsDetail');
$routes[] = new MvcContext('/rest/home/category', 'GET', "App\\Controller\Rest\HomePageCtrl", 'getNewsCategory');
$routes[] = new MvcContext('/rest/home/search', 'GET', "App\\Controller\Rest\HomePageCtrl", 'getSearch');
//-----------------------------------------------------------------------------------------------------
$routes[] = new MvcContext('/rest/basePermission', 'GET', "App\\Controller\Rest\UserCtrl", 'getBasePermissions');
$routes[] = new MvcContext('/rest/user/search', 'GET', "App\\Controller\Rest\UserCtrl", 'search');
$routes[] = new MvcContext('/rest/user/move', 'PUT', "App\\Controller\Rest\UserCtrl", 'moveUsers');
$routes[] = new MvcContext('/rest/user/checkUniqueAccount', 'GET', "App\\Controller\Rest\UserCtrl", 'checkUniqueAccount');
$routes[] = new MvcContext('/rest/user/:id', 'PUT', "App\\Controller\Rest\UserCtrl", 'updateUser');
$routes[] = new MvcContext('/rest/user', 'DELETE', "App\\Controller\Rest\UserCtrl", 'deleteUsers');

$routes[] = new MvcContext('/account/change-password', 'GET,POST', "App\\Controller\AccountCtrl", 'changePassword');
$routes[] = new MvcContext('/account/login', 'GET,POST', "App\\Controller\AccountCtrl", 'index');
//-----------------------------------------------------------------------------------------------------
$routes[] = new MvcContext('/home', 'GET', "App\\Controller\HomePageCtrl", 'homePage');
$routes[] = new MvcContext('/detail/:id', 'GET', "App\\Controller\HomePageCtrl", 'detail');
$routes[] = new MvcContext('/category/:id', 'GET', "App\\Controller\HomePageCtrl", 'categrory');
$routes[] = new MvcContext('/search', 'GET', "App\\Controller\HomePageCtrl", 'getSearch');

