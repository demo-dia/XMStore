<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>搜索页面</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/basic/css/demo.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/seastyle.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/basic/js/jquery-1.7.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/script.js"></script>
<link href="${pageContext.request.contextPath}/css/hmstyle.css"
	rel="stylesheet" type="text/css" />


</head>
<body>

	<jsp:include page="head.jsp" />
	<div class="clear"></div>
	<b class="line"></b>
	<div class="search">
		<div class="search-list">
			<div class="nav-table">
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
						<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
					</div>
				</div>
			</div>

			<div class="search-content">
				<div class="sort">
					<li class="first"><a title="综合">综合排序</a></li>
					<li><a title="销量">销量排序</a></li>
					<li><a title="价格">价格优先</a></li>
					<li class="big"><a title="评价" href="#">评价为主</a></li>
				</div>
				<div class="clear"></div>

				<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
					<s:iterator value="products">
						<li><s:a action="product_info" namespace="/product">
								<div class="i-pic limit">
									<img
										src="${pageContext.request.contextPath}/<s:property value="image" />"
										style="width: 218px; height: 218px" />
									<p class="title fl">
										<s:property value="pname" />
									</p>
									<p class="price fl">
										<b>¥</b> <strong><s:property value="shop_price" /></strong>
									</p>
									<s:param name="pid" value="pid"></s:param>
								</div>
							</s:a></li>
					</s:iterator>
				</ul>
			</div>

			<div class="search-side">

				<div class="side-title">热门推荐</div>

				<li>
					<div class="i-pic check">
						<img src="../images/row1.jpg" style="width:218px;height:218px"/>
						<p class="title fl">
							个人护理蝴蝶节，最高满199减100
						</p>
						<p class="price fl">
							&nbsp;<strong>参与活动</strong>
						</p>
						<p class="number fl">
							广告
						</p>
					</div>
				</li>
				<li>
					<div class="i-pic check">
						<img src="../images/row2.jpg" style="width:218px;height:218px"/>
						<p class="title fl">
							宠物选美季，每天一元秒
						</p>
						<p class="price fl">
							&nbsp;<strong>参与活动</strong>
						</p>
						<p class="number fl">
							广告
						</p>
					</div>
				</li>
				<li>
					<div class="i-pic check">
						<img src="../images/row3.jpg" style="width:218px;height:218px" />
						<p class="title fl">
							开学了，吃点好吃的
						</p>
						<p class="price fl">
							&nbsp;<strong>参与活动</strong>
						</p>
						<p class="number fl">
							广告
						</p>
					</div>
				</li>

			</div>
			<div class="clear"></div>

			<!--分页 -->
			<ul class="am-pagination am-pagination-right">
				<s:if test="page==1">
					<span class="firstPage">&nbsp;</span>
					<span class="previousPage">&nbsp;</span>
				</s:if>
				<s:else>
					<li><s:a cssClass="firstPage" action="product_findByCategory"
						namespace="/product">
						<s:param name="page" value="1"></s:param>
						<s:param name="cid" value="cid"></s:param>
						<s:param name="csid" value="csid"></s:param>
					&laquo;
					</s:a></li>
					<li><s:a cssClass="previousPage" action="product_findByCategory"
						namespace="/product">
						<s:param name="page" value="page-1"></s:param>
						<s:param name="cid" value="cid"></s:param>
						<s:param name="csid" value="csid"></s:param>
					&lt;
					</s:a></li>
				</s:else>

				<s:iterator begin="1" end="maxPage" status="vs">
					<s:if test="#vs.count==page">
						<li class="am-active"><span class="currentPage"><s:property value="#vs.count" /></span></li>
					</s:if>
					<s:else>
						<li><s:a action="product_findByCategory" namespace="/product">
							<s:param name="page" value="#vs.count"></s:param>
							<s:param name="cid" value="cid"></s:param>
							<s:param name="csid" value="csid"></s:param>
							<s:property value="#vs.count" />
						</s:a></li>
					</s:else>
				</s:iterator>

				<s:if test="page>=maxPage">
					<span class="nextPage">&nbsp;</span>
					<span class="lastPage">&nbsp;</span>
				</s:if>
				<s:else>
					<li><s:a cssClass="nextPage" action="product_findByCategory"
						namespace="/product">
						<s:param name="page" value="page+1"></s:param>
						<s:param name="cid" value="cid"></s:param>
						<s:param name="csid" value="csid"></s:param>
					&gt;
				</s:a></li>

					<li><s:a cssClass="lastPage" action="product_findByCategory"
						namespace="/product">
						<s:param name="page" value="maxPage"></s:param>
						<s:param name="cid" value="cid"></s:param>
						<s:param name="csid" value="csid"></s:param>
						&raquo;
					</s:a></li>

				</s:else>
			</ul>
		</div>


		<jsp:include page="foot.jsp" />
</body>
</html>