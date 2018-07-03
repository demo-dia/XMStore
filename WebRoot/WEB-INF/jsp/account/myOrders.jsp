<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单列表</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/old/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/old/blue.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/old/buylist.css" />
<link href="${pageContext.request.contextPath}/css/old/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/old/index.css"
	rel="stylesheet" type="text/css">

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
	$(function() {

		$("#loginAlertIs").click(function() {
			tipShow('#loginAlert');
		});

		$("#promptAlertIs").click(function() {
			tipShow('#promptAlert');
		});

		$("#transitAlertIs").click(function() {
			tipShow('#transitAlert');
		});

		$('.x_150x150').each(function(i, items_list) {
			$(items_list).find('li').hover(function() {
				$(items_list).find('li').each(function(j, li) {
					$(li).removeClass('here');
				});
				$(this).addClass('here');
			}, function() {
			});
		});

	});
</script>
</head>
<body>
	<jsp:include page="../head.jsp" />
	<b class="line" style="margin-top: -30px;display:block"></b>
	<div style="margin-top: 30px;margin-bottom:30px;" class="w mt ofc">



		<form method="post" action="" name="">


			<table cellspacing="0" summary="" class="tab tab4 tabfix"
				style="table-layout: fixed;">
				<thead>
					<tr>
						<th width="60px">订单编号</th>
						<th width="280px">商品名称</th>
						<th width="55px">收货人</th>
						<th style="text-align:center;width:70px;">总金额</th>
						<th style="text-align:center;width:110px;">下单时间</th>
						<th style="text-align:center;width:70px;">订单状态</th>
						<th width="65px">操作</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator var="o" value="#session.user.orders">
						<tr>
							<td>XMStore<s:property value="#o.oid" /></td>
							<td class="nwp pic"><s:iterator var="item"
									value="#o.orderItem">
									<ul class="uls">
										<li><s:a action="product_info" namespace="/product"
												cssClass="pic">
												<img
													src="${pageContext.request.contextPath}/<s:property value='#item.product.image' />"
													style="display: block;">
												<s:param name="pid" value="#item.product.pid"></s:param>
											</s:a>

											<dl>
												<dt>
													<s:a action="product_info" namespace="/product"
														cssClass="pic">
														<s:param name="pid" value="#item.product.pid"></s:param>
														<s:property value="#item.product.pname" />
													</s:a>
												</dt>
												<dd>无描述信息</dd>
											</dl></li>
									</ul>
								</s:iterator></td>
							<td><s:property value="#o.address.addressee" /></td>
							<td>￥<s:property value="#o.total" /></td>
							<td><s:property
									value=" #o.ordertime.toString().substring(0,19)" /></td>

							<s:if test="#o.state==1">
								<%--未支付 --%>
								<td><font color="red">待付款</font></td>
								<td class="blue"><s:a action="order" namespace=""
										title="去支付">
										<s:param name="oid" value="#o.oid"></s:param>
							去支付
						</s:a> <br>
								<br> <s:a action="order_cancelOrder" namespace="/order">取消订单
							<s:param name="oid" value="#o.oid"></s:param>
									</s:a></td>
							</s:if>
							<s:elseif test="#o.state==2">
								<%--已支付,待发货 --%>
								<td><font color="green">待发货</font></td>
								<td class="blue"><s:a action="account_orderDetails"
										namespace="/account" title="查看详情">
										<s:param name="oid" value="#o.oid"></s:param>
							查看详情
						</s:a></td>
							</s:elseif>
							<s:elseif test="#o.state==0">
								<%--取消订单 --%>
								<td><font>已取消</font></td>
								<td class="blue"></td>
							</s:elseif>

						</tr>
					</s:iterator>
				</tbody>
			</table>

		</form>

	</div>


	<jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>