<?php

namespace App\Controller;

class HomePageCtrl extends CoreCtrl {

    function init() {
          parent::init();
        //khởi tạo ra layout
    }

    function homePage() {
        $this->frontendLayout
                ->render('Frontend/index.phtml');
    }

    function detail($id) {
        $data['id'] = $id;
        $this->frontendLayout->render('/Frontend/detail.phtml', $data);
    }
//    function categrory($id){
//        $data['id'] = $id;
//        $this->frontendLayout->render('/Frontend/category.phtml', $data);
//    }
    function getSearch(){
        $data['txtSearch'] = $this->req->get('txtSearch');
        $this->frontendLayout->render('/Frontend/search.phtml', $data);
    }
}
