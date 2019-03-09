<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" ng-app="commodity">
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
<body data-type="index" class="theme-white" ng-controller="commodityContrl" ng-init="queryCommoditys(0)" ng-cloak>
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
                            <input type="text" ng-model="searchId" class="am-form-field query-input" placeholder="请输入商品编号">
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3 am-u-end">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">类别</label>
                        <div class="am-u-sm-8">
                            <div class="am-form-group tpl-table-list-select">
                                <select class="query-input" ng-model="searchType" >
                                    <option value="">请选择类别</option>
                                     <option ng-repeat="type in typeList" ng-value="type.commodityType">{{type.commodityType}}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">颜色</label>
                         <div class="am-u-sm-8">
                            <input type="text" ng-model="searchColor" class="am-form-field query-input" placeholder="请输入颜色">
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">材质</label>
                          <div class="am-u-sm-8">
                            <input type="text" ng-model="searchMaterial" class="am-form-field query-input" placeholder="请输入材质">
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group am-form-group-sm tpl-form-border-form cl-p">
                        <label for="name" class="am-u-sm-4 am-form-label am-text-middle query-label">尺码</label>
                        <div class="am-u-sm-8">
                            <div class="am-form-group tpl-table-list-select">
                                <select class="query-input" ng-model="searchSize" >
                                    <option value="">请选择尺码</option>
                                    <option value="XS" ng-if="searchType!=='鞋子'">XS</option>
                                    <option value="S" ng-if="searchType!=='鞋子'">S</option>
                                    <option value="M" ng-if="searchType!=='鞋子'">M</option>
                                    <option value="L" ng-if="searchType!=='鞋子' ">L</option>
                                    <option value="XL" ng-if="searchType!=='鞋子'">XL</option>
                                    <option value="XXL" ng-if="searchType!=='鞋子'">XXL</option>
                                    <option value="36" ng-if="searchType=='鞋子'">36</option>
                                    <option value="37" ng-if="searchType=='鞋子'">37</option>
                                    <option value="38" ng-if="searchType=='鞋子'">38</option>
                                    <option value="39" ng-if="searchType=='鞋子'">39</option>  
                                    <option value="40" ng-if="searchType=='鞋子'">40</option>  
                                    <option value="41" ng-if="searchType=='鞋子'">41</option>  
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3 am-u-lg-3">
                    <div class="am-form-group">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button type="button" class="am-btn am-btn-default am-btn-secondary query-button" ng-click="queryCommoditys(0)"><span class="am-icon-search"></span> 查询</button>
                                <button type="button" class="am-btn am-btn-default am-btn-success query-button " ng-click="openModal('insert','')"><span class="am-icon-plus"></span> 新增</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table class="am-table am-table-striped am-table-hover">
                <thead>
                    <tr>
                        <th width="6%" class="am-text-center">序号</th>
                        <th width="20%" class="am-text-center">商品名称</th>
                        <th width="10%" class="am-text-center">商品编号</th>
                        <th width="8%" class="am-text-center">类别</th>
                        <th width="8%" class="am-text-center">颜色</th>
                        <th width="10%" class="am-text-center">材质</th>
                        <th width="8%" class="am-text-center">尺码</th>
                        <th width="8%" class="am-text-center">进价</th>
                        <th width="8%" class="am-text-center">售价</th>
                        <th width="15%" class="am-text-center">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="commodity in commodityList">
                        <td class="am-text-center">{{$index+1}}</td>
                        <td class="am-text-center">{{commodity.mName}}</td>
                        <td class="am-text-center">{{commodity.mId}}</td>
                        <td class="am-text-center">{{commodity.mType}}</td>
                        <td class="am-text-center">{{commodity.mColor}}</td>
                        <td class="am-text-center">{{commodity.mMaterial}}</td>
                        <td class="am-text-center">{{commodity.mSize}}</td>
                        <td class="am-text-center">{{commodity.mInPrice|currency:'￥'}}</td>
                        <td class="am-text-center">{{commodity.mOutPrice|currency:'￥'}}</td>
                        <td>
                            <div class="tpl-table-black-operation">
                                <a href="javascript:;" ng-click="openModal('update',commodity)">
                                    <i class="am-icon-pencil"></i> 编辑
                                </a>
                                <a href="javascript:;" class="tpl-table-black-operation-del" ng-click="deleteCommodity(commodity.mId)">
                                    <i class="am-icon-trash"></i> 删除
                                </a>
                            </div>
                        </td>
                    </tr>
                   	<tr ng-if="commodityList.length==0">
						<td colspan="10" align="center">无数据</td>
					</tr>
                </tbody>
            </table>
            <ul class="am-pagination am-pagination-right">
                <li ng-if="pageList && pageList.length>0" ng-class="{true:'am-disabled'}[selectPage==0]"><a href="javascript:void(0)" ng-click="previousQuery()">&laquo;</a></li>
                <li ng-repeat="page in pageList" ng-class="{true:'am-active'}[selectPage==$index]" ng-class="{true:'am-disabled'}[selectPage==$index]"><a href="javascript:void(0)" ng-click="queryCommoditys($index)">{{$index+1}}</a></li>
                <li ng-if="pageList && pageList.length>0" ng-class="{true:'am-disabled'}[selectPage==pageList.length-1]"><a href="javascript:void(0)" ng-click="nextQuery()">&raquo;</a></li>
            </ul>
        </div>
    </div>
</div>    
<div class="am-modal am-modal-no-btn" tabindex="-1" id="your-modal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">商品
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd">
      <form class="am-form am-form-horizontal pop-form" ng-submit="submitForm()" novalidate>
                <div class="am-form-group">
                  <label for="pname" class="am-u-sm-2 am-form-label">商品名称</label>
                  <div class="am-u-sm-9 am-u-end">
                    <input type="text" ng-model="commodity.mName" placeholder="请输入商品名称">
                  </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">商品编号</label>
                    <div class="am-u-sm-9 am-u-end">
                      <input ng-disabled="submitType=='update'" type="text" ng-model="commodity.mId" placeholder="请输入商品编号" >
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">类别</label>
                    <div class="am-u-sm-9 am-u-end">
                        <select ng-model="commodity.mType" ng-disabled="submitType=='update'" >
                            <option value="">请选择商品类别</option>
                            <option ng-repeat="type in typeList" ng-value="type.commodityType">{{type.commodityType}}</option>
                        </select>
                    </div>
                </div>            
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">颜色</label>
                    <div class="am-u-sm-9 am-u-end">
                        <input type="text" ng-model="commodity.mColor" placeholder="请输入商品颜色">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">材质</label>
                    <div class="am-u-sm-9 am-u-end">
                       <input type="text" ng-model="commodity.mMaterial" placeholder="请输入商品材质">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">尺码</label>
                    <div class="am-u-sm-9 am-u-end" ng-if="commodity.mType!='鞋子'">
                        <label class="am-radio-inline">
                            <input type="radio" name="docInlineRadio" value="XS" ng-model="commodity.mSize"> XS
                        </label>
                        <label class="am-radio-inline">
                            <input type="radio" name="docInlineRadio" value="S" ng-model="commodity.mSize"> S
                        </label>
                        <label class="am-radio-inline">
                            <input type="radio" name="docInlineRadio" value="M" ng-model="commodity.mSize"> M
                        </label>
                        <label class="am-radio-inline">
                            <input type="radio" name="docInlineRadio" value="L" ng-model="commodity.mSize"> L
                        </label>
                        <label class="am-radio-inline">
                            <input type="radio" name="docInlineRadio" value="XL" ng-model="commodity.mSize"> XL
                        </label>
                        <label class="am-radio-inline">
                            <input type="radio" name="docInlineRadio" value="XXL" ng-model="commodity.mSize"> XXL
                        </label>
                    </div>
                    <div class="am-u-sm-9 am-u-end" ng-if="commodity.mType=='鞋子'">
                        <label class="am-radio-inline">
                            <input type="radio" name="docInlineRadio" value="36" ng-model="commodity.mSize"> 36
                        </label>
                        <label class="am-radio-inline">
                            <input type="radio" name="docInlineRadio" value="37" ng-model="commodity.mSize"> 37
                        </label>
                        <label class="am-radio-inline">
                            <input type="radio" name="docInlineRadio" value="38" ng-model="commodity.mSize"> 38
                        </label>
                        <label class="am-radio-inline">
                            <input type="radio" name="docInlineRadio" value="39" ng-model="commodity.mSize"> 39
                        </label>
                        <label class="am-radio-inline">
                            <input type="radio" name="docInlineRadio" value="40" ng-model="commodity.mSize"> 40
                        </label>
                        <label class="am-radio-inline">
                            <input type="radio" name="docInlineRadio" value="41" ng-model="commodity.mSize"> 41
                        </label>
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">进价</label>
                    <div class="am-u-sm-9 am-u-end">
                      <input type="text" ng-model="commodity.mInPrice" placeholder="请输入进价">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="pname" class="am-u-sm-2 am-form-label">售价</label>
                    <div class="am-u-sm-9 am-u-end">
                      <input type="text" ng-model="commodity.mOutPrice" placeholder="请输入售价">
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
	var app = angular.module('commodity', []);
	app.controller('commodityContrl', function($scope,$http) {
		$scope.selectPage = 0;
		$scope.deleteCommodityId = "";
		$scope.modal = $('#your-modal');
		$scope.commodity;
		$scope.submitType;
		
		$http.post('typeList.do',{
		}).success(function (res){
		 	$scope.typeList = res.typeList;
		}).error(function(){
		});	
		$scope.queryCommoditys = function(page){
			$scope.selectPage = page;
			page = page*5;
			$http.post('querycommoditys.do',{
					id:$scope.searchId,
					name:$scope.searchName,
					type:$scope.searchType,
					color:$scope.searchColor,
					material:$scope.searchMaterial,
					size:$scope.searchSize,
					page:page,
			}).success(function (res){
			 	$scope.commodityList = res.commodityList;
				$scope.pageList = res.pageList;		
			}).error(function(){
				//window.location.href = "wrong.jsp";
			});	
		};
		$scope.previousQuery = function(){
			$scope.queryCommoditys($scope.selectPage-1);
		};
		$scope.nextQuery = function(){
			$scope.queryCommoditys($scope.selectPage+1);
		};
		$scope.submitForm = function(){
			if($scope.commodity.mId == "" || $scope.commodity.mId == null){
				layer.msg('请输入编号');
				return ;
			}
			if($scope.commodity.mName == "" || $scope.commodity.mName == null){
				layer.msg('请输入名称');
				return ;
			}
			if($scope.commodity.mType == "" || $scope.commodity.mType == null){
				layer.msg('请选择类别');
				return ;
			}
			if($scope.commodity.mColor == "" || $scope.commodity.mColor == null){
				layer.msg('请输入颜色');
				return ;
			}
			if($scope.commodity.mMaterial == "" || $scope.commodity.mMaterial == null){
				layer.msg('请输入材质');
				return ;
			}
			if($scope.commodity.mSize == "" || $scope.commodity.mSize == null){
				layer.msg('请选择尺码');
				return ;
			}
			if($scope.submitType=='insert'){
				layer.confirm('你，确定要添加商品吗？', {
					  btn: ['确定','取消'] //按钮
				}, function(){
					$http.post('insertcommodity.do',{
						id : $scope.commodity.mId,
						name : $scope.commodity.mName,
						type : $scope.commodity.mType,
						color : $scope.commodity.mColor,
						material : $scope.commodity.mMaterial,
						size : $scope.commodity.mSize,
						inprice : $scope.commodity.mInPrice,
						outprice : $scope.commodity.mOutPrice
					}).success(function(res){
						if (res == 1){
							$scope.modal.modal('close');
							layer.msg('添加成功');
							$scope.queryCommoditys(0);						
						} 
						else
							layer.msg('添加失败');
					
					}).error(function(){
						layer.msg('添加失败');
					});
				}, function(){
				});
			} else if($scope.submitType=='update'){
				layer.confirm('你，确定要更新商品信息吗？', {
					  btn: ['确定','取消'] //按钮
				}, function(){
					$http.post('updatecommodity.do',{
						id : $scope.commodity.mId,
						name : $scope.commodity.mName,
						type : $scope.commodity.mType,
						color : $scope.commodity.mColor,
						material : $scope.commodity.mMaterial,
						size : $scope.commodity.mSize,
						inprice : $scope.commodity.mInPrice,
						outprice : $scope.commodity.mOutPrice
					}).success(function(res){
						if (res == 1){
							$scope.modal.modal('close');
							layer.msg('更新成功');
							$scope.queryCommoditys(0);						
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
		$scope.deleteCommodity = function(id){
			layer.confirm('你，确定要删除商品吗？', {
				  btn: ['确定','取消'] //按钮
			}, function(){
				$http.post('detelecommodity.do',{
					id : id,
				}).success(function(res){
					if (res == 1){
						layer.msg('删除成功');
						$scope.queryCommoditys(0);						
					} 
					else
						layer.msg('删除失败');
				
				}).error(function(){
					layer.msg('删除失败');
				});
			},function(){
			});
		};
		$scope.openModal = function(type,commodity){
			var newCommodity = JSON.parse(JSON.stringify(commodity));  
			$scope.submitType = type;
			$scope.commodity = newCommodity;
			$scope.modal.modal();
		}
	});
</script>
</body>

</html>