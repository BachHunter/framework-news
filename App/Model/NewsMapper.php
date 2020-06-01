<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Model;

use Lib\SQL\Mapper;

/**
 * Description of NewsMapper
 *
 * @author DoanhNC
 */
class NewsMapper extends Mapper {

    public function makeEntity($rawData) {
        return new NewsEntity($rawData);
    }

    public function tableAlias() {
        return 'n';
    }

    public function tableName() {
        return 'news';
    }

    public function updateNews($id, $data) {
        $this->replace($id, $data);
    }

    public function deleteNews($id) {
        $table = 'news';
        if (!is_array($id)) {
            $id = array($id);
        }
        $where = 'id=?';
        foreach ($id as $value) {
            $whereParams = array($value);
            $this->db->delete($table, $where, $whereParams);
        }
    }

    // lấy 4 dữ liệu ngoài view
    public function getNewsHome() {
        $list = $this->makeInstance()
                ->select('cn.name,n.*', FALSE)
                ->innerJoin('category_news cn ON cn.id=n.cateId', FALSE)
                ->limit(4)
                ->orderBy('n.id DESC')
                ->getAll();
        return $list;
    }

    // lấy 4 dữ liệu tin xem nhiều nhất
    public function getNewsLike() {
        $list = $this->makeInstance()
                ->select('cn.name,n.*', FALSE)
                ->innerJoin('category_news cn ON cn.id=n.cateId', FALSE)
                ->limit(4)
                ->orderBy('n.likes DESC')
                ->getAll();
        return $list;
    }

    // lấy chi tiết sản phẩm
    public function getDetail($id) {
        $detail = $this->filterID($id)
                ->select('cn.name, n.*', FALSE)
                ->innerJoin('category_news cn ON cn.id = n.cateId')
                ->getEntity();
        return $detail;
    }

    // lấy danh sách tin tức theo loại
    public function getListCategory($id) {
        $list = $this->makeInstance()
                ->select('cn.name,n.*', FALSE)
                ->innerJoin('category_news cn ON cn.id=n.cateId', FALSE)
                ->where('n.cateId=?', __FUNCTION__)->setParam($id, __FUNCTION__)
                ->limit(4)
                ->orderBy('cn.id DESC')
                ->getAll();
        return $list;
    }

    public function getListSearch($name) {
        $list = $this->makeInstance()
                ->select('n.*', FALSE)
                ->where('n.title LIKE ?', __FUNCTION__)->setParam("%$name%", __FUNCTION__)
                ->limit(8)
                ->getAll();
        return $list;
    }

}
