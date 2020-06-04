<?php

namespace App\View\Layout;

use Lib\Layout;

class FrontendLayout extends Layout {

    protected $title = 'Cores';
    protected $brand;
    
    public function themeUrl() {
        return url('/themes/newstheme');
    }

    public function themeURLAdmin() {
        return url('/themes/nifty');
    }

    protected function renderLayout($content) {
        ?>
        <!DOCTYPE html>
        <html>
            <head>
                <meta charset="utf-8">
                <title>News</title>
                <link rel="stylesheet" href="<?php echo $this->themeUrl() ?>/css/style.css">
                <link rel="stylesheet" href="<?php echo $this->themeUrl() ?>/fontAwesome/css/font-awesome.min.css">
                <link href="<?php echo $this->themeUrl() ?>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            </head>
            <body>
                <div class="container" id="container">
                    <angular ng-app="homeApp">
                        <div class="header" ng-controller="menuCtrl">
                            <div class="menu">
                                <div id="menu">
                                    <ul>
                                        <li ng-class="{'active': activeMenuID == ''}" ng-click="change('');"><a href=""><img src="<?php echo url() . '/upload/slide/24h.png' ?>"></a></li>
                                        <li ng-repeat="x in categoryNews" ng-class="{'active': activeMenuID === x.id}" ng-click="change(x.id);"><a href="" class="ng-cloak" >{{x.name}}</a></li>
                                    </ul>
                                </div>
                                <div id="search">
                                    <form action="<?php echo url(); ?>/search" class="form-group for-search" >
                                        <input type="text" class="form-control txtSearch" placeholder="Enter Search" name="txtSearch">
                                        <button type="submit" class="btn btn-default btnSubmit">Search</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="body">
                            <!----------Nội dung hiển thị------------>
        <?php echo $content; ?>
                            <!----------Kết thúc nội dung hiển thị------------>
                        </div>
                        <div class="footer">
                            <div class="f-top">
                                <div class="f-list">
                                    <a href="#" title="Giới thiệu">Giới thiệu</a>
                                    |
                                    <a href="#" title="Góp ý">Góp ý</a>
                                    |
                                    <a href="#" title="Đầu trang">Đầu trang</a>
                                    |
                                    <a href="#" title="Liên hệ quảng cáo">Liên hệ quảng cáo</a>
                                </div>
                            </div>
                            <div class="f-content">
                                <p>Cơ quan chủ quản: Công ty Cổ phần Quảng cáo Trực tuyến 24H Trụ sở: Tầng 12, Tòa nhà Geleximco, 36 Hoàng Cầu, Phường Ô Chợ Dừa, Quận Đống Đa, TP Hà Nội. Tel: (84-24) 73 00 24 24 hoặc (84-24) 3512 1806 - Fax: (84-24) 3512 1804. Chi nhánh: Tầng 7, Tòa nhà Việt Úc, 402 Nguyễn Thị Minh Khai, Phường 5, Quận 3, TP. Hồ Chí Minh. Tel: (84-28) 7300 2424 / Giấy phép số 332/GP – TT ĐT ngày cấp 22/01/2018 SỞ THÔNG TIN VÀ TRUYỀN THÔNG HÀ NỘI. Chịu trách nhiệm xuất bản: Phan Minh Tâm. HOTLINE: 0965 08 24 24</p>
                            </div>
                        </div>
                    </angular>
                </div>


                <script src="<?php echo $this->themeUrl() ?>/bootstrap/js/jquery-3.2.1.min.js"></script>
                <script src="<?php echo url('/admin/config.js') ?>"></script>
                <script src="<?php echo $this->themeURLAdmin() ?>/js/angular.min.js"></script>
                <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.1/angular-sanitize.min.js"></script>
                <script src="<?php echo $this->themeUrl() ?>/js/menu.js"></script>
                <?php
                foreach ($this->js as $js) {
                    echo "\n<script src='$js'></script>";
                }
                ?>
            </body>
        </html>
        <?php
    }

}
