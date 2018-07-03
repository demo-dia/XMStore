<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>商城</title>

<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/hmstyle.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>


</head>
<body>

	<jsp:include page="head.jsp" />
	<jsp:include page="menuSearch.jsp" />



	<div class="am-container ">
		<div class="shopTitle ">
			<h4>热卖商品</h4>
			<h3>你是我的优乐美么？不，我是你小鱼干呀</h3>
		</div>
	</div>
	<div class="am-g am-g-fixed flood method3 ">
		<ul class="am-thumbnails ">
			<s:iterator var="hot_product" value="#session.hot_product">
				<li>
					<div class="list" style="height: 266px; width: 190px;">
						<s:a action="product_info" namespace="/product">
							<img
								src="${pageContext.request.contextPath}/<s:property value='#hot_product.image' />"
								style="height: 188px; width: 188px;" />
							<div class="pro-title">
								<s:property value="pname" />
							</div>
							<s:param name="pid" value="#hot_product.pid"></s:param>
							<span class="e-price "><s:property value="shop_price" /></span>
						</s:a>
					</div>
				</li>
			</s:iterator>
		</ul>
	</div>


	<div class="am-container ">
		<div class="shopTitle ">
			<h4>最新商品</h4>
			<h3>你是我的小鱼干么？不，我是你的优乐美呀</h3>
		</div>
	</div>
	<div class="am-g am-g-fixed flood method3 ">
		<ul class="am-thumbnails ">
			<s:iterator var="new_product" value="#session.new_product">
				<li>
					<div class="list" style="height: 266px; width: 190px;">
						<s:a action="product_info" namespace="/product">
							<img
								src="${pageContext.request.contextPath}/<s:property value='#new_product.image' />"
								style="height: 188px; width: 188px;" />
							<div class="pro-title">
								<s:property value="pname" />
							</div>
							<s:param name="pid" value="#new_product.pid"></s:param>
							<span class="e-price "><s:property value="shop_price" /></span>
						</s:a>
					</div>
				</li>
			</s:iterator>
		</ul>
	</div>

	<jsp:include page="foot.jsp" />
</body>
</html>