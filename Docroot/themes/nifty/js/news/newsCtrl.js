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
        }
    });
});

RED.ngApp.controller('newsCtrl', function ($scope, $apply, $timeout, $http){
    $scope.ajax = {};
    $scope.listNews = [];
    $scope.categoryNews = [];
    $scope.checked = {};
    $scope.modalEdit;
    $scope.editing ={};
    $scope.formatDate = RED.formartDateInList;
    
    $scope.editorOptions = {
        language: 'ru'
    };
    $scope.$on("ckeditor.ready", function (event){
        $scope.isReady = true;
    });
    //danh sach id check
    $scope.getChecked = function () {
        var checked = [];
        for (var i in $scope.checked)
            if ($scope.checked[i])
                checked.push(i);
        return checked;
    };
    // lay danh sach tin tuc
    $scope.getNews = function() {
        $.ajax({
            url: CONFIG.siteUrl + '/rest/news',
            dataType: 'json'
        }).done(function (resp){
            $scope.$apply(function (){
                $scope.listNews = resp;
            });
        });
    };
   //lay danh sach danh muc
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
    $scope.getNews();
    $scope.getCategory();
    
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
                
                if (resp.status) {
                    $scope.getNews();
                }
            });
        });
    };
    
    $scope.edit = function (value) {
        value = value || {'id': 0,  'iurl': null};
        $scope.editing = value;
        $timeout(function () {
            $('#modalEdit').modal('show');
        });
    };
    
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
    
    $scope.save = function () {
//         kiểm tra validate
        var validator = $('#form-edit').data('bootstrapValidator');
        validator.validate();
        if (!validator.isValid())
            return;
        // thực hiện submit 
        
        var news = $.extend({}, $scope.editing);
//        var idCategories;
//        for (var i in $scope.categoryNews) {
//            if ($scope.categoryNews[i].ten_danhmuc == news.ten_danhmuc) {
//                idCategories = $scope.categoryNews[i].id;
//                break;
//            }
//        }
       
        $.ajax({
            type: 'POST',
            url: CONFIG.siteUrl + '/rest/news/update',
            data: news,
            dataType: 'json'
        }).done(function (resp) {
            $scope.$apply(function () {
                
                if ($scope.chkCheck) {
                    $scope.editing = {};
                    $scope.editing.iurl = 'upload/temp/';
                    $scope.getNews();
                } else {
                    if (resp.status) {
                        $($scope.modalEdit).modal('hide');
                        $scope.getNews();
                    }
                }
            });
        });
    };
    
});


