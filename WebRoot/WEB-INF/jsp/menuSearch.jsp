<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>




<b class="line"></b>
<div class="shopNav">
	<div class="slideall" style="height: auto;">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index"><s:a action="index" namespace="" class="h">首页</s:a></li>
				<li class="qc"><a href="#">闪购</a></li>
				<li class="qc"><a href="#">限时抢</a></li>
				<li class="qc"><a href="#">团购</a></li>
				<li class="qc last"><a href="#">大包装</a></li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
		<div class="bannerTwo">
			<!--轮播 -->
			<div class="am-slider am-slider-default scoll" data-am-flexslider
				id="demo-slider-0">
				<ul class="am-slides">
					<li class="banner1"><a href="introduction.html"><img
							src="${pageContext.request.contextPath}/images/ad1.jpg" /></a></li>
					<li class="banner2"><a><img
							src="${pageContext.request.contextPath}/images/ad2.jpg" /></a></li>
					<li class="banner3"><a><img
							src="${pageContext.request.contextPath}/images/ad3.jpg" /></a></li>
					<li class="banner4"><a><img
							src="${pageContext.request.contextPath}/images/ad4.jpg" /></a></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>

		<!-- 侧边栏 -->
		<div id="nav" class="navfull" style="position: static;">
			<div class="area clearfix">
				<div class="category-content" id="guide_2">
					<div class="category" style="box-shadow: none; margin-top: 2px;">
						<ul class="category-list navTwo" id="js_climit_li">
							<s:iterator var="cate" value="#application.categories">
								<li>
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a style="font-size: 12px;"
												title="<s:property value="#cate.cname" />"><s:property
													value="#cate.cname" /></a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
															<s:a action="product_findByCategory" namespace="/product">
															<s:param name="page" value="1"></s:param>
											<s:param name="cid" value="#cate.cid"></s:param>
																<span title="<s:property value="#cate.cname" />"><s:property
																		value="#cate.cname" /></span>
																		</s:a>
															</dt>

															<s:iterator var="cateSecond"
																value="#cate.categorySeconds">
																<dd>
																	<s:a action="product_findByCategory"
																		namespace="/product">
																		<s:param name="page" value="1"></s:param>
																		<s:param name="csid" value="#cateSecond.csid"></s:param>
																		<s:property value="#cateSecond.csname" />
																	</s:a>
																</dd>
															</s:iterator>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
							</s:iterator>
						</ul>

					</div>
				</div>
			</div>
		</div>

		<!--导航 -->
		<script type="text/javascript">
			(function() {
				$('.am-slider').flexslider();
			});
			$(document)
					.ready(
							function() {
								$("li")
										.hover(
												function() {
													$(
															".category-content .category-list li.first .menu-in")
															.css("display",
																	"none");
													$(
															".category-content .category-list li.first")
															.removeClass(
																	"hover");
													$(this).addClass("hover");
													$(this).children(
															"div.menu-in").css(
															"display", "block")
												},
												function() {
													$(this)
															.removeClass(
																	"hover")
													$(this).children(
															"div.menu-in").css(
															"display", "none")
												});
							})
		</script>

		<!--各类活动-->
		<div class="row">
			<li><a><img
					src="${pageContext.request.contextPath}/images/row1.jpg" /></a></li>
			<li><a><img
					src="${pageContext.request.contextPath}/images/row2.jpg" /></a></li>
			<li><a><img
					src="${pageContext.request.contextPath}/images/row3.jpg" /></a></li>
			<li><a><img
					src="${pageContext.request.contextPath}/images/row4.jpg" /></a></li>
		</div>
		<div class="clear"></div>
		<!--走马灯 -->
		<div class="marqueenTwo">
			<span class="marqueen-title"><i
				class="am-icon-volume-up am-icon-fw"></i>商城头条<em
				class="am-icon-angle-double-right"></em></span>
			<div class="demo">
				<ul>
					<li class="title-first"><a target="_blank" href="#"> <img
							src="../images/TJ2.jpg"></img> <span>[特惠]</span>洋河年末大促，低至两件五折
					</a></li>
					<li class="title-first"><a target="_blank" href="#"> <span>[公告]</span>商城与广州市签署战略合作协议
							<img src="../images/TJ.jpg"></img>
							<p>XXXXXXXXXXXXXXXXXX</p>
					</a></li>
					<li><a target="_blank" href="#"><span>[特惠]</span>女生节商城爆品1分秒
					</a></li>
					<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
					<li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券
							买1送1！</a></li>
					<li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>
					<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
				</ul>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>