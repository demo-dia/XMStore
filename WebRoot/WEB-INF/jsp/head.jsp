<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>


<!--顶部导航条 -->
<div class="am-container header" style="height: 35px;">
	<ul class="message-l">
		<div class="topMessage">
			<div class="menu-hd">
				<s:if test="#session.user==null">
					<s:a action="login" namespace="" class="h">亲，请登录</s:a>
					<s:a action="regist" namespace="" style="color:red">免费注册</s:a>
				</s:if>
				<s:else>
					<i class="am-icon-github am-icon-fw"></i>
					<s:property value="#session.user.userName" />
					<s:a action="logout" namespace="" style="font-size:12px">[退出]</s:a>
				</s:else>
			</div>
		</div>
	</ul>
	<ul class="message-r">
		<div class="topMessage home">
			<div class="menu-hd">
				<s:a action="index" namespace="" class="h">
					<i class="am-icon-edge"></i>&nbsp;商城首页</s:a>
			</div>
		</div>
		<div class="topMessage my-shangcheng">
			<div class="menu-hd MyShangcheng">
				<s:if test="#session.user==null">

				</s:if>
				<s:else>

					<s:a action="account_myOrders" namespace="/account" title="返回订单列表">
						<i class="am-icon-user am-icon-fw"></i>&nbsp;我的订单</s:a>&nbsp;&nbsp;&nbsp;
						<s:a action="account_deliverAddress" namespace="/account"
						title="收货地址">
						<i class="am-icon-flag"></i>&nbsp;收货地址</s:a>
				</s:else>
			</div>
		</div>
		<div class="topMessage mini-cart">
			<div class="menu-hd">

				<s:a action="shopcart" namespace="" class="h">
					<i class="am-icon-shopping-cart  am-icon-fw"></i>&nbsp;购物车</s:a>
			</div>
		</div>
		<div class="topMessage favorite">
			<div class="menu-hd">
				<s:a action="account_myFavorites" namespace="/account">
					<i class="am-icon-heart am-icon-fw"></i>
					<span>&nbsp;收藏夹</span>
				</s:a>
			</div>
	</ul>
</div>

<!--悬浮搜索框-->
<div class="nav white">
	<div class="logo">
			<img src="${pageContext.request.contextPath}/images/logobig.png" />
	</div>
	<div class="logoBig">
		<li><s:a action="index" namespace=""><img
			src="${pageContext.request.contextPath}/images/logobig.png" /></s:a></li>
	</div>
	<div class="search-bar pr">
		<a name="index_none_header_sysc" href="#"></a>
		<form>
			<input id="searchInput" name="index_none_header_sysc" type="text"
				placeholder="搜索" autocomplete="off"> <input
				id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
				type="submit">
		</form>
	</div>
</div>
<div class="clear"></div>