
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>金兰宝科技有限公司</title>
<%@ include file="/include/include.jsp" %>
 <script type="text/javascript">
 $(function() {
		//获得文章列表
		getArticleList("profile",450,{aid:"jlb.profile",start:'0',offset:'1'}, 1);
		getArticleList("news",16,{aid:"jlb.information ",start:'0',offset:'6'}, 2);
		getArticleList("service",18,{aid:"jlb.service",start:'0',offset:'6'}, 2);
		getArticleList("support",18,{aid:"jlb.support",start:'0',offset:'6'}, 2);
		getArticleList("download",21,{aid:"jlb.download",start:'0',offset:'6'}, 2);
		getArticleList("case",21,{aid:"jlb.case",start:'0',offset:'16'}, 3);
		});
 </script>
 
 <!-- 最新资讯滚动 -->
 <script type="text/javascript">
 function AutoScroll(obj){
		$(obj).find("ul:first").animate({
			marginTop:"-19px"
		},500,function(){
			$(this).css({marginTop:"0px"}).find("li:first").appendTo(this);
		});
	}
	$(document).ready(function(){
		setInterval('AutoScroll("#scrollDiv")',2000);
	});
</script>
<script type="text/javascript">

var dir=1;//每步移动像素，大＝快
var speed=10;//循环周期（毫秒）大＝慢
var MyMar=null;

window.reload = function Marquee(){//正常移动
	var scrollbox = document.getElementById("scrollbox");
	var scrollcopy = document.getElementById("scrollcopy");
	if(dir>0&&(scrollcopy.offsetWidth-scrollbox.scrollLeft)<=0){
		scrollbox.scrollLeft=0;
	}
	if(dir<0 &&(scrollbox.scrollLeft<=0)){
		scrollbox.scrollLeft=scrollcopy.offsetWidth;
	}
		scrollbox.scrollLeft+=dir;
}

function onmouseoverMy(){
	window.clearInterval(MyMar);
}//暂停移动

function onmouseoutMy() {
	MyMar=setInterval(Marquee,speed);
}//继续移动

function r_left(){
	if(dir==-1)
	dir=1;
}//换向左移

function r_right(){
	if(dir==1)
	dir=-1;
}//换向右移

function IsIE(){
	var browser=navigator.appName
	if((browser=="Netscape")){
		return false;
	}
	else if(browser=="Microsoft Internet Explorer"){
		return true;
	}else{
		return null;
	}
}

var _IsIE = IsIE();
var _MousePX = 0;
var _MousePY = 0;
var _DivLeft = 0;
var _DivRight = 0;
var _AllDivWidth = 0;
var _AllDivHeight = 0;

function MoveDiv(e){

	var obj = document.getElementById("scrollbox");
	_MousePX = _IsIE ? (document.body.scrollLeft + event.clientX) : e.pageX;
	_MousePY = _IsIE ? (document.body.scrollTop + event.clientY) : e.pageY;
	//Opera Browser Can Support ''window.event'' and ''e.pageX''
	
	var obj1 = null;

	if(obj.getBoundingClientRect){
		//IE
		obj1 = document.getElementById("scrollbox").getBoundingClientRect();
		_DivLeft = obj1.left;
		_DivRight = obj1.right;
		_AllDivWidth = _DivRight - _DivLeft;
	}else if(document.getBoxObjectFor){
		//FireFox
		obj1 = document.getBoxObjectFor(obj); 
		var borderwidth = (obj.style.borderLeftWidth != null && obj.style.borderLeftWidth != "") ? parseInt(obj.style.borderLeftWidth) : 0;
		_DivLeft = parseInt(obj1.x) - parseInt(borderwidth);
		_AllDivWidth = Cut_Px(obj.style.width);
		_DivRight = _DivLeft + _AllDivWidth;
	}else{
		//Other Browser(Opera)
		_DivLeft = obj.offsetLeft;
		_AllDivWidth = Cut_Px(obj.style.width);
		var parent = obj.offsetParent;
		
		if(parent != obj){
			while (parent){  
				_DivLeft += parent.offsetLeft; 
				parent = parent.offsetParent;
			}
		}
		_DivRight = _DivLeft + _AllDivWidth;
	}

	var pos1,pos2;
	pos1 = parseInt(_AllDivWidth * 0.4) + _DivLeft;
	pos2 = parseInt(_AllDivWidth * 0.6) + _DivLeft;

	if(_MousePX > _DivLeft && _MousePX < _DivRight){
		if(_MousePX > _DivLeft && _MousePX < pos1){
			r_left(); //Move left
		}
		else if(_MousePX < _DivRight && _MousePX > pos2){
			r_right(); //Move right
		}
		if(_MousePX > pos1 && _MousePX < pos2){
			onmouseoverMy(); //Stop
			MyMar=null;
		}else if(_MousePX < pos1 || _MousePX > pos2){
			if(MyMar==null){
				MyMar=setInterval(Marquee,speed);
			}
		}
	}
}

function Cut_Px(cswidth){
	cswidth = cswidth.toLowerCase();
	if(cswidth.indexOf("px") != -1){
		cswidth.replace("px","");
		cswidth = parseInt(cswidth);
	}
	return cswidth;
}

function MoveOutDiv(){
	if(MyMar == null){
		MyMar=setInterval(Marquee,speed);
	}
}
</script>
<style type="text/css">
#scrollDiv{min-height:25px;line-height:35px;}
#scrollDiv li{height:25px;padding-left:10px;}

*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
table{empty-cells:show;border-collapse:collapse;border-spacing:0;}
.titbox{font-size:18px;color:#3366cc;height:32px;overflow:hidden;width:880px;margin:20px auto;}
.scroll{width:960px;color:#333333;margin:0 auto;overflow:hidden;}
.scroll img{border:solid 1px #ddd;margin:0 5px;}
.scroll a:hover img{border:solid 1px #990000;}
</style>
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
	<div class="con8" id="scrollDiv">
	<p class="xmore"><a href="#" id="newsMore"><img src="<%=request.getContextPath()%>/jlb/images/more_01.png" border="0" /></a></p>
	<ul id="news"></ul>
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
	<!-- <div id="demo1">
		 <ul id="case1">
		</ul>
	</div>
	<div id="demo2">
		<ul id="case1">
		</ul>
	</div> -->
	<div class="scroll" id="scrollbox" onMouseMove="MoveDiv(event);" onMouseOut="MoveOutDiv();">
		<div id="scrollcon" style="width:100%;">
			<table>
				<tbody>
					<tr>
						<td valign="top">							
							<table width="100%">
								<tr id="case">
									<%-- <td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="" src="<%=request.getContextPath()%>/jlb/images/1.jpg" /></a><br>sdfsdf</td>
									<td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="" src="<%=request.getContextPath()%>/jlb/images/2.jpg" /></a><br>sdfsdf</td>
									<td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="" src="<%=request.getContextPath()%>/jlb/images/3.jpg" /></a><br>sdfsdf</td>
									<td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="" src="<%=request.getContextPath()%>/jlb/images/4.jpg" /></a><br>sdfsdf</td>
									<td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="" src="<%=request.getContextPath()%>/jlb/images/5.jpg" /></a><br>sdfsdf</td>
									<td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="" src="<%=request.getContextPath()%>/jlb/images/2.jpg" /></a><br>sdfsdf</td>
									<td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="" src="<%=request.getContextPath()%>/jlb/images/1.jpg" /></a><br>sdfsdf</td> --%>
								</tr>
							</table>
						</td>
						<td><div id="scrollcopy" style="width:100%;"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
</div>
</div>
<script type="text/javascript">
 document.getElementById("scrollcopy").innerHTML = document.getElementById("scrollcon").innerHTML;
 MyMar=setInterval(Marquee,speed);
</script>		
</div>

</div>
<div id="footer">
<%@ include file="/jlb/include/foot.jsp" %>
</div>
<%@ include file="/jlb/include/cs.jsp" %>
</body>
</html>
