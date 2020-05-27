<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace App\Article\Controller;

namespace App\Article\Controller;

use Lib\Controller;
use App\Article\Model\ArticleMapper;

class getDataNewsCtrl extends Controller {

    protected $index;
    protected $detailMapper;

    public function init() {
        //khởi tạo mapper
        $this->detailMapper = new ArticleMapper();
    }
    public function getNews(){
        $list = $this->detailMapper->getNews();
        $this->index->render('/show/index.phtml', array('url' => $this->themeUrl(), 'list' => $list));
    }
    
    public function getDetailNews($id){
         $detail = $this->detailMapper->getDetail($id);
        $this->index->render('/show/detail.phtml', array('detail' => $detail));
    }

}
