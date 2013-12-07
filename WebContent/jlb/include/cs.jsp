<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="KeFuDiv" class="KeFuDiv">
  <div><img src="<%=request.getContextPath()%>/jlb/images/up_001.gif" width="105" border="0" usemap="#Map" style="cursor:move;" title="拖动" onmousedown="MoveDiv(KeFuDiv,event);"></div>
    <div class="KeFuTitle"><a href="#" onclick="javascript:window.open('http://wpa.qq.com/msgrd?V=1&Uin=1305457111');"><img src="<%=request.getContextPath()%>/jlb/images/list_001.gif" /></a></div>
    <div class="KeFuTitle"><a href="#" onclick="javascript:window.open('http://wpa.qq.com/msgrd?V=1&Uin=1305457111');"><img src="<%=request.getContextPath()%>/jlb/images/list_003.gif" /></a></div>  
     <div class="KeFuTitle"><a href="#" onclick="javascript:window.open('http://wpa.qq.com/msgrd?V=1&Uin=1305457111');"><img src="<%=request.getContextPath()%>/jlb/images/list_002.gif" /></a></div>
<div class="div_img"><img src="<%=request.getContextPath()%>/jlb/images/bot_001.gif" border="0"></div>
</div>
<script>
//初始位置
gID("KeFuDiv").style.top = (document.documentElement.clientHeight - gID("KeFuDiv").offsetHeight)/2 +"px";
gID("KeFuDiv").style.right = document.documentElement.clientWidth - gID("KeFuDiv").offsetWidth +"px";
//开始滚动
ScrollDiv('KeFuDiv');
</script>