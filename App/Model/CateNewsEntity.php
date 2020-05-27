<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Model;

use Lib\SQL\Entity;

class CateNewsEntity extends Entity {

    function getUrl() {
        return url('/url/' . $this->id);
    }

    function __construct($rawData = null) {
        parent::__construct($rawData);
    }

}
