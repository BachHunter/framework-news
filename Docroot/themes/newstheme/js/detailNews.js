
appHome.controller('detailCtrl', function ($scope) {
    $scope.detailNews;
    $scope.listNewsLike;

    $scope.loadDetail = function () {
        $.ajax({
            url: CONFIG.siteUrl + '/rest/home/detail',
            data: {id: idDetail},
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                $scope.detailNews = resp;
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
    $scope.loadDetail();
    $scope.loadNewsLike();
});


