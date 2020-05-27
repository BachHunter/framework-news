<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Controller\Rest;

use App\Model\NewsMapper;
use App\Model\CateNewsMapper;
use Lib\Json;
use Lib\DateTimeEx;

class NewsCtrl extends RestCtrl {

    protected $newMapper;

    protected function init() {
        parent::init();
        $this->newMapper = NewsMapper::makeInstance();
    }

    public function getNews() {
        $list = $this->newMapper->makeInstance()
                ->select('cn.name as cateName', FALSE)
                ->innerJoin('category_news cn ON cn.id=n.cateID')
                ->getAll();
        
        $this->resp->setBody(Json::encode($list));
    }

    public function deleteNews() {
        $id = $this->req->get('id');
        $this->newMapper->deleteNews($id);
        $this->resp->setBody(Json::encode(array(
                    'status' => true
        )));
    }

    // upfile image tạm thời
    public function uploadFile() {
        if (isset($_FILES['files'])) {
            $filePost = $_FILES['files']['name'][0];
            $fileTmp = $_FILES['files']['tmp_name'][0];
            $ext = strtolower(substr($filePost, strrpos($filePost, '.') + 1)); // lay ra duoi file upload 
            $fileName = uid() . '.' . $ext;
            move_uploaded_file($fileTmp, BASE_DIR . '/Docroot/upload/temp/' . $fileName);
            //resize lại kích cỡ của ảnh
            $src = BASE_DIR . '/Docroot/upload/temp/' . $fileName;
            list($width,$height) = getimagesize($src);
            $newFile = imagecreatefromjpeg($src);
            $newWidth = $width*0.25;
            $newHeight = $height*0.25;
            $newFileName = BASE_DIR . '/Docroot/upload/temp/' . $fileName;
            $truecolor = imagecreatetruecolor('135', '70');
            imagecopyresampled($truecolor, $newFile, 0, 0, 0, 0, '135', '70', $width, $height);
            imagejpeg($truecolor,$newFileName,100);
            //trả về dữ liệu tên file
            $this->resp->setBody(Json::encode($fileName));
        }
    }

    //update dữ liệu
    public function updateNews() {
        $id = $this->req->post('id', '');
        $fileName = $this->req->post('image', '');
        
        if (isset($fileName)) {
            mkdir(BASE_DIR . '/Docroot/upload/news/' . DateTimeEx::create()->toYear());
            mkdir(BASE_DIR . '/Docroot/upload/news/' . DateTimeEx::create()->toYear() . '/' . DateTimeEx::create()->toMonth());
            mkdir(BASE_DIR . '/Docroot/upload/news/' . DateTimeEx::create()->toYear() . '/' . DateTimeEx::create()->toMonth() . '/' . DateTimeEx::create()->toDay());
            $fileNameDir = BASE_DIR . '/Docroot/upload/news/' . DateTimeEx::create()->toYear() . '/' . DateTimeEx::create()->toMonth() . '/' . DateTimeEx::create()->toDay() . '/' . $fileName;
            $fileUpdate = 'upload/news/' . DateTimeEx::create()->toYear() . '/' . DateTimeEx::create()->toMonth() . '/' . DateTimeEx::create()->toDay() . '/' . $fileName;
            copy(BASE_DIR . '/Docroot/upload/temp/' . $fileName, $fileNameDir);
            unlink(BASE_DIR . '/Docroot/upload/temp/' . $fileName);
        }
        $data = array(
            'title' => $this->req->post('title', ''),
            'iname' => $fileName,
            'iurl' => $fileUpdate,
            'content' => $this->req->post('content', ''),
            'cateID' => $this->req->post('cateID', ''),
            'cretedDate' => DateTimeEx::create()->toIsoString()
        );
        
        $this->newMapper->makeInstance()->updateNews($id, $data);
        $this->resp->setBody(Json::encode(array(
                    'status' => true
        )));
    }

    // lấy limit 4 dữ liệu ngoài view
    public function getNewsHome() {
        $list = $this->newMapper->getNewsHome();
        $this->resp->setBody(Json::encode($list));
    }

}
