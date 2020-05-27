<?php

namespace App\Controller;

class NewsCtrl extends CoreCtrl{
    
    function init() {
        parent::init();
    }
    
    function news(){
        $this->requireAdmin();
        $this->twoColsLayout->setSideMenuActive('news')->render('News/news.phtml');
    }
}

