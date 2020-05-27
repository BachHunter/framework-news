
//Validate đi submit form
$(function () {
    $('#form-edit').bootstrapValidator({
        framework: 'bootstrap',
        excluded: [':disabled'],
        fields: {
            slCategories: {
                validators: {
                    notEmpty: {
                        message: 'Vui lòng chọn loại tin tức'
                    }
                }
            },
            txtTitle: {
                validators: {
                    notEmpty: {
                        message: 'Vui lòng nhập title'
                    }
                }
            },
            txtIntro: {
                validators: {
                    notEmpty: {
                        message: 'Vui lòng nhập intro'
                    }
                }
            }
        }
    });
});

// ẩn thông báo
$("div#notify").hide();
RED.ngApp.controller('NewsCtrl', function ($scope, $timeout, $apply, $http) {
    $scope.News;
    $scope.categoryNews = [];
    $scope.checked = {};
    $scope.modalEdit;
    $scope.editing = {};
    $scope.formatDate = RED.formartDateInList;
    $scope.fileName;

// show ckeditor
    $scope.editorOptions = {
        language: 'ru'
    };
    $scope.$on("ckeditor.ready", function (event) {
        $scope.isReady = true;
    });
// lấy danh sách id đã check
    $scope.getChecked = function () {
        var checked = [];
        for (var i in $scope.checked)
            if ($scope.checked[i])
                checked.push(i);
        return checked;
    };

//lấy danh sách tin tức và loại tin
    $scope.getList = function () {
        $.ajax({
            url: CONFIG.siteUrl + '/rest/news/list',
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                $scope.News = resp;
                for (var i in $scope.News) {
                    $scope.News[i].formatTime = RED.formatDate($scope.News[i].cretedDate);
                }
            });
        });
    };
    $scope.getCategories = function () {
        $.ajax({
            url: CONFIG.siteUrl + '/rest/cate-news/list',
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                $scope.Categories = resp;
            });
        });
    };
    $scope.getList();
    $scope.getCategories();
//xóa tin tức
    $scope.delete = function (item) {
        if (!confirm('Bạn chắc chắn muốn xóa những đối tượng này?'))
            return;
        idNews = item || $scope.getChecked();
        $.ajax({
            url: CONFIG.siteUrl + '/rest/news/delete',
            data: {
                id: idNews
            },
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                $("div#notify").show();
                $("div#notify").delay(2000).slideUp();
                if (resp.status) {
                    $scope.getList();
                }
            });
        });
    };
// sửa tin tức
    $scope.edit = function (value) {
        value = value || {'id': 0, 'stt': true, 'iurl': null};
        $scope.editing = value;
        $timeout(function () {
            $('#modalEdit').modal('show');
        });
    };
    //load ảnh
    $scope.uploadFile = function () {
        $scope.resetEleUpload();

        var options = {
            url: CONFIG.siteUrl + '/rest/news/upload-file'
        };
        $('#fileReqUpload').ajaxUploads(options).on('complete.upload', function (event, response) {
            $scope.$apply(function () {
                response = $.parseJSON(response);
                $scope.editing.image = response;
                $scope.editing.iurl = 'upload/temp/' + response;
            });

        }).change(function () { //tự động upload khi chọn file
            $(this).ajaxUploads('abort'); //hủy
            if ($(this).val())
                $(this).ajaxUploads('upload'); //bắt đầu 
        });

        $('#fileReqUpload').trigger("click");
    };

    $scope.resetEleUpload = function () {
        $("#fileReqUpload").remove();
        $("#box-upload-file").append('<input style="display:none" type="file" name="fileReqUpload" id="fileReqUpload" multiple accept="image/gif,image/png,image/jpeg,image/jpg,.xlsx,.xls,.doc, .docx,.txt,.pdf,.odf,.odt">');
    };
// thực hiện lưu tin tức
    $scope.save = function () {
//         kiểm tra validate
        var validator = $('#form-edit').data('bootstrapValidator');
        validator.validate();
        if (!validator.isValid())
            return;
        // thực hiện submit 
        var idCategories;
        var news = $.extend({}, $scope.editing);
        for (var i in $scope.Categories) {
            if ($scope.Categories[i].name == news.name) {
                idCategories = $scope.Categories[i].id;
                break;
            }
        }
        news.cateId = idCategories;
        $.ajax({
            type: 'POST',
            url: CONFIG.siteUrl + '/rest/news/update',
            data: news,
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                $("div#notify").show();
                $("div#notify").delay(2000).slideUp();
                if ($scope.chkCheck) {
                    $scope.editing = {};
                    $scope.editing.iurl = 'upload/temp/';
                    $scope.getList();
                } else {
                    if (resp.status) {
                        $($scope.modalEdit).modal('hide');
                        $scope.getList();
                    }
                }
            });
        });
    };
});


