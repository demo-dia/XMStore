<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>购物车</title>
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/basic/css/demo.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/cartstyle.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/optstyle.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/list.js"></script>
</head>
<body>
	<jsp:include page="head.jsp" />

	<s:if
		test="#session.shopcart==null || #session.shopcart.cartItems.size()==0">
		<div style="margin: 0 auto;  width: 1200px; height:510px; text-align:center;verticle-align:middle;display:block">
			
				<b style="font-size:18px;padding-top:240px;display:block">您的购物车还是空的，赶紧行动吧！您可以：
					<s:a action="index" namespace="" style="font-size:18px;color:red">去购物</s:a>
				</b>
		
		</div>
	</s:if>
	<s:else>
		<!--购物车 -->
		<div class="concent">
			<div id="cartTable">
				<div class="cart-table-th">
					<div class="wp">
						<div class="th th-chk">
							<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
						</div>
						<div class="th th-item">
							<div class="td-inner">商品信息</div>
						</div>
						<div class="th th-price">
							<div class="td-inner">单价</div>
						</div>
						<div class="th th-amount">
							<div class="td-inner">数量</div>
						</div>
						<div class="th th-sum">
							<div class="td-inner">金额</div>
						</div>
						<div class="th th-op">
							<div class="td-inner">操作</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<s:iterator value="#session.shopcart.cartItems" status="vs">
					<tr class="item-list">
						<div class="bundle  bundle-last ">
							<div class="bundle-hd">
								<div class="bd-promos">
									<div class="bd-has-promo">
										<span class="bd-has-promo-content"></span>&nbsp;&nbsp;
									</div>
									<div class="act-promo">
										<a href="#" target="_blank"><span class="gt"></span></a>
									</div>
									<span class="list-change theme-login"></span>
								</div>
							</div>
							<div class="clear"></div>
							<div class="bundle-main">
								<ul class="item-content clearfix">
									<li class="td td-item">
										<div class="item-pic">
											<a href="#" target="_blank"
												data-title="<s:property value="product.image" />"
												class="J_MakePoint" data-point="tbcart.8.12"> <img
												src="${pageContext.request.contextPath}/<s:property value="product.image" />"
												class="itempic J_ItemImg" style="width: 80px; height: 80px;">
											</a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<a href="#" target="_blank"
													title="<s:property value="product.pname" />"
													class="item-title J_MakePoint" data-point="tbcart.8.11"><s:property
														value="product.pname" /></a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div class="item-props"></div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">

													<em class="price-original"><s:property
															value="product.market_price" /></em>
												</div>
												<div class="price-line">
													<em class="J_Price price-now" tabindex="0"><s:property
															value="product.shop_price" /></em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													<em tabindex="0" class="J_ItemSum number"><s:property
															value='count' /></em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number"><s:property
													value="subtotal" /></em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner">
											<s:a action="user_collectProduct" cssClass="btn-fav"
												namespace="/user">
											移入收藏夹<s:param name="pid" value="product.pid"></s:param>
											</s:a>
											<s:a action="product_removeProductFromCart"
												namespace="/product" cssClass="delete">删除<s:param
													name="pid" value="product.pid"></s:param>
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

			<div class="float-bar-wrapper">
				<div class="operations" style="margin-left: 30px;">
					<s:a action="product_clearCart" namespace="/product"
						cssClass="deleteAll">清空购物车</s:a>
				</div>
				<div class="float-bar-right">
					<div class="price-sum">
						<span class="txt">合计:</span> <strong class="price">¥<em
							id="J_Total"><s:property value="#session.shopcart.total" /></em></strong>
					</div>
					<div class="btn-area">
						<s:a action="order_save" namespace="/order" id="submit"
							cssClass="submit-btn submit-btn-disabled"
							aria-label="请注意如果没有选择宝贝，将无法结算">
							<span>结&nbsp;算</span>
						</s:a>
					</div>
				</div>

			</div>
		</div>
	</s:else>
	<jsp:include page="foot.jsp" />
</body>
</html>