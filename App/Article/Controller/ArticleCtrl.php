<?php

namespace App\Article\Controller;

use Lib\Controller;
use App\Article\View\layout\Home;
use App\Article\Model\ArticleEntity;
use App\Article\Model\ArticleMapper;
class ArticleCtrl extends Controller {

    protected $index;
    protected $homeMapper;
    protected $categoryMapper;

    public function init() {
        //khởi tạo ra layout
        $this->index = new Home();
        $viewDir = dirname(__DIR__) . '/View';
        $this->index->setTemplatesDirectory($viewDir);
        //khởi tạo mapper
        $this->homeMapper = new ArticleMapper();        
    }

    public function themeUrl() {
        echo 1;
//        echo url('/themes/newstheme');
    }
    
    public function Home() {
        $this->index->render('/show/index.phtml');
    }

    public function Detail() {
        $this->index->render('/show/detail.phtml');
    }

    public function Show() {
        $rowdata = array(
            'pk' => 1,
            'title' => 'Duc vo dich',
            'content' => 'Noi dung ben trong',
            'Intro' => 'Khong co gi',
            'image' => 'image.jpg',
        );
        $row = new ArticleEntity($rowdata);
        echo "<pre>";
        print_r($row);
        echo "</pre>";
    }

    public function Join() {
//        reset mapper về trạng thái sạch
        $result = $this->aMapper->makeInstance()
                //lấy tất cả các tin bài
                ->getAll();
        echo "<pre>";
        foreach ($result as $abc) {
            var_dump($abc);
            echo '<hr>';
        }
    }

}
