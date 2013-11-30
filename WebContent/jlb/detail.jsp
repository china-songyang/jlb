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
/* 成功案例 */
function getArticle_cgal(divid,size,opt){
	$("#"+divid+"More").attr("href","<%=request.getContextPath()%>/jlb/list.jsp?cid="+opt.aid);
	$.post("<%=request.getContextPath()%>/webdo/article/articleListByPage.do", 
			opt, 
			function(json){
				var str = "";
				$("#"+divid).html(str);
				var num = json.rows.length;
				if(num>0){
					for(var i=0;i<num;i++) {
						var id = json.rows[i].id;
						var image = json.rows[i].image!=""?json.rows[i].image:"images/jctp_01.jpg";
						var title = size!=null&&size!=""&&json.rows[i].title.length>size?json.rows[i].title.substr(0,size)+"...":json.rows[i].title;
						var datetime = json.rows[i].createTime.substr(0,10);
						var url="<%=request.getContextPath()%>/jlb/detail.jsp?cid="+opt.aid+"&did="+id;
						str=$("#"+divid).html()+"<li><a href=\""+url+"\"><img width=\"140\" height=\"118\" alt=\""+json.rows[i].title+"\" src=\""+image+"\"/></a><br><span>"+title+"</span></li>";
						$("#"+divid).html(str);
					}
				}
				
				$(".scrollleft").imgscroll({
					speed: 20,    //图片滚动速度
					amount: 0,    //图片滚动过渡时间
					width: 1,     //图片滚动步数
					dir: "left"   // "left" 或 "up" 向左或向上滚动
				});
			}, 
			"json");
};

getArticle_cgal("case",21,{aid:"jlb.case",start:'0',offset:'16'}, 3);

</script>
</head>
<body>
<div class="body">
<!-- 头文件 -->
<%@ include file="/jlb/include/top.jsp" %>
<p id="back-to-top"><a href="#top"><span style="background: url('./images/top.png');"></span></a></p>
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
<%@ include file="/jlb/include/roll.jsp" %>

</div>
<div id="footer">
<%@ include file="/jlb/include/foot.jsp" %>
</div>
<%@ include file="/jlb/include/cs.jsp" %>
</body>
</html>
