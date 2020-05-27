<?php

namespace App\Controller;

use App\Model\UserMapper;
use App\Model\DepartmentMapper;

class UserCtrl extends CoreCtrl {

    protected $userMapper;
    protected $depMapper;

    function init() {
        parent::init();
        $this->userMapper = UserMapper::makeInstance();
        $this->depMapper = DepartmentMapper::makeInstance();
    }

    function index() {
        $this->requireAdmin();
        $this->twoColsLayout->render('User/user.phtml');
    }

    function group() {
        $this->requireAdmin();
        $this->twoColsLayout->render('User/group.phtml');
    }
    
//     function cateNews() {
//        $this->requireAdmin();
//        $this->twoColsLayout->setSideMenuActive('cateNews')->render('User/cateNews.phtml');
//    }
    
//     function news() {
//        $this->requireAdmin();
//        $this->twoColsLayout->setSideMenuActive('news')->render('User/news.phtml');
//    }
    function importUser(){
        $this->requireAdmin();
        $this->twoColsLayout->setSideMenuActive('importUser')->render('User/importUser.phtml');
    }
            

    function test() {
        $this->defaultLayout = new \App\View\Layout\DefaultLayout($this->context);
        $this->defaultLayout->setTemplatesDirectory(dirname(__DIR__) . '/View');
        $this->defaultLayout->render('/test.phtml');
    }

}
