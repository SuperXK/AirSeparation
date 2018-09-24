<%@page import="java.util.List"%>
<%@page import="cn.edu.hdu.Entity.Factory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!--声明当前页面的编码集：charset=gbk,gb2312(中文编码)，utf-8(国际编码)-->
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<meta name="keywords" content="关键词，关键字">
<meta name="description" content="This is my page">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>实时数据</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/jquery-easyui-1.5.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/jquery-easyui-1.5.3/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: "微软雅黑";
	font-size: 12px;
	color: #666;
	background: #E0EEEE;
	border: 2px solid red;
}

#btn {
	width: 90px;
	height: 25px;
	display: block;
	background: #69F;
	margin: 10px 5px 5px;
	line-height: 25px;
	text-align: center;
	color: #fff;
	float: left;
	text-decoration: none;
	font-size: 16px;
	border-radius: 5px;
}

#btn:hover {
	background: #63f;
}

</style>
<script type="text/javascript">
	var iframeheight;
	//根据工厂的系统个数图片自适应高度
	$(function(){
		var factoryNum = ${factoryNum};
		if(factoryNum<10){
			iframeheight = 'width:100%;height:92%;'
		}else if(factoryNum<21){
			iframeheight = 'width:100%;height:84%;'
		}else{
			iframeheight = 'width:100%;height:74%;'
		}
		//console.log(factoryNum+','+iframeheight)
	})
	function openTab(systemName, url, iconCls) {
		
		if ($("#tabs").tabs("exists", systemName)) {
			$("#tabs").tabs("select", systemName);
		} else {
			var content = "<iframe frameborder=0 scrolling='auto' style='"+ iframeheight +"' src='${pageContext.request.contextPath}/"
					+ url + "'></iframe>";
			console.log(content);
			$("#tabs").tabs("add", {
				title : systemName,
				iconCls : iconCls,
				closable : true,
				content : content
			});
		}
	}
</script>
</head>
<body>
	<div class="easyui-tabs" fit="true" id="tabs">
		<c:forEach items="${factoryInfoList}" var="facCurInfo">
			<c:choose>
				<c:when test="${facCurInfo.systemName == '报警系统'}">
					<a
						href="javascript:openTab('${facCurInfo.systemName}','alarm.html?factoryId=${facCurInfo.factoryId}')"
						class="easyui-linkbutton" data-options="plain:true" id="btn">${facCurInfo.systemName}</a>
				</c:when>
				<c:otherwise>
					<a
						href="javascript:openTab('${facCurInfo.systemName}','systemCurrent.html?modelId=${facCurInfo.modelId}&modelName=tb2_model${facCurInfo.modelNum}&systemName=${facCurInfo.systemName}')"
						class="easyui-linkbutton" data-options="plain:true" id="btn">${facCurInfo.systemName}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</body>
</html>