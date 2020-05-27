<?php

namespace App\Article\Model;

use Lib\SQL\Mapper;

class ArticleMapper extends Mapper {

    public function makeEntity($rawData) {
        return new ArticleEntity($rawData);
    }

    public function tableAlias() {
        return 'n';
    }

    public function tableName() {
        return 'news';
    }

    public function getCategory() {
        $list = $this->makeInstance()
                ->select('.*')
                ->getAll();
        return $list;
    }

    public function getNews() {
        $list = $this->makeInstance()
                ->select('c.name,n.*', FALSE)
                ->innerJoin('catenews c ON c.id=n.cateId', FALSE)
                ->limit(4)
                ->orderBy('n.id DESC')
                ->getAll();
        return $list;
    }

    public function getDetail($id) {
        $detail = $this->filterID($id)
                ->select('c.name, n.*', FALSE)
                ->innerJoin('catenews c ON c.id = n.cateId')
                ->getEntity();
        return $detail;
    }

}
