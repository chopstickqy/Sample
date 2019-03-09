<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" ng-app="stock">
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
<body data-type="index" class="theme-white" ng-controller="stockContrl" ng-init="queryStocks(0);querySuppliers()" ng-cloak>
<div class="row-content am-cf">
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
        <div class="widget am-cf">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">商品名称</label>
                        <div class="am-u-sm-8">
                            <input type="text" ng-model="searchName" class="am-form-field query-input" placeholder="请输入商品名称">
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">商品编号</label>
                        <div class="am-u-sm-8">
                            <input type="text" ng-model="searchNumber" class="am-form-field query-input" placeholder="请输入商品编号">
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3 am-u-end">
                        <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                            <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">供应商</label>
                            <div class="am-u-sm-8">
                                <select class="query-input" ng-model="searchSupplier">
                                	<option value="">请选择供应商</option>
                                    <option ng-repeat="supplier in supplierList" ng-value="supplier.sName">{{supplier.sName}}</option>   
                                </select>
                            </div>
                        </div>
                </div>
            </div>
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12" style="margin-top:10px">
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                        <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p ">
                            <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">库存数量&nbsp;</label>
                            <div class="am-u-sm-8 am-form-inline">
                                <input type="text" ng-model="minQuantity" class="am-form-field query-input-small"/>
                                <span class="range-line">—</span>
                                <input type="text" ng-model="maxQuantity" class="am-form-field query-input-small"/>
                            </div>
                        </div>
                    </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p ">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">开始时间</label>
                        <div class="am-u-sm-8 am-form-inline">
                            <input type="text" id="minTime" class="am-form-field query-input" data-am-datepicker readonly placeholder="选择开始时间"/>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p ">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">结束时间</label>
                        <div class="am-u-sm-8 am-form-inline">
                            <input type="text" id="maxTime" class="am-form-field query-input" data-am-datepicker readonly placeholder="选择结束时间"/>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-btn-toolbar">
                        <div class="am-btn-group am-btn-group-xs">
                            <button type="button" class="am-btn am-btn-default am-btn-secondary query-button" ng-click="queryStocks(0)"><span class="am-icon-search"></span> 查询</button>
                        </div>
                    </div>
                </div>
            </div>
            <table class="am-table am-table-striped am-table-hover">
                <thead>
                    <tr>
                        <th width="5%" class="am-text-center">序号</th>
                        <th width="20%" class="am-text-center">商品名称</th>
                        <th width="10%" class="am-text-center">商品编号</th>
                        <th width="12%" class="am-text-center">供应商</th>
                        <th width="10%" class="am-text-center">库存数量</th>
                        <th width="12%" class="am-text-center">最近入库时间</th>
                        <th width="12%" class="am-text-center">最近入库数量</th>
                        <th width="7%" class="am-text-center">状态</th>
                        <th width="10%" class="am-text-center">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="stock in stockList">
                        <td class="am-text-center">{{$index+1}}</td>
                        <td class="am-text-center">{{stock.tName}}</td>
                        <td class="am-text-center">{{stock.tNumber}}</td>
                        <td class="am-text-center">{{stock.tSupplier}}</td>
                        <td class="am-text-center">{{stock.tQuantity}}</td>
                        <td class="am-text-center">{{stock.tTime|date:"yyyy-MM-dd HH:mm:ss"}}</td>
                        <td class="am-text-center">{{stock.tInQuantity}}</td>
                        <td class="am-text-center" ng-class="{true:'warn-info'}[stock.tState=='紧缺']">{{stock.tState}}</td>
                        <td>
                            <div class="tpl-table-black-operation">
                                <a ng-class="{true:'am-disabled'}[stock.tState=='紧缺']" href="javascript:void(0);" ng-click="puchaseNotice(stock.tId,'紧缺')">
                                    <i class="am-icon-pencil"></i> 采购通知
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr ng-if="stockList.length==0">
						<td colspan="8" align="center">无数据</td>
					</tr>
                </tbody>
            </table>
          	<ul class="am-pagination am-pagination-right">
               <li ng-if="pageList && pageList.length>0" ng-class="{true:'am-disabled'}[selectPage==0]"><a href="javascript:void(0)" ng-click="previousQuery()">&laquo;</a></li>
               <li ng-repeat="page in pageList" ng-class="{true:'am-active'}[selectPage==$index]" ng-class="{true:'am-disabled'}[selectPage==$index]"><a href="javascript:void(0)" ng-click="queryStocks($index)">{{$index+1}}</a></li>
               <li ng-if="pageList && pageList.length>0" ng-class="{true:'am-disabled'}[selectPage==pageList.length-1]"><a href="javascript:void(0)" ng-click="nextQuery()">&raquo;</a></li>
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
	var app = angular.module('stock', []);
	app.controller('stockContrl', function($scope,$http) {
		$scope.selectPage = 0;
		$scope.querySuppliers = function(){
			$http.post('querysuppliers.do',{
					name:"",
					page:"0",
			}).success(function (res){
			 	$scope.supplierList = res.supplierList;
			}).error(function(){
				//window.location.href = "wrong.jsp";
			});	
		};
		$scope.queryStocks = function(page){
			$scope.selectPage = page;
			page = page*5;
			$http.post('querystocks.do',{
					name:$scope.searchName,
					number:$scope.searchNumber,
					supplier:$scope.searchSupplier,
					minQuantity:$scope.minQuantity,
					maxQuantity:$scope.maxQuantity,
					minTime:$("#minTime").val(),
					maxTime:$("#maxTime").val(),
					page:page,
			}).success(function (res){
			 	$scope.stockList = res.stockList;
				$scope.pageList = res.pageList;

			}).error(function(){
				//window.location.href = "wrong.jsp";
			});	
		};
		$scope.previousQuery = function(){
			$scope.queryStocks($scope.selectPage-1);
		};
		$scope.nextQuery = function(){
			$scope.queryStocks($scope.selectPage+1);
		};
		$scope.puchaseNotice = function(id,state){
			layer.confirm('你，确定进行商品采购通知吗？', {
				  btn: ['确定','取消'] //按钮
			}, function(){
				$http.post('updatestockstate.do',{
	        		id:id,
					state : state,
				}).success(function(res){
					if (res == 1){
						layer.msg('更新成功');
						$scope.queryStocks(0);						
					} 
					else
						layer.msg('更新失败');
				
				}).error(function(){
					layer.msg('更新失败');
				});
			}, function(){
			}
		)};
	});
</script>
</body>

</html>