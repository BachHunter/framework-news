<?php

namespace App\Controller;

use Lib\Controller;
use App\View\Layout\FrontendLayout;

class HomePageCtrl extends Controller {

    protected $index;

    public function init() {
        //khởi tạo ra layout
        $this->index = new FrontendLayout();
        $viewDir = dirname(__DIR__) . '/View';
        $this->index->setTemplatesDirectory($viewDir);
    }

    public function homePage() {
        $this->index->render('/Frontend/index.phtml');
    }

    public function detail($id) {
        $data['id'] = $id;
        $this->index->render('/Frontend/detail.phtml', $data);
    }
    public function categrory($id){
        $data['id'] = $id;
        $this->index->render('/Frontend/category.phtml', $data);
    }
    public function getSearch(){
        $data['txtSearch'] = $this->req->get('txtSearch');
        $this->index->render('/Frontend/search.phtml', $data);
    }
}
