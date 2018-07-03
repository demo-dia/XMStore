<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<style type="text/css">
#divcontent {
	width: 940px;
	height: 400px;
	border: 1px solid #EEEDDB;
	MARGIN-RIGHT: auto;
	MARGIN-LEFT: auto;
}
</style>
</head>
<body>
	<jsp:include page="head.jsp" />
	
	<div id="divcontent"  style="margin-top:50px;">
		<table width="800px" border="0" cellspacing="0"
			style="margin-top: 100px" align="center">
			<tr>
				<td style="width: 98; padding-left: 200px;"><img
					src="${pageContext.request.contextPath}/images/error.jpg"
					style="width: 128px; height: 128px" /></td>

				<td style="padding-top: 0px; padding-right: 250px;"><font
					style="font-weight: bold; color: #FF0000; font-size: 16px"
					align="center"><s:actionerror />&nbsp;&nbsp;<s:a style="float:left"
							action="index" namespace="/">返回首页</s:a></font></td>
			</tr>
		</table>

	</div>
	<div style="margin-top:50px;"></div>
	<jsp:include page="foot.jsp" />
</body>
</html>