<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>会员登录</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />

	<link rel="stylesheet"
			href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" />
	<link href="${pageContext.request.contextPath}/css/dlstyle.css"
			rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function onSubmitCheck() {
			return true;
		}
	</script>
	
</head>
<body>

	<div class="login-boxtitle">
		<s:a action="index" namespace=""><img alt="logo"
			src="${pageContext.request.contextPath}/images/logobig.png" /></s:a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span> <img
					src="${pageContext.request.contextPath}/images/big.jpg" />
			</div>
			<div class="login-box">

				<h3 class="title" style="font-size: 15px; margin-bottom: 10px;">登录商城</h3>

				<div class="clear"></div>

				<div class="login-form">
					<s:form action="user_login" namespace="/user" id="loginForm"
						method="post" onsubmit="return onSubmitCheck()">
						<div class="user-name">
							<label for="user"><i class="am-icon-user"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:textfield id="loginName" name="loginName" cssClass="input"
								maxlength="20" placeholder="邮箱/手机/用户名"></s:textfield>
						</div>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"
								style="margin-top: 12px; font-size: 17px;"></i></label>
							<s:password id="password" name="password" cssClass="input"
								maxlength="20" placeholder="请输入密码"></s:password>
						</div>
				</div>

				<div class="login-links">
					<label for="remember-me"> <input id="remember-me"
						type="checkbox">记住密码 </label> <a href="#" class="am-fr">忘记密码</a>
					<s:a action="regist" namespace="/"
						cssClass="zcnext am-fr am-btn-default">注册</s:a>
					<br />
				</div>
				<div class="am-cf">
					<input type="submit" value="登 录"
						class="am-btn am-btn-primary am-btn-sm">
				</div>
				</s:form>

				<!-- 合作账号功能未实现 -->
				<div class="partner">
					<h3>合作账号</h3>
					<div class="am-btn-group">
						<li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
						<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span>
						</a></li>
						<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span>
						</a></li>
					</div>
				</div>

			</div>
		</div>
	</div>

	<jsp:include page="foot.jsp" />
</body>
</html>