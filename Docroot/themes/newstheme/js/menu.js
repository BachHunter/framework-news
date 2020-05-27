var appHome = angular.module('homeApp', ['ngSanitize']);
appHome.controller('menuCtrl', function ($scope, $window) {
    $scope.sta = {};
    $scope.listCategory;
    $scope.activeMenuID = $window.localStorage.getItem('activeMenu') ? $window.localStorage.getItem('activeMenu') : '';

    $scope.loadCategory = function () {
        $.ajax({
            url: CONFIG.siteUrl + '/rest/cate-news/list',
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                $scope.listCategory = resp;
            });
        });
    };
    $scope.loadCategory();

    $scope.change = function (id) {
        $window.localStorage.setItem('activeMenu', id);
        if (id) {
            $window.location = CONFIG.siteUrl + '/category/' + id;
        }else{
            $window.location = CONFIG.siteUrl + '/home';
        }
    };
});

