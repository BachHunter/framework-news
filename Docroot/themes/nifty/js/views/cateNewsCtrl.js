
$(function () {
    $('#form-edit').bootstrapValidator({
        excluded: [':disabled'],
        fields: {
            txtCateName: {
                validators: {
                    notEmpty: {
                        message: 'Vui lòng nhập tên loại tin'
                    }
                }
            }
        }
    });
});

$("div#notify").hide();

RED.ngApp.controller('cateNewsCtrl', function ($scope, $timeout, $apply, $http) {
    $scope.ajax = {};
    $scope.categoryNews;
    $scope.checked = {};
    $scope.modalEdit;
    $scope.editing = {};
    $scope.tab = 0;

// check xóa nhiều
    $scope.getChecked = function () {
        var checked = [];
        for (var i in $scope.checked)
            if ($scope.checked[i])
                checked.push(i);
        return checked;
    };
//lấy danh sách loại tin    
    $scope.getListCategory = function () {
        $.ajax({
            url: CONFIG.siteUrl + '/rest/cate-news/list',
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                $scope.categoryNews = resp;
                for (var i in $scope.categoryNews) {
                    $scope.categoryNews[i].formatTime = RED.formatDate($scope.categoryNews[i].createdDate);
                }
            });
        });
    };
    $scope.getListCategory();

// sửa loại tin
    $scope.edit = function (group) {
        group = group || {'id': 0, 'stt': true};
        $scope.editing = $.extend({}, group);
        $timeout(function () {
            $('#modalEdit').modal('show');
        });
    };
// xóa loại tin
    $scope.delete = function (item) {
        if (!confirm('Bạn chắc chắn muốn xóa những đối tượng này?'))
            return;
        idCategories = item || $scope.getChecked();
        $.ajax({
            url: CONFIG.siteUrl + '/rest/cate-news/delete',
            data: {
                id: idCategories
            },
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                $("div#notify").show();
                $("div#notify").delay(2000).slideUp();
                if (resp.status) {
                    $scope.getListCategory();
                }
            });
        });
    };
// lưu loại tin
    $scope.save = function () {
        var validator = $('#form-edit').data('bootstrapValidator');
        validator.validate();
        if (!validator.isValid())
            return;

        var categories = $.extend({}, $scope.editing);    // Truyền tham số vào biến theo dạng object
        $.ajax({
            type: 'POST',
            url: CONFIG.siteUrl + '/rest/cate-news/update',
            data: categories
        }).done(function (resp) {
            $scope.$apply(function () {
                $("div#notify").show();
                $("div#notify").delay(2000).slideUp();
                if ($scope.chkCheck) {
                    $scope.getListCategory();
                    $scope.editing = {};
                }else {
                    if (resp.status) {
                        $($scope.modalEdit).modal('hide');
                        $scope.getListCategory();
                    }
                }
            });
        });
    };
});

