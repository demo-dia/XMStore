//获取XMLHttpRequest对象
function getXMLHttpRequest() {
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for all new browsers
		xmlhttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {// code for IE5 and IE6
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	return xmlhttp;

}




function changeCheckImg(){
	var captchaImage = document.getElementById("captchaImage");
	captchaImage.src="${pageContext.request.contextPath}/getCheckImg?"+new Date().getTime().toLocaleString();
}