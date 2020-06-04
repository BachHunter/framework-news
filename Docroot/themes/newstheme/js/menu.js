var appHome = angular.module('homeApp', ['ngSanitize']);
appHome.controller('menuCtrl', function ($scope, $window) {
    $scope.sta = {};
    $scope.categoryNews;
    $scope.activeMenuID = $window.localStorage.getItem('activeMenu') ? $window.localStorage.getItem('activeMenu') : '';

    $scope.getCategory = function () {
        $.ajax({
            url: CONFIG.siteUrl + '/rest/cate-news',
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                $scope.categoryNews = resp;
            });
        });
    };
    $scope.getCategory();

    $scope.change = function (id) {
        $window.localStorage.setItem('activeMenu', id);
        if (id) {
            $window.location = CONFIG.siteUrl + '/category/' + id;
        }else{
            $window.location = CONFIG.siteUrl + '/home';
        }
    };
});

