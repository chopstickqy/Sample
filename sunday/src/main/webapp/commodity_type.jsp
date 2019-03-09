<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" ng-app="commodity">
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
<body data-type="index" class="theme-white" ng-controller="commodityContrl" ng-init="queryCommoditys(0)" ng-cloak>
<div class="row-content am-cf">
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
        <div class="widget am-cf">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">类别名称</label>
                        <div class="am-u-sm-8">
                            <input type="text" ng-model="newType" class="am-form-field query-input" >
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3 am-u-end">
                    <div class="am-form-group">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button type="button" class="am-btn am-btn-default am-btn-success query-button " ng-click="insertConfirm()"><span class="am-icon-plus"></span> 新增</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table class="am-table am-table-striped am-table-hover">
                <thead>
                    <tr>
                        <th width="20%" class="am-text-center">序号</th>
                        <th width="60%" class="am-text-center">商品类别管理</th>
                        <th width="20%" class="am-text-center">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="type in typeList">
                        <td class="am-text-center">{{$index+1}}</td>
                        <td class="am-text-center">{{type.commodityType}}</td>
                        <td>
                            <div class="tpl-table-black-operation">
                                <a href="javascript:;" class="tpl-table-black-operation-del" ng-click="deleteCommodity(type.commodityType)" style="margin-left:30%">
                                    <i class="am-icon-trash"></i> 删除
                                </a>
                            </div> 
                        </td>
                    </tr>
                   	<tr ng-if="!typeList">
						<td colspan="3" align="center">无数据</td>
					</tr>
                </tbody>
            </table>
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
	var app = angular.module('commodity', []);
	app.controller('commodityContrl', function($scope,$http) {
		$scope.selectPage = 0;
		$scope.queryCommoditys = function(){
			$http.post('typeList.do',{
			}).success(function (res){
			 	$scope.typeList = res.typeList;
			}).error(function(){
				//window.location.href = "wrong.jsp";
			});	
		};
		$scope.insertConfirm = function(){
			if($scope.newType == "" || $scope.newType == null){
				layer.msg('不能添加空类别');
				return ;
			}
			layer.confirm('你，确定要添加类别吗？', {
					  btn: ['确定','取消'] //按钮
				}, function(){
					$http.post('insertType.do',{
						type:$scope.newType
					}).success(function(res){
						if (res == 1){
							layer.msg('添加成功');
							$scope.queryCommoditys();						
						} 
						else
							layer.msg('添加失败');
					
					}).error(function(){
						layer.msg('添加失败');
					});
				}, function(){
				});
		};
		$scope.deleteCommodity = function(type){
			layer.confirm('你，确定要删除此类别吗？', {
				  btn: ['确定','取消'] //按钮
			}, function(){
				$http.post('deleteType.do',{
					type : type,
				}).success(function(res){
					if (res == 1){
						layer.msg('删除成功');
						$scope.queryCommoditys();						
					} 
					else
						layer.msg('删除失败');
				
				}).error(function(){
					layer.msg('删除失败');
				});
			},function(){
			});
		};
	});
</script>
</body>

</html>