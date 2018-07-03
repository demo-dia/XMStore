<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%-- 
		收货地址管理
--%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收货地址管理</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/old/style.css" />
<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/old/blue.css" />
<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/old/buylist.css" />
<link href="${pageContext.request.contextPath }/css/old/common.css"
	rel="stylesheet" type="text/css">
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
	
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/com.js"></script>
<script src="${pageContext.request.contextPath }/js/my.js"></script>
<script type="text/javascript">
	//根据省份id Ajax动态更新city信息
	function findCity(){
		var city = document.getElementById("city"); //得到select的选择框对象
		var county = document.getElementById("county");
		
		city.innerHTML=""; //第二次选择就清空上一次的内容
		county.innerHTML="";
		var province = document.getElementById("province").value; //得到省份代码
		var citys=null;
	
		var xhr = getXMLHttpRequest();
		
		xhr.onreadystatechange = function (){
			if(xhr.readyState==4){
				if(xhr.status==200){
					 citys = xhr.responseText;
					var json = eval("("+citys+")"); 
					city.innerHTML+="<option value=''>请选择城市</option>";
					county.innerHTML+="<option value=''>请选择县/区</option>";
					
					 for(var i = 0;i<json.length;i++){
						city.innerHTML+="<option value="+json[i].id+">"+json[i].name+"</option>";
					}
					 
				}
			}
		}
		
		xhr.open("GET","${pageContext.request.contextPath}/findCity?provinceId="+province,false);
		xhr.send(null);
		
	}
	
	function findCounty(){
		var county = document.getElementById("county");
		county.innerHTML="";
		
		var city = document.getElementById("city").value; //得到城市代码
		var countys=null;
		
		var xhr = getXMLHttpRequest();
		
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
						
					 	countys = xhr.responseText; //得到返回的json字符串
						
						var json = eval("("+countys+")"); 
						
						county.innerHTML+="<option value=''>请选择县/区</option>";
						
						 for(var i=0;i<json.length;i++){
							county.innerHTML+="<option value="+json[i].id+">"+json[i].name+"</option>";
						} 
				
				}
			}
		}
		
		xhr.open("GET","${pageContext.request.contextPath}/findCounty?cityId="+city,false);
		xhr.send(null);
		
		
	}
	
	
	function modifyAddress(aid){
	
	var thisId =  document.getElementById("aid");
	var addressee = document.getElementById("addressee");
	var province = document.getElementById("province");
	var city = document.getElementById("city");
	var county = document.getElementById("county");
	var street = document.getElementById("street");
	var postalcode = document.getElementById("postalcode");
	var phone = document.getElementById("phone");
	var isDefault = document.getElementById("isDefault");
	
	
		var xhr = getXMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
				
					var addr = xhr.responseText;
					var json = eval("("+addr+")");
					thisId.value=json.aid;
					addressee.value=json.addressee;
					street.value=json.street;
					postalcode.value=json.postalcode;
					province.value=json.province.id;
					findCity();
					city.value=json.city.id;
					findCounty();
					county.value=json.county.id;
					phone.value = json.phone;
					isDefault.checked=json.isDefault;
				}
			}
		}
		
		xhr.open("GET","${pageContext.request.contextPath}/user/user_modifyAddress?aid="+aid,true);
		xhr.send(null);	
	}
	
</script>
</head>
<body>
	<jsp:include page="../head.jsp" />
	<b class="line" style="margin-top: -30px;display:block"></b>
<div style="margin-top: 45px;margin-bottom:30px;" class="w mt ofc">
	
	
	
		<div class="confirm">
			<div class="tl"></div><div class="tr"></div>
			<div class="ofc">

				<h2 class="h2 h2_r2"><em title="个人资料">收货地址</em></h2>

				<h3 class="h3_r">已存收货地址列表<span>最多保存5个收货地址</span></h3>

				<table cellspacing="0" summary="" class="tab tab6">
				<thead>
				<tr>
				<th>收货人</th>
				<th>所在地区</th>
				<th>街道地址</th>
				<th>邮编</th>
				<th>电话/手机</th>
				<th>是否默认</th>
				<th>操作</th>
				</tr>                                                          
				</thead>
				<tbody>
				
			<s:iterator var="addr" value="#session.user.addresses">
				<tr>
					<td><s:property value="#addr.addressee" /></td>
					<td>
						<s:property value="#addr.province.name" />&nbsp;
						<s:property value="#addr.city.name" />&nbsp;
						<s:property value="#addr.county.name" />
					</td>
					<td><s:property value="#addr.street"/></td>
					<td><s:property value="#addr.postalcode" /></td>
					<td><s:property value="#addr.phone" /></td>
					<td class="def">
					<s:if test="#addr.isDefault==true">默认地址</s:if>
					<s:elseif  test="#addr.isDefault==false" >
						<s:a action="user_setDefaultAddress" namespace="/user" title="设为默认">
							<s:param name="aid" value="#addr.aid"></s:param>设为默认
						</s:a>
					</s:elseif>
					</td>
					<td>
						<a href="javascript:modifyAddress('<s:property value="#addr.aid"/>')" class="blue" title="修改"  >
							[修改]
						</a>
						<s:a cssClass="blue" title="删除"  action="user_deleteAddress" namespace="/user" >
							[删除]<s:param name="aid" value="#addr.aid"></s:param>
						</s:a>
					</td>                  
				</tr>
				</s:iterator>
			</tbody>
				</table>

				<h3 class="h3_r">新增/修改收货地址<span>除了邮政编码,其余均为必填</span></h3>
		
			<s:form action="user_saveOrUpdateAddress" namespace="/user" id="jvForm" method="post">
			
				<s:hidden name="address.aid" id="aid" ></s:hidden>
		
					<ul class="uls form">
					<li>
						<label for="username"><samp>*</samp>收货人姓名：</label>
						<span class="bg_text">
						<s:textfield id="addressee" name="address.addressee" maxlength="100"></s:textfield>
						</span>
						<!--<span class="pos"><span class="tip okTip">&nbsp;</span></span>-->
					</li>
					<li>
						<label for="residence"><samp>*</samp>地　　址：</label>
						<span class="word">
						
								<s:select list="provinces"  headerKey="-1" headerValue="请选择省份"
								id="province" name="address.province.id" onchange="findCity()" 
								listKey="value" listValue="key"
								>
								</s:select>
		
								
							
								<s:select list="#{ }" headerKey="-1" headerValue="请选择 市"
								 id="city" name="address.city.id" onchange="findCounty()"
								>
								
								</s:select>
							
								<s:select list="#{ }" headerKey="-1" headerValue="请选择县/区"
								 id="county" name="address.county.id"
								>
								
								</s:select>
					
						</span>
					
					
					</li>
					<li>
						<label for="nick"><samp>*</samp>街道地址：</label>
						<span class="bg_text">
						<s:textfield id="street" name="address.street" maxlength="255"></s:textfield>
						</span>
						<!--<span class="pos"><span class="tip errorTip">用户名为4-20位字母、数字或中文组成，字母区分大小写。</span></span>-->
					</li>
					<li>
						<label for="zipCode">邮政编码：</label>
						<span class="bg_text">
						<s:textfield id="postalcode" name="address.postalcode" maxlength="32"></s:textfield>
						</span>
					</li>
					<li>
						<label for="telphone"><samp>*</samp>联系电话：</label>
						<span class="bg_text">
							<s:textfield id="phone" name="address.phone" maxlength="32"></s:textfield>
						</span>
						<!--<span class="pos"><span class="tip warningTip">用户名为4-20位字母、数字或中文组成，字母区分大小写。</span></span>-->
					</li>
					<li>
						<label for="statusAddr">&nbsp;</label>
						<span>
						<s:checkbox name="address.isDefault" id="isDefault"  value="true" ></s:checkbox>设为默认地址
						</span>
					</li>
					<li><label for="">&nbsp;</label><input type="submit" value="保存" class="hand btn66x23" /></li>
					</ul>
			</s:form>

			</div>
			<div class="fl"><s:actionerror/></div><div class="fr"></div>
		</div>

	</div>
<jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>