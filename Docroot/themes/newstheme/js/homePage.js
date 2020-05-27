
appHome.controller('homeCtrl', function ($scope) {
    $scope.listNews;
    $scope.listNewsLike;

    $scope.loadNews = function () {
        $.ajax({
            url: CONFIG.siteUrl + '/rest/home/news',
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                $scope.listNews = resp;
                $scope.listNews.url = CONFIG.siteUrl + '/themes/newstheme';
            });
        });
    };

    $scope.loadNewsLike = function () {
        $.ajax({
            url: CONFIG.siteUrl + '/rest/home/news/like',
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                $scope.listNewsLike = resp;
                $scope.listNewsLike.url = CONFIG.siteUrl + '/themes/newstheme';
            });
        });
    };
    
    $scope.loadNews();
    $scope.loadNewsLike();

});


