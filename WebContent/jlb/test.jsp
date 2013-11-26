<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>js图片左右无缝滚动带鼠标感应效果</title>
<meta name="description" content="js图片滚动制作图片左右无缝滚动效果，通过鼠标感应控制图片左右无缝滚动。js代码。" />
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
table{empty-cells:show;border-collapse:collapse;border-spacing:0;}
.titbox{font-size:18px;color:#3366cc;height:32px;overflow:hidden;width:880px;margin:20px auto;}
.scroll{width:880px;color:#333333;margin:0 auto;overflow:hidden;}
.scroll img{border:solid 1px #ddd;margin:0 5px;}
.scroll a:hover img{border:solid 1px #990000;}
</style>
</head>

<body>


<script type="text/javascript">

var dir=1;//每步移动像素，大＝快
var speed=10;//循环周期（毫秒）大＝慢
var MyMar=null;

function Marquee(){//正常移动
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


	
	<h2 class="titbox">鼠标放置 容器的左侧或右侧 可以控制图片滚动方向哦</h2>
	
	<div class="scroll" id="scrollbox" onMouseMove="MoveDiv(event);" onMouseOut="MoveOutDiv();">
		<div id="scrollcon" style="width:100%;">
			<table>
				<tbody>
					<tr>
						<td valign="top">							
							<table width="100%">
								<tr>
									<td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="js文字切换特效制作焦点文字带滤镜切换效果" src="images/1.jpg" /></a><br>sdfsdf</td>
									<td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="js文字特效制作js文字闪烁与文字变色效果" src="images/2.jpg" /></a><br>sdfsdf</td>
									<td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="js文字滚动插件制作双行关联向上文字间隙滚动" src="images/3.jpg" /></a><br>sdfsdf</td>
									<td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="js树形导航菜单制作垂直js导航条特效" src="images/4.jpg" /></a><br>sdfsdf</td>
									<td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="js导航菜单左侧竖纵向二级导航菜单可点击展开与收缩子菜单" src="images/5.jpg" /></a></td>
									<td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="flash导航条制作二级菜单子菜单的flash导航条源码" src="images/6.jpg" /></a></td>
									<td><a href="http://www.17sucai.com/" target="_blank"><img height="150" width="150" alt="flash导航条制作一个鼠标滑过动画特效flash导航条源码下载" src="images/1.jpg" /></a></td>
								</tr>
							</table>
						</td>
						<td><div id="scrollcopy" style="width:100%;"></div></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

<script type="text/javascript">
 document.getElementById("scrollcopy").innerHTML = document.getElementById("scrollcon").innerHTML;
 MyMar=setInterval(Marquee,speed);
</script>

</body>
</html>