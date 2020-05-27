
appHome.controller('categoryCtrl', function ($scope) {
    $scope.listCategory;
    
    $scope.loadCategory = function () {
        $.ajax({
            url: CONFIG.siteUrl + '/rest/home/category',
            data: {id: idCategory},
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                $scope.listCategory = resp;
            });
        });
    };
    $scope.loadCategory();
});


