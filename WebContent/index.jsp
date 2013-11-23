
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>金兰宝科技有限公司</title>
 <script src="<%=request.getContextPath()%>/jlb/js/jquery-1.9.1.min.js" type="text/javascript"></script>
 <script src="<%=request.getContextPath()%>/jlb/js/jquery.litenav.js" type="text/javascript"></script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/jlb/js/lrtk.js"></script>
 <link href="<%=request.getContextPath()%>/jlb/css/index.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript">
 $(function() {
		//获得文章列表
		getArticleList("profile",450,{aid:"jlb.profile",start:'0',offset:'1'}, 1);
		
		getArticleList("news",16,{aid:"jlb.information ",start:'0',offset:'6'}, 2);
		getArticleList("service",18,{aid:"jlb.service",start:'0',offset:'6'}, 2);
		getArticleList("support",18,{aid:"jlb.support",start:'0',offset:'6'}, 2);
		getArticleList("download",21,{aid:"jlb.download",start:'0',offset:'6'}, 2);
		getArticleList("case1",21,{aid:"jlb.case",start:'0',offset:'6'}, 3);
		getArticleList("case2",21,{aid:"jlb.case",start:'6',offset:'12'}, 3);
		});
 </script>
</head>

<body>
<div class="body">
<%@ include file="/jlb/include/top.jsp" %>
<div class="con1">
<div class="con2">
<div id="hotpic">
        <div id="NewsPic">
            <a target="_blank" href="#" style="visibility: visible; display: block;">
                <img width="793" height="307" src="<%=request.getContextPath()%>/jlb/images/1.jpg" class="Picture" alt="测试用图片" title="第1张图片的说明文字" /></a>
            <a style="visibility: hidden; display: none;" target="_blank" href="#">
                <img class="Picture" src="<%=request.getContextPath()%>/jlb/images/2.jpg" style="width: 793px; height: 307px;" alt="测试用图片" title="第2张图片的说明文字" /></a>
            <a style="visibility: hidden; display: none;" target="_blank" href="#">
                <img class="Picture" src="<%=request.getContextPath()%>/jlb/images/3.jpg" style="width: 793px; height: 307px;" alt="测试用图片" title="第3张图片的说明文字" /></a>
            <a style="visibility: hidden; display: none;" target="_blank" href="#">
                <img class="Picture" src="<%=request.getContextPath()%>/jlb/images/4.jpg" style="width: 793px; height: 307px;" alt="测试用图片" title="第4张图片的说明文字" /></a>
            <a style="visibility: hidden; display: none;" target="_blank" href="#">
                <img width="793px" height="307px" src="<%=request.getContextPath()%>/jlb/images/5.jpg" class="Picture" alt="测试用图片" title="第5张图片的说明文字" /></a>
            <div class="Nav">
                <span class="Normal">5</span>
                <span class="Normal">4</span>
                <span class="Normal">3</span>
                <span class="Normal">2</span>
                <span class="Cur">1</span>            </div>
  </div>
</div>
    <script type="text/javascript">
        $('#hotpic').liteNav(2000);
    </script>
</div>
<div class="con3">
<h2>电脑医生到您家</h2>
<ul>
<li><h3><a href="#">各大品牌笔记本</a><p>维修成功率高</p><p>清理技术好</p></h3><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_03.jpg" /></a></li>
<li><h3><a href="#">台式电脑维修</a><p>上门安装系统</p><p>疑难杂症维修</p></h3><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_04.jpg" /></a></li>
<li><h3><a href="#">显示器维修</a><p>液晶显示屏</p><p>LED屏幕维修</p></h3><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_05.jpg" /></a></li>
</ul>
</div>
</div>
<div class="con4">
<!-- 公司简介 -->
<div class="con5" id="profile"></div>

<div class="con6">
<p>15948321834</p>
<p>0431-81756788</p>
<p>1084809237</p>
<p>1084809237@qq.com</p>
</div>
</div>
<div class="con7">
	<!-- 最新资讯 -->
	<div class="con8">
	<p class="xmore"><a href="#" id="newsMore">更多</a></p>
	<div class="con8_02" ><ul id="news"></ul>
	</div>
	</div>
	<!-- 服务项目 -->
	<div class="con9">
	<p class="xmore"><a href="#" id="serviceMore"><img src="<%=request.getContextPath()%>/jlb/images/more_02.png" border="0" /></a></p>
		<ul id="service"></ul>
	</div>
</div>
<div class="con10">
	<!-- 技术支持 -->
	<div class="con11">
	<p class="xmore"><a href="#" id="supportMore"><img src="<%=request.getContextPath()%>/jlb/images/more_03.png" border="0" /></a></p>
	<ul id="support"></ul>
	</div>
	<!-- 软件下载 -->
	<div class="con12">
	<p class="xmore"><a href="#" id="downloadMore"><img src="<%=request.getContextPath()%>/jlb/images/more_04.png" border="0" /></a></p>
	<ul id="download"></ul>
	</div>
</div>
<div class="con13">

<div id="demo">
	<div id="indemo">
	<div id="demo1">
		<ul id="case1">
		</ul>
	</div>
	<div id="demo2">
		<ul id="case2">
		</ul>
	</div>
	</div>
</div>
<script>

var speed=10;
var tab=document.getElementById("demo");
var tab1=document.getElementById("demo1");
var tab2=document.getElementById("demo2");
tab2.innerHTML=tab1.innerHTML;
function Marquee(){
if(tab2.offsetWidth-tab.scrollLeft<=0)
tab.scrollLeft-=tab1.offsetWidth
else{
tab.scrollLeft++;
}
}
var MyMar=setInterval(Marquee,speed);
tab.onmouseover=function() {clearInterval(MyMar)};
tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)};

</script>				
</div>

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

<script type="text/javascript">
 //初始位置
gID("KeFuDiv").style.top = (document.documentElement.clientHeight - gID("KeFuDiv").offsetHeight)/2 +"px";
gID("KeFuDiv").style.left = document.documentElement.clientWidth - gID("KeFuDiv").offsetWidth +"px";
//开始滚动
 ScrollDiv('KeFuDiv');  
</script>
</body>
</html>
