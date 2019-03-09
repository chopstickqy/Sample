<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" ng-app="supplier">
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/add.compont.css">
</head>
<body data-type="index" class="theme-white" ng-controller="supplierContrl" ng-init="querySuppliers(0)" ng-cloak>
<div class="row-content am-cf">
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
        <div class="widget am-cf">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">供应商</label>
                        <div class="am-u-sm-8">
                            <input type="text" ng-model="searchName" class="am-form-field query-input" placeholder="请输入供应商名称">
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3 am-u-end">
                    <div class="am-form-group">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button type="button" class="am-btn am-btn-default am-btn-secondary query-button-purchase" ng-click="querySuppliers(0)"><span class="am-icon-search"></span> 查询</button>
                                <button type="button" class="am-btn am-btn-default am-btn-success query-button-purchase" ng-click="openModal('insert','')"><span class="am-icon-plus"></span> 新增</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table class="am-table am-table-striped am-table-hover">
                <thead>
                    <tr>
                        <th width="6%" class="am-text-center">序号</th>
                        <th width="11%" class="am-text-center">供应商名称</th>
                        <th width="7%" class="am-text-center">联系人</th>
                        <th width="8%" class="am-text-center">联系电话</th>
                        <th width="20%" class="am-text-center">地址</th>
                        <th width="15%" class="am-text-center">描述</th>
                        <th width="18%" class="am-text-center">更新时间</th>
                        <th width="15%" class="am-text-center">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="supplier in supplierList">
                        <td class="am-text-center">{{$index+1}}</td>
                        <td class="am-text-center">{{supplier.sName}}</td>
                        <td class="am-text-center">{{supplier.sContact}}</td>
                        <td class="am-text-center">{{supplier.sPhone}}</td>
                        <td class="am-text-center">{{supplier.sAddress}}</td>
                        <td class="am-text-center">{{supplier.sDescription}}</td>
                        <td class="am-text-center">{{supplier.sTime|date:"yyyy-MM-dd HH:mm:ss"}}</td>
                        <td>
                            <div class="tpl-table-black-operation">
                                <a href="javascript:;" ng-click="openModal('update',supplier)">
                                    <i class="am-icon-pencil"></i>修改
                                </a>
                                <a href="javascript:;" class="tpl-table-black-operation-del" ng-click="deleteSupplier(supplier.sId)">
                                    <i class="am-icon-trash"></i> 删除
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr ng-if="supplierList.length==0">
						<td colspan="8" align="center">无数据</td>
					</tr>
                </tbody>
            </table>
            <ul class="am-pagination am-pagination-right">
                <li ng-if="pageList && pageList.length>0" ng-class="{true:'am-disabled'}[selectPage==0]"><a href="javascript:void(0)" ng-click="previousQuery()">&laquo;</a></li>
               
                <li ng-repeat="page in pageList" ng-class="{true:'am-active'}[selectPage==$index]" ng-class="{true:'am-disabled'}[selectPage==$index]"><a href="javascript:void(0)" ng-click="querySuppliers($index)">{{$index+1}}</a></li>
                <li ng-if="pageList && pageList.length>0" ng-class="{true:'am-disabled'}[selectPage==pageList.length-1]"><a href="javascript:void(0)" ng-click="nextQuery()">&raquo;</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="am-modal am-modal-no-btn" tabindex="-1" id="your-modal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">供应商
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd">
      <form class="am-form am-form-horizontal pop-form" ng-submit="submitForm()" novalidate>
                <div class="am-form-group">
                  <label for="pname" class="am-u-sm-3 am-form-label">供应商名称</label>
                  <div class="am-u-sm-8 am-u-end">
                    <input type="text" ng-model="supplier.sName" placeholder="请输入供应商名称">
                  </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-3 am-form-label">联系人</label>
                    <div class="am-u-sm-8 am-u-end">
                      <input type="text" ng-model="supplier.sContact" placeholder="请输入联系人">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-3 am-form-label">联系电话</label>
                    <div class="am-u-sm-8 am-u-end">
                        <input type="text" ng-model="supplier.sPhone" placeholder="请输入联系电话">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-3 am-form-label">地址</label>
                    <div class="am-u-sm-8 am-u-end">
                        <input type="text" ng-model="supplier.sAddress" placeholder="请输入地址">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-3 am-form-label">描述</label>
                    <div class="am-u-sm-8 am-u-end">
                        <input type="text" ng-model="supplier.sDescription" placeholder="请输入描述信息">
                    </div>
                </div>
                <div class="am-form-group">
                  <div class="am-u-sm-12">
                    <button type="submit" class="am-btn am-btn-default am-center">提交登入</button>
                  </div>
                </div>
        </form>
    </div>
  </div>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/angular.min.js"></script> 
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/amazeui.datatables.min.js"></script>
<script src="assets/js/dataTables.responsive.min.js"></script>
<script src="assets/js/app.js"></script>
<script src="modify/js/layer/layer.js"></script>
<script>
	var app = angular.module('supplier', []);
	app.controller('supplierContrl', function($scope,$http) {
		$scope.selectPage = 0;
		$scope.modal = $('#your-modal');
		$scope.supplier;
		$scope.submitType;
		$scope.querySuppliers = function(page){
			$scope.selectPage = page;
			page = page*5;
			$http.post('querysuppliers.do',{
					name:$scope.searchName,
					page:page,
			}).success(function (res){
			 	$scope.supplierList = res.supplierList;
				$scope.pageList = res.pageList;
			}).error(function(){
				//window.location.href = "wrong.jsp";
			});	
		};
		$scope.previousQuery = function(){
			$scope.querySuppliers($scope.selectPage-1);
		};
		$scope.nextQuery = function(){
			$scope.querySuppliers($scope.selectPage+1);
		};
		$scope.submitForm = function(){
			if($scope.supplier.sName == "" || $scope.supplier.sName == null){
				layer.msg('请输入供应商名称');
				return ;
			}
			if($scope.supplier.sContact == "" || $scope.supplier.sContact == null){
				layer.msg('请输入联系人');
				return ;
			}
			if($scope.supplier.sPhone == "" || $scope.supplier.sPhone == null){
				layer.msg('请输入联系电话');
				return ;
			}
			if($scope.supplier.sAddress == "" || $scope.supplier.sAddress == null){
				layer.msg('请输入地址');
				return ;
			}
			if($scope.submitType=='insert'){
				layer.confirm('你，确定要添加供应商吗？', {
					  btn: ['确定','取消'] //按钮
				}, function(){
					$http.post('insertsupplier.do',{
						name : $scope.supplier.sName,
						contact : $scope.supplier.sContact,
						phone : $scope.supplier.sPhone,
						address : $scope.supplier.sAddress,
						description : $scope.supplier.sDescription,
					}).success(function(res){
						if (res == 1){
							$scope.modal.modal('close');
							layer.msg('添加成功');
							$scope.querySuppliers(0);						
						} 
						else
							layer.msg('添加失败');
					
					}).error(function(){
						layer.msg('添加失败');
					});
				}, function(){
				});
			} else if($scope.submitType=='update'){
				layer.confirm('你，确定要更新供应商信息吗？', {
					  btn: ['确定','取消'] //按钮
				}, function(){
					$http.post('updatesupplier.do',{
						id : $scope.supplier.sId,
						name : $scope.supplier.sName,
						contact : $scope.supplier.sContact,
						phone : $scope.supplier.sPhone,
						address : $scope.supplier.sAddress,
						description : $scope.supplier.sDescription,
					}).success(function(res){
						if (res == 1){
							$scope.modal.modal('close');
							layer.msg('更新成功');
							$scope.querySuppliers(0);						
						} 
						else
							layer.msg('更新失败');
					
					}).error(function(){
						layer.msg('更新失败');
					});
				}, function(){
				});
			}
		};
		$scope.deleteSupplier = function(id){
			layer.confirm('你，确定要删除供应商吗？', {
				  btn: ['确定','取消'] //按钮
			}, function(){
				$http.post('deletesupplier.do',{
					id : id,
				}).success(function(res){
					if (res == 1){
						layer.msg('删除成功');
						$scope.querySuppliers(0);						
					} 
					else
						layer.msg('删除失败');
				
				}).error(function(){
					layer.msg('删除失败');
				});
			},function(){
			});
		  };
		  $scope.openModal = function(type,supplier){
			  	var newSupplier = JSON.parse(JSON.stringify(supplier));  
				$scope.submitType = type;
				$scope.supplier = newSupplier;
				$scope.modal.modal();
		  }
	});
</script>
</body>

</html>