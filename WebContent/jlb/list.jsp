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
 <link href="<%=request.getContextPath()%>/jlb/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="body">
<%@ include file="/jlb/include/top.jsp" %>
<div class="con20">
<div class="con21">
<ul>
<li><h2><a href="fwxm.html" id="link_text">服务项目</a></h2>
<h3>Services</h3></li>
<li><h2><a href="jszc.html">技术支持</a></h2>
<h3>Technical Support</h3></li>
<li><h2><a href="rjxz.html">软件下载</a></h2>
<h3>Software Downloads</h3></li>
<li><h2><a href="lxfs.html">联系方式</a></h2>
<h3>Contact</h3></li>
</ul>
</div>
<div class="con22">
<div class="con22_top"></div>
<div class="con22_main">
<ul>
<li><a href="fwxm_xx.html">服务项目列表</a></li>
<li><a href="#">服务项目列表</a></li>
<li><a href="#">服务项目列表</a></li>
<li><a href="#">服务项目列表</a></li>
<li><a href="#">服务项目列表</a></li>
<li><a href="#">服务项目列表</a></li>
<li><a href="#">服务项目列表</a></li>
<li><a href="#">服务项目列表</a></li>
<li><a href="#">服务项目列表</a></li>
<li><a href="#">服务项目列表</a></li>
</ul>
<p><span>[<a href="#" id="span_text">1</a>]</span><span>[<a href="#">2</a>]</span><span>[<a href="#">3</a>]</span><span>[<a href="#">4</a>]</span><span>[<a href="#">5</a>]</span><span><a href="#">下一页</a></span><span><a href="#">末页</a></span><span>共5页</span></p>
</div>
<div class="con22_bottom"></div>
</div>
</div>
<div class="con13">
<div id="demo">
	<div id="indemo">
	<div id="demo1">
		<ul>
			<li><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_13.jpg" width="148" height="108" /></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_14.jpg" width="147" height="109" /></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_15.jpg" width="148" height="109" /></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_16.jpg" width="148" height="109" /></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_17.jpg" width="148" height="109" /></a></li>
		</ul>
	</div>
	<div id="demo2">
		<ul>
			<li><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_13.jpg" width="148" height="108" /></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_15.jpg" width="148" height="109" /></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_16.jpg" width="148" height="109" /></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_17.jpg" width="148" height="109" /></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_13.jpg" width="148" height="108" /></a></li>
		</ul>
	</div>
	</div>
</div>
<script>
<!--
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
-->
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

<script>
//初始位置
gID("KeFuDiv").style.top = (document.documentElement.clientHeight - gID("KeFuDiv").offsetHeight)/2 +"px";
gID("KeFuDiv").style.left = document.documentElement.clientWidth - gID("KeFuDiv").offsetWidth +"px";
//开始滚动
ScrollDiv('KeFuDiv');
</script>
</body>
</html>
