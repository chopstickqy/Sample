<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" ng-app="stockType">
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
<body data-type="index" class="theme-white" ng-controller="stockTypeContrl" ng-cloak>
<div class="row-content am-cf">
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
        <div class="widget am-cf">
			<ul data-am-widget="gallery" class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery-bordered" data-am-gallery="{  }" >
		      <li ng-repeat="index in typeList">
		        <div class="am-gallery-item">
		            <a href="stock_info.jsp" ng-click="setType(index.commodityType)">
		              <img src="assets/img/stock.jpg">
		                <h3 class="am-gallery-title am-text-center">{{index.commodityType}}</h3>
		            </a>
		        </div>
		      </li>
		  </ul>
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
	var app = angular.module('stockType', []);
	app.controller('stockTypeContrl', function($scope,$http) {
		$http.post('typeList.do',{
		}).success(function (res){
		 	$scope.typeList = res.typeList;
		}).error(function(){
			//window.location.href = "wrong.jsp";
		});	
		
		$scope.setType = function(commodityType){
			$http.post('stockType.do',{
				type:commodityType
			}).success(function (res){
			}).error(function(){
			});	
		}
	});
</script>
</body>

</html>