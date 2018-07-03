<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>订单页面-支付</title>
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/basic/css/demo.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/cartstyle.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/jsstyle.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/address.js"></script>

</head>
<body>


	<jsp:include page="head.jsp" />

	<div class="concent">
		<!--地址 -->
		<s:form id="orderForm" action="order_pay" namespace="/order">
		<div class="paycont">
			<div class="address">
				<h3>确认收货地址</h3>

				<div class="clear"></div>
				<ul>
					<div class="per-border"></div>
					<s:iterator var="addr" value="#session.user.addresses">
						<s:if test="#addr.isDefault==true">
							<li class="user-addresslist defaultAddr">
						</s:if>
						<s:else>
							<li class="user-addresslist">
						</s:else>
						<div class="address-left">
							<div class="user DefaultAddr">

								<span class="buy-address-detail"> <span class="buy-user"><s:property
											value="#addr.addressee" /></span> <span class="buy-phone"><s:property
											value="#addr.phone" /></span>
								</span>
							</div>
							<div class="default-address DefaultAddr">
								<span class="buy-line-title buy-line-title-type">邮政编码：</span> <span
									class="buy--address-detail"> <s:property
										value="#addr.postalcode" /></span>
							</div>
							<div class="default-address DefaultAddr">
								<span class="buy-line-title buy-line-title-type">收货地址：</span> <span
									class="buy--address-detail"> <span class="province"><s:property
											value="#addr.province.name" /></span> <span class="city"><s:property
											value="#addr.city.name" /></span> <span class="dist"><s:property
											value="#addr.county.name" /></span> <span class="street"><s:property
											value="#addr.street" /></span>
								</span>

							</div>
							<s:if test="#addr.isDefault==true">
								<ins class="deftip">默认地址</ins>
							</s:if>

						</div>
						<div class="address-right">
							<a href="../person/address.html"> <span
								class="am-icon-angle-right am-icon-lg"></span></a>
						</div>
						<div class="clear"></div>

						<div class="new-addr-btn">
							<s:if test="#addr.isDefault!=true">
								<a href="#">设为默认</a>
								<span class="new-addr-bar">|</span>
							</s:if>
							<a href="#">编辑</a> <span class="new-addr-bar">|</span> <a
								href="javascript:void(0);" onclick="delClick(this);">删除</a>
						</div>
						</li>
						<div class="per-border"></div>
					</s:iterator>
				</ul>
				<div class="clear"></div>
			</div>
			<!--物流 -->
			<div class="logistics">
				<h3>选择物流方式</h3>
				<ul class="op_express_delivery_hot">
					<li data-value="yuantong" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position: 0px -468px"></i>圆通<span></span></li>
					<li data-value="shentong" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position: 0px -1008px"></i>申通<span></span></li>
					<li data-value="yunda" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position: 0px -576px"></i>韵达<span></span></li>
					<li data-value="zhongtong"
						class="OP_LOG_BTN op_express_delivery_hot_last "><i
						class="c-gap-right" style="background-position: 0px -324px"></i>中通<span></span></li>
					<li data-value="shunfeng"
						class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i
						class="c-gap-right" style="background-position: 0px -180px"></i>顺丰<span></span></li>
				</ul>
			</div>
			<div class="clear"></div>

			<!--支付方式-->
			<div class="logistics">
				<h3>选择支付方式</h3>
				<ul class="pay-list">
					<li class="pay card" style="text-align:center;"><img src="${pageContext.request.contextPath}/images/logo_dask.png" style="width:160px"/></li>
				</ul>
			</div>
			<div class="clear"></div>


			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>确认订单信息</h3>
					<div class="cart-table-th">
						<div class="wp">

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
							<div class="th th-oplist">
								<div class="td-inner">配送方式</div>
							</div>

						</div>
					</div>
					<div class="clear"></div>
					<s:iterator value="order.orderItem">
						<tr class="item-list">
							<div class="bundle  bundle-last">

								<div class="bundle-main">
									<ul class="item-content clearfix">
										<div class="pay-phone">
											<li class="td td-item">
												<div class="item-pic">
													<a href="#" class="J_MakePoint"> <img
														src="${pageContext.request.contextPath}/<s:property value="product.image"/>"
														style="width: 80px; height: 80px" />
													</a>
												</div>
												<div class="item-info">
													<div class="item-basic-info">
														<a href="#" class="item-title J_MakePoint"
															data-point="tbcart.8.11"><s:property
																value="product.pname" /></a>
													</div>
												</div>
											</li>
											<li class="td td-price">
												<div class="item-price price-promo-promo">
													<div class="price-content">
														<em class="J_Price price-now"><s:property
																value="product.shop_price" /></em>
													</div>
												</div>
											</li>
										</div>
										<li class="td td-amount">
											<div class="amount-wrapper ">
												<div class="item-amount ">
													<span class="phone-title">购买数量</span>
													<div class="sl">
														<div class="price-content">
															<em class="J_Price price-now"><s:property
																	value="count" /></em>
														</div>


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
										<li class="td td-oplist">
											<div class="td-inner">
												<span class="phone-title">配送方式</span>
												<div class="pay-logis">
													<b class="sys_item_freprice">包邮</b>
												</div>
											</div>
										</li>

									</ul>
									<div class="clear"></div>

								</div>
						</tr>
					</s:iterator>
					<div class="clear"></div>

				</div>

				<div class="pay-total">
					<!--留言-->
					<div class="order-extra">
						<div class="order-user-info">
							<div id="holyshit257" class="memo">
								<label>买家留言：</label> <input type="text"
									title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）"
									placeholder="选填,建议填写和卖家达成一致的说明"
									class="memo-input J_MakePoint c2c-text-default memo-close">
								<div class="msg hidden J-msg">
									<p class="error">最多输入500个字符</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--含运费小计 -->
		<div class="buy-point-discharge ">
			<p class="price g_price ">
				合计（含运费） <span>¥</span><em class="pay-sum"><s:property
						value="order.total" /></em>
			</p>
		</div>

		<!--信息 -->
		<div class="order-go clearfix">
			<div class="pay-confirm clearfix">
				<div class="box">
					<div tabindex="0" id="holyshit267" class="realPay">
						<em class="t">实付款：</em> <span class="price g_price "> <span>¥</span>
							<em class="style-large-bold-red " id="J_ActualFee"><s:property
									value="order.total" /></em>
						</span>
					</div>
				</div>
		
				<div id="holyshit269" class="submitOrder">
					<div class="go-btn-wrap">
						<a id="J_Go" href="javascript:document.getElementById('orderForm').submit();" class="btn-go" tabindex="0"
							title="点击此按钮，提交订单">提交订单</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		</s:form>
	</div>
	



	<jsp:include page="foot.jsp" />
</body>
</html>