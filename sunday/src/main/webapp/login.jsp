<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="login">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登陆界面 | 米莱女装专营店管理系统</title>
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
    <script type="text/javascript" src="assets/js/layer/layer.js"></script>
    <script type="text/javascript" src="assets/js/gVerify.js"></script>
    <script type="text/javascript" src="assets/js/angular.min.js"></script> 
</head>
<body class="theme-white" ng-controller="loginContrl" ng-cloak>
    <div class="am-g tpl-g">
        <div class="tpl-login">
            <div class="tpl-login-content">
                <div style="text-align:center;margin-bottom: 50px">
                	<h1>米莱女装专营店管理系统</h1>
                </div>
                <form class="am-form tpl-form-line-form "  ng-submit="submiLogin()" novalidate>
                    <div class="am-form-group am-u-sm-12">
                        <input ng-model="account" type="text" class="tpl-form-input"  placeholder="请输入账号">
                    </div>
							
                    <div class="am-form-group am-u-sm-12">
                        <input  ng-model="password" type="password" class="tpl-form-input"  placeholder="请输入密码">

                    </div>
                    <div class="am-form-group tpl-login-remember-me">
                    	<div class="am-u-sm-8">
                    	 	<input type="text" ng-model="captcha" id="captcha" class="input-code"   placeholder="输入验证码"/>
                    	</div>
                    	<div class="am-u-sm-3 am-u-end">
                    	  <label for="remember-me">
                        	   <div name="v_container" id="v_container" border="0" style="width:100px;height:34px;padding:2px;margin-right:10px"></div>
                         </label>
                    	</div>
                      

                    </div>
                    <div class="am-form-group ">

                        <button type="submit" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn">登陆</button>

                    </div>
                </form>
            </div>
        </div>
    </div>
<script src="assets/js/amazeui.min.js"></script>
<script>
	var app = angular.module('login', []);
	app.controller('loginContrl', function($scope,$http) {
		var verifyCode = new GVerify("v_container");
		$scope.submiLogin = function(){
			if($scope.account == "" || $scope.account == null){
				layer.msg('用户名不能为空');
				return ;
			}
			if($scope.password == "" || $scope.password == null){
				layer.msg('密码不能为空');
				return ;
			}
			if($scope.captcha == '' || $scope.captcha == null){
		        layer.msg('验证码不能为空');
		        $('#captcha').focus();
		        return ;
			}
			var res = verifyCode.validate($scope.captcha);
			if(!res){
				layer.msg('验证码输入错误');
				$('#captcha').val("");
				return ;
			}
			$http.post('login.do',{
				account:$scope.account,
				password:$scope.password,
			}).success(function (res){
			 	if(res==1){
			 		window.location.href="index.jsp";
			 	}
			 	else{
			 		layer.msg('用户名密码错误');
			 		verifyCode.refresh();
		 		}
			 		

			}).error(function(){
				layer.msg('用户名密码错误');
			});	
		};

	});
</script>
</body>
</html>