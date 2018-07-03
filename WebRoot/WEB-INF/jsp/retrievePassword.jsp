<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%--
		找回密码
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码</title>
<link href="${pageContext.request.contextPath }/css/common.css"
	rel="stylesheet" type="text/css">

<style type="text/css">
#divcontent {
	width: 940px;
	height: 400px; border : 1px solid #EEEDDB;
	MARGIN-RIGHT: auto;
	MARGIN-LEFT: auto;
	border: 1px solid #EEEDDB;
}
</style>
</head>
<body>

	<div id="divcontent">
	<s:form action="user_retrievePassword" namespace="/user">
		<table width="800px" border="1" cellspacing="0"
			style="margin-top:100px" align="center">
			<tr>
			<td style=" padding-left:170px;"><font size="3px">请输入你的账号:</font></td>
			<td><s:textfield  name="loginName" cssClass="text" maxlength="200"></s:textfield></td>
			</tr>
			<tr>
			
				<td style=" padding-left:170px;"><br/><font size="3px">请输入你的安全邮箱:</font></td>

				<td style="padding-top:0px; padding-right:150px;">
				<span class="bg_text"><br/>
					<s:textfield  name="email" cssClass="text" maxlength="200"></s:textfield>
				</span>
				</td>
			</tr>
			
			<tr>
			<td></td>
			<td style="padding-top:0px; padding-right:250px;">
			<br/><s:submit cssClass="submit" value="找回密码"></s:submit>
			</td>
			</tr>
		</table>
</s:form>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>