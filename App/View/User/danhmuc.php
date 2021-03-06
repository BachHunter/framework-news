<?php
/* @var $this \App\View\Layout\DefaultLayout */
$this->addJs(array(
    $this->themeUrl() . '/js/views/cateNewsCtrl.js',
));
?>

<style>
    #modalEdit .modal-body{padding: 0;}
    #modalEdit .tab-content{padding: 15px;}
    #modalEdit legend{margin-bottom: 0;}
</style>

<div id="page-title">
    <h1 class="page-header text-overflow">Loại Tin</h1>
    <div class="col-sm-2 alert alert-success" id="notify">
      <span>Thành Công !!!</span>
    </div>
<angular ng-cloak ng-controller="cateNewsCtrl">
    <div class="panel">
        <div class="panel-body">
            <button class="btn btn-primary btn-labeled fa fa-plus" ng-click="edit()">Thêm mới</button>
            <button class="btn btn-default" ng-click="delete()" ng-disabled="getChecked().length == 0">Xóa</button>

            <table class="table table-striped table-hover table-record">
                <thead>
                    <tr>
                        <th style="min-width: 50px;" class="center">
                            <input type="checkbox" />
                        </th>
                        <th style="min-width: 50px;" class="center">&nbsp;</th>
                        <th style="min-width: 50px;">STT</th>
                        <th style="min-width: 150px;">Name</th>
                        <th style="min-width: 150px;">Date Create</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="(stt,cate) in categoryNews">
                        <td class="center">
                            <input type="checkbox"  ng-model="checked[cate.id]" ng-click="click()"/>
                        </td>
                        <td class="tbl-actions center">
                            <div class="dropdown">
                                <a href="javascript:;" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bars"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="javascript:;" ng-click="edit(cate)">Sửa</a></li>
                                    <li><a href="javascript:;" ng-click="delete(cate.id)">Xóa</a></li>
                                </ul>
                            </div>
                        </td>
                        <td>{{stt + 1}}</td>
                        <td>{{cate.name}}</td>
                        <td>{{cate.formatTime}}</td>
                    </tr>
                </tbody>
            </table>
        </div><!--panel-body-->
    </div><!--panel-->


    <form class="form-horizontal" id="form-edit">
        <!-- Modal -->
        <div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" ng-dom="modalEdit">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Loại Tin</h4>
                    </div>
                    <div class="modal-body">
                        <div class="tab-content">
                            <div  class="tab-pane"  ng-class="<?php echo "{active: tab==0}" ?>">
                                <div class="form-group">
                                    <label class="control-label col-xs-3" for="txt-code"><?php echo static::HTML_REQUIRED ?> Tên Loại Tin:</label>
                                    <div class="col-xs-5">
                                        <input type="text" id="txt-code" name="txtCateName" ng-model="editing.name" required class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Hủy bỏ</button>
                        <button type="button" class="btn btn-primary" ng-click="save()" ng-disabled="ajax.save">Ghi lại</button>
                         <div class="form-group">
                                    <div class="col-xs-8 col-xs-offset-4">
                                        <label class="check" id="chkCheck">
                                            <input type="checkbox"  ng-model="chkCheck"/>
                                            Ghi&Thêm Lại
                                        </label>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div ng-user-picker></div>
</angular>
