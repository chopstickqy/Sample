<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" ng-app="chart">
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
</head>
<body data-type="chart" class="theme-white" ng-controller="chartContrl" ng-init="initChart()" ng-cloak>
<div class="row-content am-cf">
    <div class="widget am-cf">          
        <div class="widget-body am-fr">
      	   	 <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3 am-u-end">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">类别</label>
                        <div class="am-u-sm-8">
                            <div class="am-form-group tpl-table-list-select">
                                <select class="query-input" ng-model="type" >
                                     <option ng-repeat="type in typeList" ng-value="type.commodityType">{{type.commodityType}}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <div class="am-u-sm-12">
                            <div class="am-form-group tpl-table-list-select">
                                <select class="query-input" ng-model="dateFormat" >
                                    <option value="年">年利润</option>
                                    <option value="月">月利润</option>
                                    <option value="日">日利润</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button type="button" class="am-btn am-btn-default am-btn-secondary query-button" ng-click="setChart()"><span class="am-icon-search"></span> 搜索</button>
                            </div>
                        </div>
                    </div>
                </div>
             </div>
            <div style="height: 400px" class="" id="echarts-purchase">

            </div>
        </div>
    </div>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/angular.min.js"></script> 
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/echarts.min.js"></script>
<script src="assets/js/amazeui.datatables.min.js"></script>
<script src="assets/js/dataTables.responsive.min.js"></script>
<script src="assets/js/app.js"></script>
<script>
	var app = angular.module('chart', []);
	app.controller('chartContrl', function($scope,$http) {
		$http.post('typeList.do',{
		}).success(function (res){
		 	$scope.typeList = res.typeList;
		 	$scope.dateFormat = "年";
		 	$scope.type = res.typeList[0].commodityType;
		}).error(function(){
			//window.location.href = "wrong.jsp";
		});	
		$scope.setChart = function(){
			$http.post('typesales.do',{
				type:$scope.type,
				dateFormate:$scope.dateFormat
			}).success(function(res){
				$scope.profitList = res.profitList;
				$scope.dateList = res.dateList;
				
				var purchaseCharts = echarts.init(document.getElementById("echarts-purchase"));
				option = {
					    color: ['#3398DB'],
					    tooltip : {
					        trigger: 'axis',
					        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					        }
					    },
					    grid: {
					        left: '3%',
					        right: '4%',
					        bottom: '3%',
					        containLabel: true
					    },
					    xAxis : [
					        {
					            type : 'category',
					            data : res.dateList,
					            axisTick: {
					                alignWithLabel: true
					            }
					        }
					    ],
					    yAxis : [
					        {
					            type : 'value'
					        }
					    ],
					    series : [
					        {
					            name:'利润',
					            type:'bar',
					            barWidth: '60%',
					            data:res.profitList
					        }
					    ]
					};


				purchaseCharts.setOption(option);
				
			}).error(function(){
				alert('出错了');
			});
			
		};

	});
</script>
</body>

</html>