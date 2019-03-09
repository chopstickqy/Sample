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
<body data-type="index" class="theme-white" ng-controller="orderContrl" ng-init="queryOrders(0);initDropbox()" ng-cloak>
<div class="row-content am-cf">
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
        <div class="widget am-cf">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">商品名称</label>
                        <div class="am-u-sm-8">
                            <input type="text" ng-model="searchCommodity" class="am-form-field query-input" placeholder="请输入商品名称">
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">供应商</label>
                        <div class="am-u-sm-8">
                            <input type="text" ng-model="searchSupplier" class="am-form-field query-input" placeholder="请输入供应商名称">
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3 am-u-end">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">订单状态</label>
                        <div class="am-u-sm-8">
                            <div class="am-form-group tpl-table-list-select">
                                <select class="query-input" ng-model="searchState">
                                    <option value="">请选择订单状态</option>
                                    <option value="待确认">待确认</option>
                                    <option value="待审核">待审核</option>
                                    <option value="已入库">已入库</option>
                                    <option value="退货中">退货中</option>
                                    <option value="已退货">已退货</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">订单号</label>
                        <div class="am-u-sm-8">
                            <input type="text" ng-model="searchId" class="am-form-field query-input" placeholder="请输入订单号">
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
                    <div class="am-form-group">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button type="button" class="am-btn am-btn-default am-btn-secondary query-button" ng-click="queryOrders(0)"><span class="am-icon-search"></span> 查询</button>
                                <button type="button" class="am-btn am-btn-default am-btn-success query-button" ng-click="openModal('insert','')"><span class="am-icon-plus"></span> 新增</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table class="am-table am-table-striped am-table-hover">
                <thead>
                    <tr>
                        <th width="5%" class="am-text-center">序号</th>
                        <th width="20%" class="am-text-center">商品名称</th>
                        <th width="10%" class="am-text-center">供应商</th>
                        <th width="8%" class="am-text-center">订单号</th>
                        <th width="5%" class="am-text-center">数量</th>
                        <th width="5%" class="am-text-center">单价</th>
                        <th width="10%" class="am-text-center">订单状态</th>
                        <th width="15%" class="am-text-center">入库时间</th>
                        <th width="23%" class="am-text-center">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="order in orderList">
                        <td class="am-text-center">{{$index+1}}</td>
                        <td class="am-text-center">{{order.oCommodity}}</td>
                        <td class="am-text-center">{{order.oSupplier}}</td>
                        <td class="am-text-center">{{order.oId}}</td>
                        <td class="am-text-center">{{order.oNumber}}</td>
                        <td class="am-text-center">{{order.oPrice|currency:'￥'}}</td>
                        <td class="am-text-center">{{order.oState}}</td>
                        <td class="am-text-center">{{order.oTime|date:"yyyy-MM-dd HH:mm:ss"}}</td>
                        <td>
                            <div class="tpl-table-black-operation">
                                <a href="javascript:;" ng-click="openModal('update',order)">
                                    <i class="am-icon-pencil"></i> 详细
                                </a>
                                <a ng-if="order.oState=='待确认'" href="javascript:;" class="tpl-table-black-operation-del" ng-click="purchaseSubmit(order.oId,'退货中')">
                                    <i class="am-icon-trash"></i> 退货
                                </a>
                                  <a ng-if="order.oState=='待审核'" href="javascript:;" class="tpl-table-black-operation-del" ng-click="purchaseSubmit(order.oId,'退货中')">
                                    <i class="am-icon-trash"></i> 退货
                                </a>
                                <a ng-if="order.oState=='退货中'" href="javascript:;" class="tpl-table-black-operation-del" ng-click="purchaseSubmit(order.oId,'待审核')">
                                    <i class="am-icon-trash"></i> 取消退货
                                </a>
                                 <a ng-if="order.oState=='退货中'" href="javascript:;" class="tpl-table-black-operation-del" ng-click="purchaseSubmit(order.oId,'已退货')">
                                    <i class="am-icon-trash"></i> 确认
                                </a>
                                <a ng-if="order.oState=='待确认'" href="javascript:;" ng-click="purchaseSubmit(order.oId,'待审核')">
                                    <i class="am-icon-pencil"></i> 提交审核
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr ng-if="orderList.length==0">
						<td colspan="9" align="center">无数据</td>
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
<div class="am-modal am-modal-no-btn" tabindex="-1" id="your-modal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">采购单{{purchaseOrder.oCommodityid}}
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd">
      <form class="am-form am-form-horizontal pop-form" ng-submit="submitForm()" novalidate>
                <div class="am-form-group">
                  <label for="pname" class="am-u-sm-2 am-form-label">商品</label>
                  <div class="am-u-sm-9 am-u-end">
                        <select  ng-disabled="purchaseOrder.oState=='已入库' || purchaseOrder.oState=='退货中' || purchaseOrder.oState=='已退货'" ng-model="purchaseOrder.oCommodityid" ng-change="selectCommodityInfo(purchaseOrder.oCommodityid)">
                            <option value="">请选择商品</option>
                            <option ng-repeat="commodity in commodityList" ng-value="commodity.mId">{{commodity.mName}}</option>
                        </select>
                  </div>
                </div>
                <div class="am-form-group" ng-if="selectCommodity !==''")>
                  <label for="pname" class="am-u-sm-2 am-form-label"></label>
                  <div class="am-u-sm-9 am-u-end">
                       <table style="text-align:left !important">
                       		<tr>
                       			<td colspan="2" >商品名称:{{selectCommodity.mName}}</td>
                       		</tr>
                       		<tr>
                       			<td colspan="2" >商品编号：{{selectCommodity.mId}}</td>
                       		</tr>
                       		<tr>
                       			<td width="60%">类别：{{selectCommodity.mType}}</td>
                       			<td >颜色：{{selectCommodity.mColor}}</td>
                       		</tr>
                       		<tr>
                       			<td width="60%">材质：{{selectCommodity.mMaterial}}</td>
                       			<td >尺码：{{selectCommodity.mSize}}</td>
                       		</tr>
                       		<tr>
                       			<td colspan="2">进价：{{selectCommodity.mInPrice|currency:'￥'}}</td>
                       		</tr>
                       </table>
                  </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">供应商</label>
                    <div class="am-u-sm-9 am-u-end">
                            <select ng-disabled="purchaseOrder.oState=='已入库' || purchaseOrder.oState=='退货中' || purchaseOrder.oState=='已退货'" ng-model="purchaseOrder.oSupplier" ng-change="selectSupplierInfo(purchaseOrder.oSupplier)">
                                <option value="">请选择供应商</option>
                                <option ng-repeat="supplier in supplierList" ng-value="supplier.sName">{{supplier.sName}}</option>
                            </select>
                      </div>
                </div>
                <div class="am-form-group" ng-if="selectSupplier !==''")>
                  <label for="pname" class="am-u-sm-2 am-form-label"></label>
                  <div class="am-u-sm-9 am-u-end">
                       <table style="text-align:left !important">
                       		<tr>
                       			<td colspan="2" >供应商名称:{{selectSupplier.sName}}</td>
                       		</tr>
                       		<tr>
                       			<td width="50%">联系人：{{selectSupplier.sContact}}</td>
                       			<td >联系电话：{{selectSupplier.sPhone}}</td>
                       		</tr>
                       		<tr>
                       			<td colspan="2">地址：{{selectSupplier.sAddress}}</td>
                       		</tr>
                       </table>
                  </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">数量</label>
                    <div class="am-u-sm-9 am-u-end">
                        <input ng-disabled="purchaseOrder.oState=='已入库' || purchaseOrder.oState=='退货中' || purchaseOrder.oState=='已退货'" type="text" ng-model="purchaseOrder.oNumber" placeholder="请输入采购数量">
                    </div>
                </div>            
                <div class="am-form-group" ng-if="purchaseOrder.oState=='已入库' || purchaseOrder.oState=='退货中' || purchaseOrder.oState=='已退货'">
                    <label for="pname" class="am-u-sm-2 am-form-label">采购人</label>
                    <div class="am-u-sm-9 am-u-end">
                        <input ng-disabled="purchaseOrder.oState=='已入库' || purchaseOrder.oState=='退货中' || purchaseOrder.oState=='已退货'" type="text" ng-model="purchaseOrder.oUser" placeholder="">
                    </div>
                </div>
                <div class="am-form-group">
                  <div class="am-u-sm-12">
                    <button ng-if="purchaseOrder.oState!='已入库' && purchaseOrder.oState!='退货中' && purchaseOrder.oState!='已退货'" type="submit" class="am-btn am-btn-default am-center">提交登入</button>
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
	var app = angular.module('order', []);
	app.controller('orderContrl', function($scope,$http) {
		$scope.selectPage = 0;
		$scope.commodityList;
		$scope.supplierList;
		$scope.selectCommodity = "";
		$scope.selectSupplier = "";
		$scope.modal = $('#your-modal');
		$scope.submitType ;
		$scope.purchaseOrder ;
		
		$scope.initDropbox = function(){
			$http.post('queryallsuppliers.do',{
			}).success(function (res){
			 	$scope.supplierList = res.supplierList;
			}).error(function(){
				//window.location.href = "wrong.jsp";
			});
			$http.post('queryallcommoditys.do',{
			}).success(function (res){
			 	$scope.commodityList = res.commodityList;
			}).error(function(){
				//window.location.href = "wrong.jsp";
			});	
		};
		
		$scope.selectCommodityInfo = function(id){
			if(id == ""){
				$scope.selectCommodity = "";
				return;
			}
			for(index in $scope.commodityList){	
				if($scope.commodityList[index].mId == id){
					$scope.selectCommodity = $scope.commodityList[index];
				}
			}
		};
		
		$scope.selectSupplierInfo = function(name){
			if(name == ""){
				$scope.selectSupplier = "";
				return;
			}
			for(index in $scope.supplierList){
				if($scope.supplierList[index].sName == name){
					$scope.selectSupplier = $scope.supplierList[index];
				}
			}
		};
		
		$scope.queryOrders = function(page){
			$scope.selectPage = page;
			page = page*5;
			$http.post('queryorders.do',{
					commodity:$scope.searchCommodity,
					supplier:$scope.searchSupplier,
					state:$scope.searchState,
					id:$scope.searchId,
					minTime:$("#minTime").val(),
					maxTime:$("#maxTime").val(),
					page:page,
			}).success(function (res){
			 	$scope.orderList = res.orderList;
				$scope.pageList = res.pageList;

			}).error(function(){
				//window.location.href = "wrong.jsp";
			});	
		};
		$scope.previousQuery = function(){
			$scope.queryOrders($scope.selectPage-1);
		};
		$scope.nextQuery = function(){
			$scope.queryOrders($scope.selectPage+1);
		};
		$scope.submitForm = function(){
			if($scope.selectCommodity == "" || $scope.selectCommodity == null){
				layer.msg('请选择商品');
				return ;
			}
			if($scope.selectSupplier == "" || $scope.selectSupplier== null){
				layer.msg('请选择供应商');
				return ;
			}
			if($scope.purchaseOrder.oNumber == "" || $scope.purchaseOrder.oNumber == null){
				layer.msg('请输入数量');
				return ;
			}
			if($scope.submitType=='insert'){
				layer.confirm('你，确定要添加采购单吗？', {
					  btn: ['确定','取消'] //按钮
				}, function(){
					$http.post('insertorder.do',{
						commodityid : $scope.selectCommodity.mId,
						commodity : $scope.selectCommodity.mName,
						supplier : $scope.selectSupplier.sName,
						price : $scope.selectCommodity.mInPrice,
						number : $scope.purchaseOrder.oNumber
					}).success(function(res){
						if (res == 1){
							$scope.modal.modal('close');
							layer.msg('添加成功');
							$scope.queryOrders(0);						
						} 
						else
							layer.msg('添加失败');
					
					}).error(function(){
						layer.msg('添加失败');
					});
		        },function(){
		        })
			} else if($scope.submitType=='update'){
				layer.confirm('你，确定要更新采购单吗？', {
					  btn: ['确定','取消'] //按钮
				}, function(){
					$http.post('updateorder.do',{
						id:$scope.purchaseOrder.oId,
						commodity : $scope.selectCommodity.mName,
						supplier : $scope.selectSupplier.sName,
						number : $scope.purchaseOrder.oNumber,
						price : $scope.purchaseOrder.oPrice,
						commodityid : $scope.selectCommodity.mId,
					}).success(function(res){
						if (res == 1){
							$scope.modal.modal('close');
							layer.msg('更新成功');
							$scope.queryOrders(0);						
						} 
						else
							layer.msg('更新失败');
					
					}).error(function(){
						layer.msg('更新失败');
					});
		        },function(){
		        })
			}
		};
		 $scope.openModal = function(type,purchaseOrder){
			 	if(type=='update'){
			 		$scope.selectCommodityInfo(purchaseOrder.oCommodityid);
			 		$scope.selectSupplierInfo(purchaseOrder.oSupplier);
			 	}
			 	if(type=='insert'){
			 		$scope.selectCommodity = '';
			 		$scope.selectSupplier = '';
			 	}
			  	var newOrder = JSON.parse(JSON.stringify(purchaseOrder));  
				$scope.submitType = type;
				$scope.purchaseOrder = newOrder;
				$scope.modal.modal();
		  }
		$scope.purchaseSubmit = function(id,state){
			layer.confirm('你，确定要改变采购单状态吗？', {
				  btn: ['确定','取消'] //按钮
			}, function(){
				$http.post('updatepurchasestate.do',{
					id : id,
					state : state
				}).success(function(res){
					if (res == 1){
						layer.msg('状态更新成功');
						$scope.queryOrders(0);						
					} 
					else
						layer.msg('状态更新失败');
				
				}).error(function(){
					layer.msg('状态更新失败');
				});
	        },function(){
	        	
	        }
	      )};
	});
</script>
</body>

</html>