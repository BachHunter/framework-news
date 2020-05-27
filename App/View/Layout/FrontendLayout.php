<?php

namespace App\View\Layout;

use Lib\Layout;

class FrontendLayout extends Layout {

    protected $category;

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
                            <div class="head">
                                <a href=""><img src="<?php echo url() . '/upload/slide/logo.png' ?>" alt="" ng-click="change('');"></a>
                                <div id="h-right">
                                    <div id="h-right-top">
                                        <ul>
                                            <a href="#"><li><span style="font-size: 16px; color: white">in</span></li></a>
                                            <a href="https://twitter.com/?lang=vi"><li><span><i class="fa fa-twitter" aria-hidden="true" style="color: white"></i></span></li></a>
                                            <a href="#"><li><span><i class="fa fa-pinterest-p" aria-hidden="true" style="color: white"></i></span></li></a>
                                            <a href="https://plus.google.com/collections/featured?hl=vi"><li><span><i class="fa fa-google-plus" aria-hidden="true" style="color: white"></i></span></li></a>
                                            <a href="http://172.16.20.1/"><li><span><i class="fa fa-rss" aria-hidden="true" style="color: white"></i></span></li></a>
                                        </ul>
                                    </div>
                                    <div id="h-right-bot">
                                        <ul>
                                            <li><a href="#">Sign Up</a> |</li>
                                            <li><a href="#">Login</a> |</li>
                                            <li><a href="#">RSS Feeds</a> |</li>
                                            <li><a href="#">Archived News</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="menu">
                                <div id="menu">
                                    <ul>
                                        <li ng-class="{'active': activeMenuID ==''}" ng-click="change('');"><a href="">Home</a></li>
                                        <li ng-repeat="x in listCategory" ng-class="{'active': activeMenuID === x.id}" ng-click="change(x.id);"><a href="" class="ng-cloak" >{{x.name}}</a></li>
                                    </ul>
                                </div>
                                <div id="search">
                                    <form action="<?php echo url();?>/search" class="form-group for-search" >
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
                            <div id="f-top">
                                <ul>
                                    <li>
                                        <div id="c-image">
                                            <span style="color: white">CONTACT DETAILS</span>
                                        </div>
                                        <div id="c-content">
                                            <p style="color: white">
                                                Convallisijusto vestas mus pellentum aenean sapibulum in aliquam volut pat integest nulla.
                                            </p><br><br>
                                            <p style="color: white">
                                                Tel: xxxxx xxxxxxxxxx
                                                Fax: xxxxx xxxxxxxxxx
                                                Email: contact@mydomain.com
                                            </p>
                                        </div>
                                    </li>
                                    <li>
                                        <div id="c-image">
                                            <span style="color: white">QUICK LINKS</span>
                                        </div>
                                        <div id="c-content">
                                            <a href="">Link 1</a>
                                            <hr>
                                            <a href="">Link 2</a>
                                            <hr>
                                            <a href="">Link 3</a>
                                            <hr>
                                            <a href="">Link 4</a>
                                            <hr>
                                        </div>
                                    </li>
                                    <li>
                                        <div id="c-image">
                                            <span style="color: white">FROM THE BLOG</span>
                                        </div>
                                        <div id="c-content">
                                            <h4 style="color: white">Blog Title</h4><br>
                                            <p style="color: white">
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non diam erat.
                                                In fringilla massa ut nisi ullamcorper pellentesque.
                                            </p>
                                            <a href="" style="float: right">Read More >></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div id="c-image">
                                            <span style="color: white">GRAB OUR NEWSLETTER</span>
                                        </div>
                                        <div id="c-content" class="form-group">
                                            <form action="">
                                                <input type="text" placeholder="Name" class="form-control"><br>
                                                <input type="text" placeholder="Email" class="form-control"><br>
                                                <button type="submit" class="btn-success">SUBMIT</button>
                                            </form>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div id="f-bot">
                                <span style="color: white; margin-left: 10px;float: left">Copyright © 2013 - All Rights Reserved - Domain Name</span>
                                <span style="color: white; margin-right: 10px;float: right">Domain Name</span>
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

    public function themeUrl() {
        return url('/themes/newstheme');
    }

    public function themeURLAdmin() {
        return url('/themes/nifty');
    }

}
