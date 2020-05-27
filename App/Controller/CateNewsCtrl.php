<?php

namespace App\Controller;

class CateNewsCtrl extends CoreCtrl {

    function init() {
        parent::init();
    }
    
    function cateNews() {
        $this->requireAdmin();
        $this->twoColsLayout->setSideMenuActive('cateNews')->render('News/cateNews.phtml');
    }
    

}
