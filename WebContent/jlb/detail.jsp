<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="<%=request.getContextPath()%>/jlb/js/jquery-1.9.1.min.js" type="text/javascript"></script>
 <script src="<%=request.getContextPath()%>/jlb/js/jquery.litenav.js" type="text/javascript"></script>
 <script src="<%=request.getContextPath()%>/jlb/js/lrtk.js"></script>
 <link href="<%=request.getContextPath()%>/jlb/css/index.css" rel="stylesheet" type="text/css" />
 <link href="<%=request.getContextPath()%>/jlb/css/style.css" rel="stylesheet" type="text/css" />
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
<div id="KeFuDiv" class="KeFuDiv">
  <div><img src="<%=request.getContextPath()%>/jlb/images/up_001.gif" width="105" border="0" usemap="#Map" style="cursor:move;" title="拖动" onmousedown="MoveDiv(KeFuDiv,event);"></div>


    <div class="KeFuTitle"><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/list_001.gif" /></a></div>

    <div class="KeFuTitle"><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/list_001.gif" /></a></div>  

    
     <div class="KeFuTitle"><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/list_002.gif" /></a></div>
<div class="div_img"><img src="<%=request.getContextPath()%>/jlb/images/bot_001.gif" border="0"></div>


</div>

<script>
//初始位置
gID("KeFuDiv").style.top = (document.documentElement.clientHeight - gID("KeFuDiv").offsetHeight)/2 +"px";
gID("KeFuDiv").style.left = document.documentElement.clientWidth - gID("KeFuDiv").offsetWidth +"px";
//开始滚动
ScrollDiv('KeFuDiv');
</script>
</body>
</html>
