<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller\Rest;

use App\Model\CateNewsMapper;
use Lib\Json;

class CateNewsCtrl extends RestCtrl {

    protected $cateNewsMapper;

    protected function init() {
        parent::init();
        $this->cateNewsMapper = CateNewsMapper::makeInstance();
    }

    function getCategory() {
        $list = $this->cateNewsMapper->makeInstance()
                ->getAll();
        $this->resp->setBody(Json::encode($list));
    }
    
    function updateCate($id){
        $this->requireAdmin();
        $data = $this->restInput();
        if (!$this->cateNewsMapper->checkName($id, $data['name'])) {
            $this->resp->setBody(Json::encode(array(
                        'status' => false,
                        'error'  => 'duplicateCode'
            )));
            return;
        }
        
       
        
        $id = $this->cateNewsMapper->updateCate($id, $data);
        $this->resp->setBody(Json::encode(array(
                      'status' => true,
                      'id' => $id
        
        )));
    }
    function deleteCates() {
        $this->requireAdmin();

        $arrID = $this->restInput('id', array());
        $this->cateNewsMapper->deleteCate($arrID);
        $this->resp->setBody(Json::encode(array(
                    'status' => true
        )));
    }





//    public function deleteCategory() {
//        $id = $this->req->get('id');
//        $this->cateNewsMapper->deleteCategories($id);
//        $this->resp->setBody(Json::encode(array(
//                    'status' => true
//        )));
//    }

//    public function updateCategory() {
//        $id = $this->req->post('id');
//        $data = array(
//            'name' => $this->req->post('name')
//        );
//        $this->cateNewsMapper->makeInstance()->updateCategories($id, $data);
//        $this->resp->setBody(Json::encode(array(
//                    'status' => true,
//                    
//        )));
//    }

}
