
appHome.controller('searchCtrl', function ($scope) {
    $scope.listSearch;
    
    $scope.loadSearch = function () {
        $.ajax({
            url: CONFIG.siteUrl + '/rest/home/search',
            data: {txtSearch: txtSearch},
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                $scope.listSearch = resp;
                console.log($scope.listSearch);
            });
        });
    };
    $scope.loadSearch();
});


