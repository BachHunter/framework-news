<?php

namespace App\Article\Model;
use Lib\SQL\Entity;

class ArticleEntity extends Entity {
    function getUrl(){
        return url('/article/'.$this->pk);
    }
}
