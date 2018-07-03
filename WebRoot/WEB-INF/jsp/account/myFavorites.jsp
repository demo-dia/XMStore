<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的收藏</title>
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

</head>
<body>

	<jsp:include page="../head.jsp" />




	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
					</div>
					<div class="th th-item">
						<div class="td-inner">收藏商品信息</div>
					</div>
					<div class="th th-price">
						<div class="td-inner">&nbsp;</div>
					</div>
					<div class="th th-amount">
						<div class="td-inner">编号</div>
					</div>
					<div class="th th-sum">
						<div class="td-inner">现价</div>
					</div>
					<div class="th th-op">
						<div class="td-inner">操作</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<s:iterator var="f" value="#session.user.favorites">
				<tr class="item-list">
					<div class="bundle  bundle-last ">

						<div class="bundle-main">
							<ul class="item-content clearfix">
								<li class="td td-item">
									<div class="item-pic">



										<s:a action="product_info" namespace="/product"
											cssClass="J_MakePoint">
											<img
												src="${pageContext.request.contextPath}/<s:property value='#f.image' />"
												class="itempic J_ItemImg" style="width: 80px; height: 80px;">
											<s:param name="pid" value="#f.pid"></s:param>
										</s:a>



									</div>
									<div class="item-info">
										<div class="item-basic-info">
											<s:a action="product_info" namespace="/product"
												cssClass="item-title J_MakePoint">
												<s:param name="pid" value="#f.pid"></s:param>
												<s:property value="#f.pname" />
											</s:a>

										</div>
									</div>
								</li>
								<li class="td td-info">
									<div class="item-props">
										<span class="sku-line">无描述信息</span>
									</div>
								</li>
								<li class="td td-price">
									<div class="item-price price-promo-promo">
										<div class="price-content"></div>
									</div>
								</li>
								<li class="td td-amount">
									<div class="amount-wrapper ">
										<div class="item-amount ">
											<div class="sl">
												<em tabindex="0" class="J_ItemSum number"><s:property
														value="#f.pid" /></em>
											</div>
										</div>
									</div>
								</li>
								<li class="td td-sum">
									<div class="td-inner">
										<em tabindex="0" class="J_ItemSum number">￥<s:property
												value="#f.shop_price" /></em>
									</div>
								</li>
								<li class="td td-op">
									<div class="td-inner">
										<s:a action="product_addCart" namespace="/product" title="购买"
											cssClass="btn-fav">购买
												<s:param name="pid" value="#f.pid"></s:param>
											<s:param name="quantity" value="1"></s:param>
										</s:a>



										<s:a action="user_cancelCollect" namespace="/user" title="移除"
											cssClass="delete">移除
										<s:param name="pid" value="#f.pid"></s:param>
										</s:a>

									</div>
								</li>
							</ul>

						</div>
					</div>
				</tr>
			</s:iterator>
		</div>
		<div class="clear"></div>
	</div>





	<jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>