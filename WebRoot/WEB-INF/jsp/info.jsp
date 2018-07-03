<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>





<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title><s:property value="pname" /></title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/basic/css/demo.css"
	rel="stylesheet" type="text/css" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/optstyle.css"
	rel="stylesheet" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" />




<script type="text/javascript"
	src="${pageContext.request.contextPath}/basic/js/jquery-1.7.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/basic/js/quick_links.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.imagezoom.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/list.js"></script>








<script type="text/javascript">
	//检查提交数量
	function checkNumber() {

		var text_box = document.getElementById("text_box");

		var reg = /^[0-9]{1,20}$/;

		if (!reg.test(text_box.value)) {
			text_box.value = 0;
		}
	}
</script>
</head>
<body>

	<jsp:include page="head.jsp" />



	<ol class="am-breadcrumb am-breadcrumb-slash">
		<li><a href="#">首页</a></li>
		<li><a href="#">分类</a></li>
		<li class="am-active">内容</li>
	</ol>

	<div class="item-inform">
		<div class="clearfixLeft" id="clearcontent">
			<div class="box">
				<img style="opacity: 1; width: 370px;"
					title="<s:property value="pname" />" class="jqzoom"
					src="${pageContext.request.contextPath}/<s:property value="image"/>" />
			</div>
			<li class="tb-social-fav"><s:a action="user_collectProduct"
					namespace="/user">
					<i class="tb-icon"></i>收藏宝贝<s:param name="pid" value="pid"></s:param>
				</s:a></li>
			<div class="clear"></div>
		</div>

		<div class="clearfixRight">
			<!--规格属性-->
			<!--名称-->
			<div class="tb-detail-hd">
				<h1>
					<s:property value="pname" />
				</h1>
			</div>
			<div class="tb-detail-list">
				<!--价格-->
				<div class="tb-detail-price">
					<li class="price iteminfo_price">
						<dt>促销价</dt>
						<dd>
							<em>¥</em><b class="sys_item_price"><s:property value="shop_price" /></b>
						</dd>
					</li>
					<li class="price iteminfo_mktprice">
						<dt>原价</dt>
						<dd>
							<em>¥</em><b class="sys_item_mktprice"><s:property
									value="market_price" /></b>
						</dd>
					</li>
					<div class="clear"></div>
				</div>
				<!--地址-->
				<dl class="iteminfo_parameter freight">
					<dt>配送至</dt>
					<div class="iteminfo_freprice">
						<div class="am-form-content address">
							<select data-am-selected>
								<option value="a">广东省</option>
								<option value="b">湖北省</option>
							</select> <select data-am-selected>
								<option value="a">汕头市</option>
								<option value="b">武汉市</option>
							</select> <select data-am-selected>
								<option value="a">澄海区</option>
								<option value="b">洪山区</option>
							</select>
						</div>
						<div class="pay-logis">
							快递<b class="sys_item_freprice">10</b>元
						</div>
					</div>
				</dl>
				<div class="clear"></div>

				<div class="clear"></div>
				<!--销量-->
				<ul class="tm-ind-panel">
					<li class="tm-ind-item tm-ind-sellCount canClick">
						<div class="tm-indcon">
							<span class="tm-label">月销量</span><span class="tm-count">1015</span>
						</div>
					</li>
					<li class="tm-ind-item tm-ind-sumCount canClick">
						<div class="tm-indcon">
							<span class="tm-label">累计销量</span><span class="tm-count">6015</span>
						</div>
					</li>
					<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
						<div class="tm-indcon">
							<span class="tm-label">累计评价</span><span class="tm-count">640</span>
						</div>
					</li>
				</ul>
				<div class="clear"></div>
				<!--各种规格-->
				<dl class="iteminfo_parameter sys_item_specpara">
					<dt class="theme-login">
					</dt>
					<dd>
						<!--操作页面-->
						<div class="theme-popover-mask"></div>
						<div class="theme-popover">
							<div class="theme-span"></div>
							<div class="theme-poptit">
								<a href="javascript:;" title="关闭" class="close">×</a>
							</div>
							<div class="theme-popbod dform">
								<s:form action="product_addCart" namespace="/product"
									cssClass="theme-signin">
									<input type="hidden" name="pid"
										value="<s:property value="pid" />" />
									<div class="theme-signin-left">
										<div class="theme-options">
											<div class="cart-title number">数量</div>
											<dd>
												<input id="min" class="am-btn am-btn-default" name=""
													type="button" value="-" disabled="disabled">
												<s:textfield id="text_box" name="quantity" value="1"
													maxlength="4" onchange="checkNumber()" style="width: 30px;"></s:textfield>
												<input id="add" class="am-btn am-btn-default" name=""
													type="button" value="+"> <span id="Stock"
													class="tb-hidden"> 库存<span class="stock"><s:property
															value="num" /></span>件
												</span>
											</dd>
										</div>
										<div class="clear"></div>
									</div>
							</div>
						</div>
					</dd>
				</dl>
				<div class="pay">

					<li>
						<div class="clearfix tb-btn tb-btn-buy theme-login">
							<a id="LikBuy" title="点此按钮到下一步确认购买信息" href="#">立即购买</a>

						</div>
					</li>
					<li>
						<div class="clearfix tb-btn tb-btn-basket theme-login" style="width:98px;">
							<!-- 	<a id="LikBasket" title="加入购物车" href="#"><i></i>加入购物车</a> -->
							<s:submit id="addCart" value="加入购物车"
								style=" margin-right: 0px;
										display:block;
										
									    float: left;
									    overflow: hidden;
									    position: relative;
									    width: 100%;
									    height: 30px;
									    line-height: 30px;
									    background-color: #F03726;
									    color: #fff;
									    border: 1px solid #F03726;
									    font-size: 14px;
									    text-align: center;">
   							 </s:submit>
						</div>
					</li>
				</div>
				</s:form>
				<div class="clear"></div>
				<!--活动	-->
				<div class="shopPromotion gold">
					<div class="hot">
						<dt class="tb-metatit">店铺优惠</dt>
						<div class="gold-list">
							<p>
								购物满2件打8折，满3件7折<span>点击领券<i class="am-icon-sort-down"></i></span>
							</p>
						</div>
					</div>
					<div class="clear"></div>
					<div class="coupon">
						<dt class="tb-metatit">优惠券</dt>
						<div class="gold-list">
							<ul>
								<li>125减5</li>
								<li>198减10</li>
								<li>298减20</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="item-inform">
				<div class="clear"></div>
			
							<!--优惠套装-->
				<div class="match">
					<div class="match-title">商品介绍</div>
					<div class="match-comment">
						<ul style="margin:20px auto">
							<li style="width:1100px;margin:0 auto;">
								<s:property value="pdesc" />
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
</div>
	 <jsp:include page="foot.jsp" /> 
</body>
</html>