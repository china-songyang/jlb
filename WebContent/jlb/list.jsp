<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.Article"%>
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
 <script type="text/javascript" src="<%=request.getContextPath()%>/jlb/js/pageMenuBar.js"></script>
 <script type="text/javascript">
var cid = '<%=request.getParameter("cid")%>';
var did = '<%=request.getParameter("did")%>';
var opt={aid:cid,start:'0',offset:'25'};
$(function() {
	getArticleListByPage(cid,1,0);
	getMenuTitle(cid);
	});
	
<%-- function getMenuTitle(cid){
	//获得菜单标题
	$.post("<%=request.getContextPath()%>/webdo/menu/menubycid.do", 
			{cid:cid}, 
			function(json){
				$("#topmenu").html(json.name);
				$("#topmenu_z").html(json.name);
			}, 
			"json");
}
 --%>
function getArticleListByPage(aid,pageNo,start){
	opt.start=start;
	//获得文章列表
	$.post("<%=request.getContextPath()%>/webdo/article/articleListByPage.do", 
			opt,
			function(json){
				var str = "";
				$("#artlist").html(str);
				var num = json.rows.length;
				var aid = "";
				if(num>0){
					for(var i=0;i<num;i++) {
						var id = json.rows[i].id;
						var image = json.rows[i].image;
						var title = json.rows[i].title;
						var datetime = json.rows[i].createTime.substr(0,10);
						var url="<%=request.getContextPath()%>/jlb/detail.jsp?cid="+cid+"&did="+id;
						//aid 赋值
						if (did == null||did==""||did=="null") {
							//aid = "ccgdzs.new01.n1";
							did = id;
						}
						str=$("#artlist").html()+"<li><a href=\""+url+"\">"+title+"</a><span style=\"float:right;margin-right:20px;\">"+datetime+"</span></li>";
                    
						$("#artlist").html(str);
					}
				}
				var totle = json.total;
				//分页
				$("#pagemenu").pageMenuBar({
					rowPerPage:parseInt(opt.offset),
					sumRow:parseInt(totle), 
					pageNo:parseInt(pageNo),
					state:1,
					func:'getArticleListByPage',
					args:'"'+cid+'"'
				});
			}, 
			"json");
}
</script>
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
           	  <ul id="artlist"> </ul>
           	  <p><span id="pagemenu"></span></p>
            </div>
            <div class="con22_bottom"></div>
        </div><!--右侧-->
</div>
<%-- <%@ include file="/jlb/include/roll.jsp" %> --%>

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
