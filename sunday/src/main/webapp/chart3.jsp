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
	
		$scope.initChart = function(){
			$http.post('profitstatistics.do',{
			}).success(function(res){
				$scope.buyerList = res.monthList;
				$scope.profitList = res.profitList;
				
				var purchaseCharts = echarts.init(document.getElementById("echarts-purchase"));
				 option = {
						  	title: {
						        text: '利润统计图'
						    },
				            tooltip: {
				                trigger: 'axis'
				            },
				            grid: {
				                top: '3%',
				                left: '3%',
				                right: '4%',
				                bottom: '3%',
				                containLabel: true
				            },
				            toolbox: {
						        feature: {
						            saveAsImage: {}
						        }
						    },
						    grid: {
						        left: '3%',
						        right: '4%',
						        bottom: '3%',
						        containLabel: true
						    },
				            xAxis: [{
				                type: 'category',
				                boundaryGap: false,
				                data: res.monthList
				            }],
				            yAxis: [{
				                type: 'value'
				            }],
				            textStyle: {
				                color: '#838FA1'
				            },
				            series: [{
				                name: '利润',
				                type: 'line',
				                stack: '总量',
				                areaStyle: { normal: {} },
				                data: res.profitList,
				                itemStyle: {
				                    normal: {
				                        color: '#1cabdb',
				                        borderColor: '#1cabdb',
				                        borderWidth: '2',
				                        borderType: 'solid',
				                        opacity: '1'
				                    },
				                    emphasis: {

				                    }
				                }
				            }]
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