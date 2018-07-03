<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%-- 
		个人信息订单详情页面
--%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/old/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/old/blue.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/old/buylist.css" />
<link href="${pageContext.request.contextPath }/css/old/common.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/old/index.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/com.js"></script>
	
	
	
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/basic/css/demo.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/hmstyle.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<link href="${pageContext.request.contextPath}/css/cartstyle.css"
	rel="stylesheet" type="text/css" />	

	
	

	
	
	<script type="text/javascript">
$(function(){

	$("#loginAlertIs").click(function(){
		tipShow('#loginAlert');
	});

	$("#promptAlertIs").click(function(){
		tipShow('#promptAlert');
	});

	$("#transitAlertIs").click(function(){
		tipShow('#transitAlert');
	});

	$('.x_150x150').each(function(i, items_list){ 
		$(items_list).find('li').hover(function(){
			$(items_list).find('li').each(function(j, li){
				$(li).removeClass('here');
			});
			$(this).addClass('here');
		},function(){});
	});
	
});
</script>
</head>
<body>
	<jsp:include page="../head.jsp" />
	<b class="line" style="margin-top: -30px;display:block"></b>
<div style="margin-top: 45px;margin-bottom:30px;" class="w mt ofc">
	

		
		<div class="confirm">
			<div class="tl"></div><div class="tr"></div>
			<div class="ofc">

				<h2 class="h2 h2_r2"><em title="订单详情">订单详情</em></h2>

				<div class="tool">
					<b class="l f14">订单状态：<span class="orange">
					<s:if test="orderDetails.state==2 ">等待卖家发货</s:if>
					<s:elseif test="orderDetails.state==2">卖家已发货</s:elseif>
					</span></b>
					<span class="r"><a href="javascript:alert('敬请期待');" title="打印订单" class="inb btn66x23 mr">打印订单</a>
					<s:a action="account_myOrders" namespace="/account" title="返回订单列表" cssClass="inb btn96x23">返回订单列表</s:a>
					</span>
				</div>

				<ul class="ul set">
				<li class="here"><span>1</span><br/><p><font size="2.5px">提交订单</p></li>
				<li class="here"><span>2</span><br/><p><font size="2.5px">已支付</p></li>
				<li><span>3</span><p>等待发货</p></li>
				<li class="after"><span>4</span><p>未确认收货</p></li>
				</ul>

				<h3 class="h3_r" title="基本信息">基本信息</h3>
				<ul class="ul form">
				<li class="first"><label>订单号：</label><span class="word">XMStore<s:property value="orderDetails.oid" /></span></li>
				<li><label>下单时间：</label><span class="word"><s:property value="orderDetails.ordertime.toString().substring(0,19)" /></span></li>
				<li><label>支付方式：</label><span class="word">在线支付</span></li>
				<li><label>支付金额：</label><span class="word">￥<s:property value="orderDetails.total" /></span></li>
				</ul>

				<hr />
				
				<h3 class="h3_r pb" title="商品信息">商品信息</h3>
				
				<table cellspacing="0" summary="" class="tab tab4 tabfix">
				<thead>
				<tr>
				<th width="12%">订单编号</th>
				<th>商品名称</th>
				<th width="10%">单价（元）</th>
				<th width="10%">数量</th>
				<th width="10%">小计（元）</th>
				</tr>
				</thead>
				<tbody>
					<s:iterator  var="item" value="orderDetails.orderItem">
					<tr>
						<td><a href="#" title="H7859454">XMStore<s:property value="orderDetails.oid" /></a></td>
						
						<td class="nwp pic">
							<ul class="uls">
								<li>
									<s:a action="product_info" namespace="/product" cssClass="pic">
										<img src="${pageContext.request.contextPath}/<s:property value="#item.product.image" />" />
										<s:param name="pid" value="#item.product.pid"></s:param>
									</s:a>
									<dl>
										<dt>
										<s:a  action="product_info" namespace="/product">
										<s:property value="#item.product.pname" />
										<s:param name="pid" value="#item.product.pid"></s:param>
										</s:a>
										</dt>
										<dd>无描述信息</dd>
									</dl>
								</li>
							</ul>
						</td>
						
						<td>￥<s:property value="#item.product.shop_price" /></td>
						<td><s:property value="#item.count" /></td>
						<td>￥<s:property value="#item.subtotal" /></td>
					</tr>
					</s:iterator>
					</tbody>
				</table>

				<hr class="mt" />

				<h3 class="h3_r" title="支付信息">支付信息</h3>
				<ul class="ul form">
				<li class="first"><label>支付号：</label><span class="word">linwene1234</span></li>
				<li><label>支付方式：</label><span class="word">在线支付</span></li>
				<li><label>支付金额：</label><span class="word">￥<s:property value="orderDetails.total" /></span></li>
				<li><label>支付状态：</label><span class="word">已支付</span></li>
				<li><label>支付时间：</label><span class="word"></span></li>
				</ul>

				<hr />

				<h3 class="h3_r" title="配送信息">配送信息</h3>
				<ul class="ul form">
				<li class="first"><label>收货人：</label><span class="word"><s:property value="orderDetails.address.addressee" /></span></li>
				<li><label>手机：</label><span class="word"><s:property value="orderDetails.address.phone" /></span></li>
				<li><label>固定电话：</label><span class="word">无</span></li>
				<li><label>送货地址：</label><span class="word">
					<s:property value="orderDetails.address.province.name" />&nbsp;
					<s:property value="orderDetails.address.city.name" />&nbsp;
					<s:property value="orderDetails.address.county.name" />&nbsp;
					<s:property value="orderDetails.address.street" />
				</span></li>
				<li><label>配送方式：</label><span class="word">快递</span></li>
				<li><label>邮政编码：</label><span class="word"><s:property value="orderDetails.address.postalcode" /></span></li>
				<li><label>配送时间：</label><span class="word">仅工作日配送</span></li>
				<li><label>配送备注：</label><span class="word">无</span></li>
				</ul>

				<hr />

				<h3 class="h3_r" title="发票信息">发票信息</h3>
				<ul class="ul form">
				<li class="first"><label>发票抬头：</label><span class="word">明细</span></li>
				<li><label>单位名称：</label><span class="word">中山大学南方学院</span></li>
				<li><label>发票内容：</label><span class="word">普通商品</span></li>
				</ul>

				<hr />

				<div class="page">
					<span class="r">
						<dl class="total bg_gray">
							<!-- <dt>购物车金额小计：</dt> -->
							<dd><em class="l">合计：</em>￥<s:property value="orderDetails.total" /></dd>
							<dd><em class="l">运费：</em>￥0</dd>
							<dd class="orange"><em class="l">总金额：</em>￥<s:property value="orderDetails.total" /></dd>
						</dl>
					</span>
				</div>

				<hr class="mt" />

				<div class="tool">
					<span class="r">
					<a href="javascript:alert('敬请期待');" title="打印订单" class="inb btn66x23 mr">打印订单</a>
					<s:a action="account_myOrders" namespace="/account" title="返回订单列表" cssClass="inb btn96x23">返回订单列表</s:a>
					</span>
				</div>
			
			</div>
			<div class="fl"></div><div class="fr"></div>
		</div>

	</div>



<jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>