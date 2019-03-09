<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" ng-app="staff">
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
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
<body data-type="index" class="theme-white" ng-controller="staffContrl"ng-init="queryStaff(0)" ng-cloak>
<div class="row-content am-cf">
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
        <div class="widget am-cf">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">员工姓名</label>
                        <div class="am-u-sm-8">
                            <input type="text" ng-model="searchName" class="am-form-field query-input" placeholder="请输入员工姓名">
                        </div>
                    </div> 
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="type" class="am-u-sm-4 am-form-label am-text-middle query-label">员工类别</label>
                        <div class="am-u-sm-8">
                            <select class="query-input" ng-model="searchType">
                                <option value="">请选择员工类别</option>
                                <option value="采购员">采购员</option>
                                <option value="销售员">销售员</option>
                            </select>
                        </div>
                    </div> 
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3 am-u-end">
                    <div class="am-form-group">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button type="button" class="am-btn am-btn-default am-btn-secondary query-button" ng-click="queryStaff(0)"><span class="am-icon-search"></span> 查询</button>
                                <button type="button" class="am-btn am-btn-default am-btn-success query-button" ng-click="openModal('insert','')"><span class="am-icon-plus"></span> 新增</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table class="am-table am-table-striped am-table-hover" id="user_table">
                <thead>
                    <tr>
                        <th width="10%" class="am-text-center">序号</th>
                        <th width="10%" class="am-text-center">员工姓名</th>
                        <th width="10%" class="am-text-center">员工编号</th>
                        <th width="10%" class="am-text-center">性别</th>
                        <th width="10%" class="am-text-center">联系方式</th>
                        <th width="10%" class="am-text-center">员工类别</th>
                        <th width="20%" class="am-text-center">更新时间</th>
                        <th width="15%" class="am-text-center">操作</th>
                    </tr>
                </thead>
                <tbody>
						<tr ng-repeat="user in userList">
							<td class="am-text-center" >{{$index+1}}</td>
							<td class="am-text-center" >{{user.uName}}</td>
							<td class="am-text-center" >{{user.uAccount}}</td>
							<td class="am-text-center" >{{user.uSex}}</td>
							<td class="am-text-center" >{{user.uPhone}}</td>
							<td class="am-text-center" >{{user.uType}}</td>
							<td class="am-text-center" >{{user.uTime|date:"yyyy-MM-dd HH:mm:ss"}}</td>
						    <td id="operation">
	                            <div class="tpl-table-black-operation">
	                               <a href="javascript:;" ng-click="openModal('update',user)">
	                                    <i class="am-icon-pencil"></i>修改
	                                </a>
	                                <a href="javascript:;" class="tpl-table-black-operation-del" ng-if="user.uType!=='店长'" ng-click="deleteUser(user.uAccount)">
	                                    <i class="am-icon-trash"></i> 删除
	                                </a>
	                            </div>
                        	</td>
						</tr>
						<tr ng-if="userList.length==0">
							<td colspan="8" align="center">无数据</td>
						</tr>
                </tbody>
            </table>
            <ul class="am-pagination am-pagination-right">
                <li ng-if="pageList && pageList.length>0" ng-class="{true:'am-disabled'}[selectPage==0]"><a href="javascript:void(0)" ng-click="previousQuery()">&laquo;</a></li>
               
                <li ng-repeat="page in pageList" ng-class="{true:'am-active'}[selectPage==$index]" ng-class="{true:'am-disabled'}[selectPage==$index]"><a href="javascript:void(0)" ng-click="queryStaff($index)">{{$index+1}}</a></li>
                <li ng-if="pageList && pageList.length>0" ng-class="{true:'am-disabled'}[selectPage==pageList.length-1]"><a href="javascript:void(0)" ng-click="nextQuery()">&raquo;</a></li>
            </ul>
        </div>
    </div>
</div>   
<div class="am-modal am-modal-no-btn" tabindex="-1" id="your-modal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">员工
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd">
      <form class="am-form am-form-horizontal pop-form" ng-submit="submitForm()" novalidate>
                <div class="am-form-group">
                  <label for="pname" class="am-u-sm-2 am-form-label">员工姓名</label>
                  <div class="am-u-sm-9 am-u-end">
                    <input type="text" ng-model="user.uName" placeholder="请输入员工姓名">
                  </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">员工编号</label>
                    <div class="am-u-sm-9 am-u-end">
                      <input ng-disabled="submitType=='update'" type="text" ng-model="user.uAccount" placeholder="请输入员工编号">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">性别</label>
                    <div class="am-u-sm-9 am-u-end" style="text-align:left !important">
                        <label class="am-radio-inline">
                            <input type="radio" name="sex" value="男" ng-model="user.uSex" > 男
                        </label>
                        <label class="am-radio-inline">
                            <input type="radio" name="sex" value="女" ng-model="user.uSex"> 女
                        </label>
                    </div>
                </div>            
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">联系方式</label>
                    <div class="am-u-sm-9 am-u-end">
                        <input type="text" ng-model="user.uPhone" placeholder="请输入联系方式">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">员工类别</label>
                    <div class="am-u-sm-9 am-u-end">
                        <select ng-model="user.uType" ng-disabled="user.uType=='店长'">
                            <option value="">请选择员工类别</option>
                            <option value="采购员">采购员</option>
                            <option value="销售员">销售员</option>
                        </select>
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
	var app = angular.module('staff', []);
	app.controller('staffContrl', function($scope,$http) {
		$scope.selectPage = 0;
		$scope.modal = $('#your-modal');
		$scope.user;
		$scope.submitType;
		$scope.queryStaff = function(page){
			$scope.selectPage = page;
			page = page*10;
			$http.post('queryusers.do',{
					name:$scope.searchName,
					type:$scope.searchType,
					page:page,
			}).success(function (res){
			 	$scope.userList = res.userList;
				$scope.pageList = res.pageList;
			}).error(function(){
				//window.location.href = "wrong.jsp";
			});	
		};
		$scope.previousQuery = function(){
			$scope.queryStaff($scope.selectPage-1);
		};
		$scope.nextQuery = function(){
			$scope.queryStaff($scope.selectPage+1);
		};
		$scope.submitForm = function(){
			if($scope.user.uAccount == "" || $scope.user.uAccount == null){
				layer.msg('请输入员工编号');
				return ;
			}
			if($scope.user.uName == "" || $scope.user.uName == null){
				layer.msg('请输入姓名');
				return ;
			}
			if($scope.user.uSex == "" || $scope.user.uSex == null){
				layer.msg('请选择性别');
				return ;
			}
			if($scope.user.uPhone == "" || $scope.user.uPhone == null){
				layer.msg('请输入联系电话');
				return ;
			}
			if($scope.user.uType == "" || $scope.user.uType == null){
				layer.msg('请选择员工类别');
				return ;
			}
			if($scope.submitType=='insert'){
				layer.confirm('你，确定要添加用户吗？', {
					  btn: ['确定','取消'] //按钮
				}, function(){
					$http.post('insertuser.do',{
						account : $scope.user.uAccount,
						name : $scope.user.uName,
						sex : $scope.user.uSex,
						phone : $scope.user.uPhone,
						type : $scope.user.uType,
					}).success(function(res){
						if (res == 1){
							$scope.modal.modal('close');
							layer.msg('添加成功');
							$scope.queryStaff(0);						
						} 
						else
							layer.msg('添加失败');
					
					}).error(function(){
						layer.msg('添加失败');
					});
				}, function(){
				});
			} else if($scope.submitType=='update'){
				layer.confirm('你，确定要更用户信息吗？', {
					  btn: ['确定','取消'] //按钮
				}, function(){
					$http.post('updateuser.do',{
						account : $scope.user.uAccount,
						name : $scope.user.uName,
						sex : $scope.user.uSex,
						phone : $scope.user.uPhone,
						type : $scope.user.uType,
					}).success(function(res){
						if (res == 1){
							$scope.modal.modal('close');
							layer.msg('更新成功');
							$scope.queryStaff(0);						
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
		$scope.deleteUser = function(account){
			layer.confirm('你，确定要删除用户吗？', {
				  btn: ['确定','取消'] //按钮
			}, function(){
				$http.post('deleteuser.do',{
					account: account
				}).success(function (res){
					if (res == 1){
						layer.msg('删除成功');
						$scope.queryStaff(0);						
					} 
					else
						layer.msg('删除成失败');
				}).error(function(){
					layer.msg('删除成失败');
				});	
	        },function(){
	        	
	        })
		}
		$scope.openModal = function(type,user){
			var newUser = JSON.parse(JSON.stringify(user));  
			$scope.submitType = type;
			$scope.user = newUser;
			$scope.modal.modal();
		}
	});
</script>
</body>

</html>