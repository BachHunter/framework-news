<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller\Rest;

use App\Model\NewsMapper;
use Lib\Json;

class HomePageCtrl extends RestCtrl {

    protected $homePageMapper;

    protected function init() {
        parent::init();
        $this->homePageMapper = NewsMapper::makeInstance();
    }

    // lấy limit 4 dữ liệu ngoài view
    public function getNewsHome() {
        $list = $this->homePageMapper->getNewsHome();
        $this->resp->setBody(Json::encode($list));
    }
    // lấy 4 dữ liệu tin yêu thích nhất
    public function getNewslike() {
        $list = $this->homePageMapper->getNewsLike();
        $this->resp->setBody(Json::encode($list));
    }
    // lấy chi tiết tin bài
    public function getNewsDetail() {
        $id = $this->req->get('id');
        $selec = $this->homePageMapper->filterID($id)->getEntity();
        $array = ['likes' => $selec->likes + 1];
        $this->homePageMapper->replace($id, $array);
        $detail = $this->homePageMapper->getDetail($id);
        $this->resp->setBody(Json::encode($detail));
    }
    // lấy dữ liệu của loại tin khi click
    public function getNewsCategory(){
        $id = $this->req->get('id');
        $selec = $this->homePageMapper->getListCategory($id);
        $this->resp->setBody(Json::encode($selec));
    }
    public function getSearch(){
        $txtSearch = $this->req->get('txtSearch');
        $selec = $this->homePageMapper->getListSearch($txtSearch);
        $this->resp->setBody(Json::encode($selec));
    }

}
