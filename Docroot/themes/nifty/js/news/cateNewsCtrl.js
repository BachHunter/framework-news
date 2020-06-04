$(function () {
    $('#form-edit').bootstrapValidator({
        excluded: [':disabled'],
        fields: {
            txtCateName: {
                validators: {
                    notEmpty: {
                        message: 'Vui lòng nhập tên danh mục'
                    }
                }
            }
        }
    });
});
$("div#notify").hide();

RED.ngApp.controller('cateNewsCtrl', function ($scope, $apply, $timeout, $http) {
    $scope.ajax = {};
    $scope.categoryNews;
    $scope.checked = {};
    $scope.modalEdit;
    $scope.editing;
    $scope.tab = 0;
    
    $scope.getChecked = function () {
        var checked = [];
        for (var i in $scope.checked)
            if ($scope.checked[i])
                checked.push(i);
        return checked;
    };
    
    
    
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
    
    $scope.edit = function (cate) {
        cate = cate || {'id': 0};
        $scope.editing = $.extend({},cate);
        $scope.editing.checked = {};
        $scope.ajax = {};
        
        
        if(cate.id !=0)
            $.ajax({
                'cache': false,
                'url': CONFIG.siteUrl + '/rest/cate-news/' + cate.id,
                'dataType': 'json'
            });
        $timeout(function () {
            $($scope.modalEdit).modal('show');
        });
        
        
    };
    $scope.save = function () {
        var validator = $('#form-edit').data('bootstrapValidator');
        validator.validate();
        if (!validator.isValid())
            return;
       
        var cate = $.extend({}, $scope.editing);
        $scope.ajax.save = true;
        
        $http.put(CONFIG.siteUrl + '/rest/cate-news/' + cate.id, cate).then(function (resp) {
            $scope.ajax.save = null;
            if (resp.data.status) {
                $($scope.modalEdit).modal('hide');
                $scope.getCategory();
            } else if (resp.data.error == 'duplicateCode') {
                alert('Trùng mã nhóm');
            }
        });   
    };
    
    $scope.delete = function (id) {
        if (id) {
            $scope.checked = {};
            $scope.checked[id] = true;
        }

        if (!confirm('Bạn chắc chắn muốn xóa những đối tượng này?'))
            return;

        $http.delete(CONFIG.siteUrl + '/rest/cate-news', {data: {'id': $scope.getChecked()}}).then(function () {
            $scope.getCategory();
        });
    };
    

});

