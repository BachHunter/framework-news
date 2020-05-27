<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Model;
use Lib\SQL\Mapper;

class CateNewsMapper extends Mapper {
    
    public function makeEntity($rawData) {
        return new CateNewsEntity($rawData);
    }
    
    public function tableAlias() {
        return "cn";
    }
    
    public function tableName() {
         return "category_news";
    }
    
    function __construct() {
        parent::__construct();
        $this->filterDeleted(false);   
    }
    
    function filterName($name) {
        $this->where('cn.name=?', __FUNCTION__)->setParam($name, __FUNCTION__);
        return $this;
    }
    function filterDeleted($bool) {
        $this->where('cn.deleted=?', __FUNCTION__)->setParam($bool ? 1 : 0, __FUNCTION__);
        return $this;
    }
    
    function filterID($id) {
        $this->where('cn.id=?', __FUNCTION__)->setParam($id, __FUNCTION__);
        return $this;
    }
    function updateCate($id, $data){
        $update['name'] = arrData($data, 'name');
        if (!$update['name']) {
            return false;
        }
        
        $this->db->StartTrans();
        $id = $this->replace($id, $update);
        
        if(!$id){
            return false;
        }
        $this->db->CompleteTrans();
        return $id;
    }
    function deleteCate($id) {
        if (!is_array($id)) {
            $id = array($id);
        }
        
        foreach ($id as $i) {
            $this->db->Execute("UPDATE category_news SET deleted=1, name=CONCAT(name, ?) WHERE id=?", array('|' . uniqid() . $i, $i));
        }
    }
    
    function checkName($id, $name) {
        $inserted = $this->makeInstance()->filterName($name)->getEntity();

        if (!$inserted->id) {
            return true;
        } else if ($inserted->id== $id) {
            return true;
        }
        return false;
    }



    
//    

//    public function filterName($name){
//        $this->where('cn.name LIKE ?',__FUNCTION__)
//                ->setParams("%$name%",__FUNCTION__);
//        return $this;
//    }
//    public function updateCategories($id, $data){
//        $this->replace($id, $data);
//    }
//    public function deleteCategories($id){
//        $table = 'catenews';
//        if (!is_array($id)) {
//            $id = array($id);
//        }
//        $where = 'id=?';
//        foreach ($id as $value) {
//            $whereParams = array($value);
//            $this->db->delete($table, $where, $whereParams);
//        }
//    }
}
