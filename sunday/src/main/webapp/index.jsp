<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%   
if (session.getAttribute("account") == null) {   
	response.sendRedirect(basePath+"login.jsp");   
	return;   
}   
%>  
<!DOCTYPE html>
<html lang="en" ng-app="index">
<head>
	<base href="<%=basePath%>" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>米莱女装专营店管理系统</title>
    <meta name="description" content="这是一个 index 页面">
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
    <script src="assets/js/jquery.min.js"></script>
</head>
<body data-type="index" class="theme-white" ng-controller="indexContrl" ng-cloak>
    <div class="am-g tpl-g">
        <!-- 头部 -->
        <header>
            <!-- logo -->
            <div class="am-fl tpl-header-logo">
               <a href="right.html" target="right_iframe"><img src="assets/img/logo_index.png" alt=""></a>
            </div>
            <!-- 右侧内容 -->
            <div class="tpl-header-fluid">
                <!-- 侧边切换
                <div class="am-fl tpl-header-switch-button am-icon-list">
                    <span>

                </span>
                
                </div>
                 -->
                <!-- 其它功能-->
                <div class="am-fr tpl-header-navbar">
                    <ul>
                        <!-- 欢迎语 -->
                        <li class="am-text-sm tpl-header-navbar-welcome">
                            <a href="javascript:;" style="cursor:default">欢迎你，<span id="test"><%=session.getAttribute("typeName") %></span> </a>
                        </li>
                         <li class="am-text-sm">
                            <a href="javascript:;" ng-click="openModal()" >修改密码</a>
                        </li>
                        <!-- 退出 -->
                        <li class="am-text-sm">
                            <a href="javascript:;" ng-click="logout()">
                                <span class="am-icon-sign-out"></span> 退出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 侧边导航栏 -->
        <div class="left-sidebar">
            <!-- 菜单 -->
            <ul class="sidebar-nav">
                <li class="sidebar-nav-heading">Mile<span class="sidebar-nav-heading-info"> 米莱</span></li>
                <li class="sidebar-nav-link">
                    <a href="javascript:;" class="sidebar-nav-sub-title">
                        <i class="am-icon-envira sidebar-nav-link-logo"></i> 基础管理
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                    </a>
                    <ul class="sidebar-nav sidebar-nav-sub">
                        <li class="sidebar-nav-link">
                                <a href="commodity_info.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 商品信息
                            </a>
                        </li>
                        <li class="sidebar-nav-link">
                            <a href="stockType.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 库存管理
                            </a>
                        </li>
                        <li class="sidebar-nav-link" ng-if="sessionType=='店长'">
                            <a href="order_info.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 订单管理
                            </a>
                        </li>
                        <li class="sidebar-nav-link">
                            <a href="commodity_type.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 类型管理
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-nav-link" ng-show="sessionType!='销售员'">
                    <a href="javascript:;" class="sidebar-nav-sub-title">
                        <i class="am-icon-envira sidebar-nav-link-logo"></i> 采购管理
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                    </a>
                    <ul class="sidebar-nav sidebar-nav-sub">
                        <li class="sidebar-nav-link">
                                <a href="supplier.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 供应商管理
                            </a>
                        </li>
                        <li class="sidebar-nav-link">
                            <a href="purchase_order.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 采购订单
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-nav-link"  ng-show="sessionType!='采购员'">
                    <a href="javascript:;" class="sidebar-nav-sub-title">
                        <i class="am-icon-envira sidebar-nav-link-logo"></i> 销售管理
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                    </a>
                    <ul class="sidebar-nav sidebar-nav-sub">
                        <li class="sidebar-nav-link">
                                <a href="customer.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 客户管理
                            </a>
                        </li>
                        <li class="sidebar-nav-link">
                            <a href="sales_order.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 销售订单
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-nav-link" ng-show="sessionType=='店长'">
                    <a href="javascript:;" class="sidebar-nav-sub-title">
                        <i class="am-icon-envira sidebar-nav-link-logo"></i> 统计分析
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                    </a>
                    <ul class="sidebar-nav sidebar-nav-sub">
                        <li class="sidebar-nav-link">
                            <a href="chart1.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 采购统计
                            </a>
                        </li>
                        <li class="sidebar-nav-link">
                            <a href="chart2.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 销售统计
                            </a>
                        </li>
                        <li class="sidebar-nav-link">
                            <a href="chart3.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 利润统计
                            </a>
                        </li>
                        <li class="sidebar-nav-link">
                            <a href="chart4.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 尺码统计
                            </a>
                        </li>
                         <li class="sidebar-nav-link">
                            <a href="chart5.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 销售类别利润统计
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-nav-link"  ng-show="sessionType=='店长'">
                    <a href="javascript:;" class="sidebar-nav-sub-title">
                        <i class="am-icon-envira sidebar-nav-link-logo"></i> 管理员设置
                        <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                    </a>
                    <ul class="sidebar-nav sidebar-nav-sub">
                        <li class="sidebar-nav-link">
                                <a href="staff_manage.jsp" target="right_iframe">
                                <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 用户设置
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <!-- 内容区域 -->
        <div class="tpl-content-wrapper">
            <iframe id='right_iframe' name="right_iframe" src="right.html" frameborder="0" width="100%" height="700px" scrolling="no"></iframe>
        </div>
    </div>
    <div class="am-modal am-modal-no-btn" tabindex="-1" id="your-modal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">修改密码
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd">
      <form class="am-form am-form-horizontal pop-form" ng-submit="submitForm()" novalidate>
                <div class="am-form-group">
                  <label for="pname" class="am-u-sm-3 am-form-label">原密码</label>
                  <div class="am-u-sm-8 am-u-end">
                    <input type="password" ng-model="oldPassword" placeholder="请输入原密码">
                  </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-3 am-form-label">新密码</label>
                    <div class="am-u-sm-8 am-u-end">
                      <input type="password" ng-model="newPassword" placeholder="请输入新密码">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-3 am-form-label">确认密码</label>
                    <div class="am-u-sm-8 am-u-end">
                        <input type="password" ng-model="newPasswordConfir" placeholder="请确认新密码">
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
	var app = angular.module('index', []);
	app.controller('indexContrl', function($scope,$http) {
		$scope.sessionType ;
		$scope.sessionAccount ;
		$scope.modal = $('#your-modal');
		$http.post('session.do',{
		}).success(function(res){
			$scope.sessionType = res.type;
			$scope.sessionAccount = res.account; 
		}).error(function(){
		});
		$scope.logout = function(){
			layer.confirm('你，确定退出吗？', {
				  btn: ['确定','取消'] //按钮
			}, function(){
				$http.post('logout.do',{
				}).success(function(res){
					window.location.reload() ;
				}).error(function(){
					window.location.reload() ;
				});
			},function(){
			}
		)}
		$scope.submitForm = function(){
			if($scope.oldPassword == "" || $scope.oldPassword == null){
				layer.msg('请输入原密码');
				return ;
			}
			if($scope.newPassword == "" || $scope.newPassword == null){
				layer.msg('请输入新密码');
				return ;
			}
			if($scope.newPasswordConfir == "" || $scope.newPasswordConfir == null){
				layer.msg('请输入确认密码');
				return ;
			}
			if($scope.newPassword != $scope.newPasswordConfir){
				layer.msg('两次密码输入不一致');
				return ;
			}

			layer.confirm('你，确定修改密码吗？', {
				  btn: ['确定','取消'] //按钮
			}, function(){
				$http.post('updatepassword.do',{
					account:$scope.sessionAccount,
					newPassword:$scope.newPassword,
					oldPassword:$scope.oldPassword
				}).success(function(res){
					if(res==1){
						layer.msg('密码修改成功');
						$scope.modal.modal('close');
					}  else if(res==-2){
						layer.msg('原密码输入错误');
					} else{
						layer.msg('密码修改失败');
					}
				}).error(function(){
					layer.msg('密码修改失败');
				});
			},function(){
			}
		)}
		 $scope.openModal = function(){
			 $scope.newPassword = "";
			 $scope.oldPassword = "";
			 $scope.newPasswordConfir = "";
			 $scope.modal.modal();
		 }
	});
</script>
</body>

</html>