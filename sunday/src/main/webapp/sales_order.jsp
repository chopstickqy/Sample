<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" ng-app="sales">
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
<body data-type="index" class="theme-white" ng-controller="salesContrl" ng-init="querySales(0);initDropbox()" ng-cloak>
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
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">客户名称</label>
                        <div class="am-u-sm-8">
                            <input type="text" ng-model="searchCustomer" class="am-form-field query-input" placeholder="请输入客户名称">
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3 am-u-end">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">订单状态</label>
                        <div class="am-u-sm-8">
                            <div class="am-form-group tpl-table-list-select">
                                <select class="query-input" ng-model="searchState" >
                                    <option value="">请选择订单状态</option>
                                    <option value="待确认">待确认</option>
                                    <option value="待审核">待审核</option>
                                    <option value="已出库">已出库</option>
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
                                <button type="button" class="am-btn am-btn-default am-btn-secondary query-button" ng-click="querySales(0)"><span class="am-icon-search"></span> 查询</button>
                                <button type="button" class="am-btn am-btn-default am-btn-success query-button" ng-click="openModal('insert','')"><span class="am-icon-plus"></span> 新增</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table class="am-table am-table-striped am-table-hover">
                <thead>
                    <tr>
                        <th width="7%" class="am-text-center">序号</th>
                        <th width="15%" class="am-text-center">商品名称</th>
                        <th width="12%" class="am-text-center">客户名称</th>
                        <th width="8%" class="am-text-center">订单号</th>
                        <th width="5%" class="am-text-center">数量</th>
                        <th width="5%" class="am-text-center">单价</th>
                        <th width="8" class="am-text-center">利润</th>
                        <th width="10%" class="am-text-center">订单状态</th>
                        <th width="15%" class="am-text-center">出库时间</th>
                        <th width="15%" class="am-text-center">操作</th>
                    </tr>
                </thead>
                <tbody>
                     <tr ng-repeat="sales in salesList">
                        <td class="am-text-center">{{$index+1}}</td>
                        <td class="am-text-center">{{sales.eCommodity}}</td>
                        <td class="am-text-center">{{sales.eCustomer}}</td>
                        <td class="am-text-center">{{sales.eId}}</td>
                        <td class="am-text-center">{{sales.eNumber}}</td>
                        <td class="am-text-center">{{sales.ePrice|currency:'￥'}}</td>
                        <td class="am-text-center">{{sales.eProfit|currency:'￥'}}</td>
                        <td class="am-text-center">{{sales.eState}}</td>
                        <td class="am-text-center">{{sales.eTime|date:"yyyy-MM-dd HH:mm:ss"}}</td>
                        <td>
                            <div class="tpl-table-black-operation">
                                <a href="javascript:;" ng-click="openModal('update',sales)">
                                    <i class="am-icon-pencil"></i> 详细
                                </a>
                                <a ng-if="sales.eState=='待确认'" href="javascript:;" ng-click="salesSubmit(sales.eId,'已出库')">
                                    <i class="am-icon-pencil"></i> 确认售出
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr ng-if="salesList.length==0">
						<td colspan="9" align="center">无数据</td>
					</tr>
                </tbody>
            </table>
           <ul class="am-pagination am-pagination-right">
               <li ng-if="pageList && pageList.length>0" ng-class="{true:'am-disabled'}[selectPage==0]"><a href="javascript:void(0)" ng-click="previousQuery()">&laquo;</a></li>
               <li ng-repeat="page in pageList" ng-class="{true:'am-active'}[selectPage==$index]" ng-class="{true:'am-disabled'}[selectPage==$index]"><a href="javascript:void(0)" ng-click="querySales($index)">{{$index+1}}</a></li>
               <li ng-if="pageList && pageList.length>0" ng-class="{true:'am-disabled'}[selectPage==pageList.length-1]"><a href="javascript:void(0)" ng-click="nextQuery()">&raquo;</a></li>
           </ul>
        </div>
    </div>
</div>  
<div class="am-modal am-modal-no-btn" tabindex="-1" id="your-modal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">销售单
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd">
      <form class="am-form am-form-horizontal pop-form" ng-submit="submitForm()" novalidate>
               <div class="am-form-group">
                  <label for="pname" class="am-u-sm-2 am-form-label">商品</label>
                  <div class="am-u-sm-9 am-u-end">
                        <select ng-disabled="salesOrder.eState=='已出库' || salesOrder.eState=='退货中' || salesOrder.eState=='已退货'" ng-model="salesOrder.eCommodityid" ng-change="selectStockInfo(salesOrder.eCommodityid)">
                            <option value="">请选择商品</option>
                            <option ng-repeat="stock in stockList" ng-value="stock.tNumber">{{stock.tName}}</option>
                        </select>
                  </div>
                </div>
                <div class="am-form-group" ng-if="selectStock !==''")>
                  <label for="pname" class="am-u-sm-2 am-form-label"></label>
                  <div class="am-u-sm-9 am-u-end">
                       <table style="text-align:left !important">
                       		<tr>
                       			<td colspan="2">商品名称:{{selectStock.tName}}</td>
                       		</tr>
                      		<tr>
                       			<td colspan="2">商品编号:{{selectStock.tNumber}}</td>
                       		</tr>
                       		<tr>
                       			<td width="60%">库存：{{selectStock.tQuantity}}</td>
                       			<td >状态：{{selectStock.tState}}</td>
                       		</tr>
                       		<tr>
                       			<td colspan="2">售价:{{selectCommodity.mOutPrice|currency:'￥'}}</td>
                       		</tr>
                       </table>
                  </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">客户</label>
                    <div class="am-u-sm-9 am-u-end">
                            <select ng-disabled="salesOrder.eState=='已出库' || salesOrder.eState=='退货中' || salesOrder.eState=='已退货'"  ng-model="salesOrder.eCustomer" ng-change="selectCustomerInfo(salesOrder.eCustomer)">
                                <option value="">请选择客户</option>
                               <option ng-repeat="cutomer in customerList" ng-value="cutomer.cName">{{cutomer.cName}}</option>
                            </select>
                      </div>
                </div>
                 <div class="am-form-group" ng-if="selectCustomer !==''")>
                  <label for="pname" class="am-u-sm-2 am-form-label"></label>
                  <div class="am-u-sm-9 am-u-end">
                       <table style="text-align:left !important">
                       		<tr>
                       			<td colspan="2" >客户名称:{{selectCustomer.cName}}</td>
                       		</tr>
                       		<tr>
                       			<td width="50%">联系人：{{selectCustomer.cContact}}</td>
                       			<td >联系电话：{{selectCustomer.cPhone}}</td>
                       		</tr>
                       		<tr>
                       			<td colspan="2">地址：{{selectCustomer.cAddress}}</td>
                       		</tr>
                       </table>
                  </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">数量</label>
                    <div class="am-u-sm-9 am-u-end">
                        <input ng-disabled="salesOrder.eState=='已出库' || salesOrder.eState=='退货中' || salesOrder.eState=='已退货'" type="text" ng-model="salesOrder.eNumber" placeholder="请输入销售数量">
                    </div>
                </div>            
                 <div class="am-form-group" ng-if="salesOrder.eState=='已出库' || salesOrder.eState=='退货中' || salesOrder.eState=='已退货'">
                    <label for="pname" class="am-u-sm-2 am-form-label">销售人</label>
                    <div class="am-u-sm-9 am-u-end">
                        <input ng-disabled="salesOrder.eState=='已出库' || salesOrder.eState=='退货中' || salesOrder.eState=='已退货'" type="text" ng-model="salesOrder.eUser" placeholder="">
                    </div>
                </div>
                <div class="am-form-group">
                  <div class="am-u-sm-12">
                    <button ng-if="salesOrder.eState!='已入库' && salesOrder.eState!='退货中' && salesOrder.eState!='已退货'" type="submit" class="am-btn am-btn-default am-center">提交登入</button>
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
	var app = angular.module('sales', []);
	app.controller('salesContrl', function($scope,$http) {
		$scope.selectPage = 0;
		$scope.stockList;
		$scope.customerList;
		$scope.selectStock = "";
		$scope.selectCustomer = "";
		$scope.selectCommodity = "";
		$scope.modal = $('#your-modal');
		$scope.submitType ;
		$scope.salesOrder ;
		
		$scope.initDropbox = function(){
			$http.post('queryallcustomers.do',{
			}).success(function (res){
			 	$scope.customerList = res.customerList;
			}).error(function(){
				//window.location.href = "wrong.jsp";
			});
			$http.post('queryallstocks.do',{
			}).success(function (res){
			 	$scope.stockList = res.stockList;
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
		
		$scope.selectStockInfo = function(number){
			if(number == ""){
				$scope.selectStock = "";
				$scope.selectCommodity ="";
				return;
			}
			for(index in $scope.commodityList){
				if($scope.commodityList[index].mId == number){
					$scope.selectCommodity = $scope.commodityList[index];
				}
			}
			for(index in $scope.stockList){
				if($scope.stockList[index].tNumber == number){
					$scope.selectStock = $scope.stockList[index];
				}
			}
		};
		
		$scope.selectCustomerInfo = function(name){
			if(name == ""){
				$scope.selectCustomer = "";
				return;
			}
			for(index in $scope.customerList){
				if($scope.customerList[index].cName == name){
					$scope.selectCustomer = $scope.customerList[index];
				}
			}
		};
		$scope.querySales = function(page){
			$scope.selectPage = page;
			page = page*5;
			$http.post('querysales.do',{
					commodity:$scope.searchCommodity,
					customer:$scope.searchCustomer,
					state:$scope.searchState,
					id:$scope.searchId,
					minTime:$("#minTime").val(),
					maxTime:$("#maxTime").val(),
					page:page,
			}).success(function (res){
			 	$scope.salesList = res.salesList;
				$scope.pageList = res.pageList;

			}).error(function(){
				//window.location.href = "wrong.jsp";
			});	
		};
		$scope.previousQuery = function(){
			$scope.querySales($scope.selectPage-1);
		};
		$scope.nextQuery = function(){
			$scope.querySales($scope.selectPage+1);
		};
		$scope.submitForm = function(){
			if($scope.selectStock == "" || $scope.selectStock == null){
				layer.msg('请选择商品');
				return ;
			}
			if( $scope.selectCustomer == "" ||  $scope.selectCustomer == null){
				layer.msg('请选择客户');
				return ;
			}
			if($scope.salesOrder.eNumber == "" || $scope.salesOrder.eNumber == null){
				layer.msg('请输入数量');
				return ;
			}
			if($scope.selectStock.tQuantity < $scope.salesOrder.eNumber ){
				layer.msg('库存不足');
				return;
			}
			if($scope.submitType=='insert'){
				layer.confirm('你，确定要添加销售单吗？', {
					  btn: ['确定','取消'] //按钮
				}, function(){
					$http.post('insertsales.do',{
						commodityid : $scope.selectStock.tNumber,
						commodity : $scope.selectStock.tName,
						customer : $scope.selectCustomer.cName,
						price : $scope.selectCommodity.mOutPrice,
						number : $scope.salesOrder.eNumber
					}).success(function(res){
						if (res == 1){
							$scope.modal.modal('close');
							layer.msg('添加成功');
							$scope.querySales(0);						
						} 
						else
							layer.msg('添加失败');
	
					}).error(function(){
						layer.msg('添加失败');
					});
		        },function(){
		        })
		    } else if($scope.submitType=='update'){
				layer.confirm('你，确定要更新销售单吗？', {
					  btn: ['确定','取消'] //按钮
				}, function(){
					$http.post('insertsales.do',{
						id:$scope.salesOrder.eId,
						commodityid : $scope.selectStock.tNumber,
						commodity : $scope.selectStock.tName,
						customer : $scope.selectCustomer.cName,
						price : $scope.salesOrder.ePrice,
						number : $scope.salesOrder.eNumber
					}).success(function(res){
						if (res == 1){
							$scope.modal.modal('close');
							layer.msg('更新成功');
							$scope.querySales(0);						
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
		 $scope.openModal = function(type,salesOrder){
			 	if(type=='update'){
			 		$scope.selectStockInfo(salesOrder.eCommodityid);
			 		$scope.selectCustomerInfo(salesOrder.eCustomer);
			 	}
			 	if(type=='insert'){
			 		$scope.selectStock = '';
			 		$scope.selectCustomer = '';
			 	}
			  	var newOrder = JSON.parse(JSON.stringify(salesOrder));  
				$scope.submitType = type;
				$scope.salesOrder = newOrder;
				$scope.modal.modal();
		  }
		$scope.salesSubmit = function(id,state){
			layer.confirm('你，确定要改变采购单状态吗？', {
				  btn: ['确定','取消'] //按钮
			}, function(){
	        	$http.post('updatesaleorderstate.do',{
					id : id,
					state : state
				}).success(function(res){
					if (res == 1){
						layer.msg('状态更新成功');
						$scope.querySales(0);						
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