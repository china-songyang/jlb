<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<title>详细信息</title>
<script type="text/javascript">
$(function() {
	var cid = '<%=request.getParameter("cid")%>';
	var did = '<%=request.getParameter("did")%>';
	//按获得文章
	$.post("<%=request.getContextPath()%>/webdo/article/onearticle.do", 
			{aid:cid,id:did}, 
			function(json){
				var id = json.id;
				var titlez = json.title;
				var text = json.text;
				var time = json.createTime;
				if(titlez==null||titlez=="")
					$("#title").html("");
				else
					$("#title").html(""+titlez);
				if(text==null||text=="")
					$("#content").html("");
				else
					$("#content").html(text);
				if(time == null || time == "")
					$("#time").html("");
				else
					$("#time").html(""+time);
			}, 
			"json");
	});

</script>
</head>
<body>
<div class="body">
<!-- 头文件 -->
<%@ include file="/jlb/include/top.jsp" %>
<div class="con20">
<!-- 左侧文件 -->
<%@ include file="/jlb/include/left.jsp" %>
<div class="con22">
<div class="con22_top"></div>
<div class="con23_main">
<h2 id="title"></h2>
<span style="color:#606E7B;float:right;margin-right:50px;" >发布时间：<span id="time"></span></span>
<br>
<p id="content"></p>
</div>
<div class="con22_bottom"></div>
</div>
</div>
<%--<%@ include file="/jlb/include/roll.jsp" %> --%>

</div>
<div id="footer">
<%@ include file="/jlb/include/foot.jsp" %>
</div>
<%@ include file="/jlb/include/cs.jsp" %>
</body>
</html>
