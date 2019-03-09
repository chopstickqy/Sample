<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" ng-app="order">
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
<body data-type="index" class="theme-white" ng-controller="orderContrl"ng-init="queryOrders(0)" ng-cloak>
<div class="row-content am-cf">
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
        <div class="widget am-cf">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">订单类型</label>
                        <div class="am-u-sm-8">
                            <select class="query-input" ng-model="searchOrderType">
                                <option value="purchase">采购订单</option>
                                <option value="sales">销售订单</option>
                            </select>
                        </div>
                    </div> 
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">订单状态</label>
                        <div class="am-u-sm-8">
                            <select class="query-input" ng-model="searchState">
                                 	<option value="">请选择订单状态</option>
                                    <option value="待确认" ng-if="searchOrderType=='sales' || searchOrderType=='purchase'">待确认</option>
                                    <option value="待审核" ng-if="searchOrderType=='purchase'">待审核</option>
                                    <option value="已入库" ng-if="searchOrderType=='purchase'">已入库</option>
                                    <option value="退款中" ng-if="searchOrderType=='purchase'">退款中</option>
                                    <option value="已退款" ng-if="searchOrderType=='purchase'">已退款</option>
                                    <option value="已出库" ng-if="searchOrderType=='sales'">已出库</option>
                            </select>
                        </div>
                    </div> 
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3 am-u-end">
                    <div class="am-form-group">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button type="button" class="am-btn am-btn-default am-btn-secondary query-button" ng-click="queryOrders(0)"><span class="am-icon-search"></span> 查询</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table class="am-table am-table-striped am-table-hover">
                <thead>
                    <tr>
                        <th width="10%" class="am-text-center">序号</th>
                        <th width="20%" class="am-text-center">订单编号</th>
                        <th width="20%" class="am-text-center">采购员编号</th>
                        <th width="25%" class="am-text-center">下单日期</th>
                        <th width="15%" class="am-text-center">订单状态</th>
                        <th width="10%" class="am-text-center">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat=" order in orderList">
                        <td class="am-text-center">{{$index+1}}</td>
                        <td class="am-text-center">{{order.oId}}{{order.eId}}</td>
                        <td class="am-text-center">{{order.oUser}}{{order.eUser}}</td>
                        <td class="am-text-center">{{order.oTime|date:"yyyy-MM-dd HH:mm:ss"}}{{order.eTime|date:"yyyy-MM-dd HH:mm:ss"}}</td>
                        <td class="am-text-center">{{order.oState}}{{order.eState}}</td>
                        <td>
                            <div class="tpl-table-black-operation">
                                <a ng-if="order.oState=='待审核' || order.eState=='待审核'" href="javascript:;" class="tpl-table-black-operation-del" ng-click="verifyConfirm(order.oId,order.eId,'已入库')">
                                    <i class="am-icon-trash"></i> 审核
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr ng-if="orderList.length==0">
						<td colspan="6" align="center">无数据</td>
					</tr>
                </tbody>
            </table>
           <ul class="am-pagination am-pagination-right">
               <li ng-if="pageList && pageList.length>0" ng-class="{true:'am-disabled'}[selectPage==0]"><a href="javascript:void(0)" ng-click="previousQuery()">&laquo;</a></li>
               <li ng-repeat="page in pageList" ng-class="{true:'am-active'}[selectPage==$index]" ng-class="{true:'am-disabled'}[selectPage==$index]"><a href="javascript:void(0)" ng-click="queryOrders($index)">{{$index+1}}</a></li>
               <li ng-if="pageList && pageList.length>0" ng-class="{true:'am-disabled'}[selectPage==pageList.length-1]"><a href="javascript:void(0)" ng-click="nextQuery()">&raquo;</a></li>
           </ul>
        </div>
    </div>
</div>   
<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">确认提示</div>
    <div class="am-modal-bd">
      	你，确定进行订单审核通过吗？
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>  
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.popeasy.js"></script>
<script src="assets/js/angular.min.js"></script> 
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/amazeui.datatables.min.js"></script>
<script src="assets/js/dataTables.responsive.min.js"></script>
<script src="assets/js/app.js"></script>
<script src="modify/js/layer/layer.js"></script>
<script>
        $(function() {
            $(".popeasy").popeasy({trigger: ".popeasy", olay: ".overlay", modals: ".modal", loadExternal: !1, animationEffect: "fadeIn", animationSpeed: 400, moveModalSpeed: "slow", background: "fffceb", maskOpacity: .8, modalOpacity: 1, openOnLoad: !1, docClose: !0, closeByEscape: !0, moveOnScroll: !0, resizeWindow: !0, videoClass: "video", close: ".closeBtn"})
        })
</script>
<script>
	var app = angular.module('order', []);
	app.controller('orderContrl', function($scope,$http) {
		$scope.selectPage = 0;
		$scope.updateOrderId = "";
		$scope.updateOrderState = "";
		$scope.queryOrders = function(page){
			$scope.selectPage = page;
			page = page*5;
			if($scope.searchOrderType == "purchase"){
				$http.post('queryorders.do',{
					state:$scope.searchState,
					page:page,
				}).success(function (res){
				 	$scope.orderList = res.orderList;
					$scope.pageList = res.pageList;
	
				}).error(function(){
					//window.location.href = "wrong.jsp";
				});	
			} else if($scope.searchOrderType == "sales") {
				$http.post('querysales.do',{
					state:$scope.searchState,
					page:page,
				}).success(function (res){
				 	$scope.orderList = res.salesList;
					$scope.pageList = res.pageList;
	
				}).error(function(){
					//window.location.href = "wrong.jsp";
				});	
			};
		};
		$scope.previousQuery = function(){
			$scope.queryOrders($scope.selectPage-1);
		};
		$scope.nextQuery = function(){
			$scope.queryOrders($scope.selectPage+1);
		};
		$scope.verifyConfirm = function(oid,eid,state){
			 $scope.updateOrderId = oid;
			 $scope.updateOrderState = state;
			 if(!$scope.updateOrderId){
				 $scope.updateOrderId = eid;
				 $scope.updateOrderState = "已出库";
			 }
			 $('#my-confirm').modal({
			        relatedTarget: this,
			        onConfirm: function(options) {
						if($scope.searchOrderType == "purchase"){
							$http.post('updateorderstate.do',{
								id: $scope.updateOrderId,
								state: $scope.updateOrderState
							}).success(function (res){
								if (res == 1){
									layer.msg('订单审核成功');
									$scope.queryOrders(0);						
								} 
								else
									layer.msg('订单审核失败');
							}).error(function(){
								layer.msg('订单审核失败');
							});	
							}; 
							if($scope.searchOrderType == "sales") {
								$http.post('updatesalestate.do',{
									id: $scope.updateOrderId,
									state: $scope.updateOrderState 
								}).success(function (res){
									if (res == 1){
										layer.msg('订单审核成功');
										$scope.queryOrders(0);						
									} else if (res == -1)
										layer.msg('仓库存储不足');
									 else
										layer.msg('订单审核失败');
								}).error(function(){
										layer.msg('订单审核失败');
								});	
							};
			        },
			        onCancel: function() {
			          return false;
			        }
		      });
		};
	});
</script>
</body>

</html>