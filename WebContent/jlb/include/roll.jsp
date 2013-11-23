<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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