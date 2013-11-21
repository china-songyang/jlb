<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<title>文章列表</title>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var text = '<%=request.getParameter("textfield")%>';
var type = '<%=request.getParameter("type")%>';
var opt={type:type,text:text,start:'0',offset:'25'};
$(function() {
	getArticleListByPage(null,1,0);
	});
	

function getArticleListByPage(type,pageNo,start){
	opt.start=start;
	//获得文章列表
	$.post("<%=request.getContextPath()%>/webdo/article/searchlist.do", 
			opt,
			function(json){
				var str = "";
				$("#artlist").html(str);
				var num = json.rows.length;
				if(num>0){
					for(var i=0;i<num;i++) {
						var id = json.rows[i].id;
						var image = json.rows[i].image;
						var title = json.rows[i].title;
						var datetime = json.rows[i].createTime.substr(0,10);
						var url="<%=request.getContextPath()%>/door/detail.jsp?did="+id;
						str=$("#artlist").html()+"<div class=\"news\">";
						str+="<div class=\"newsa\"><img src=\"images/iecool_arrow_008.gif\" width=\"14\" height=\"15\" /></div>";
						str+="<div class=\"newsb\"><a href=\""+url+"\">"+title+"</a></div>";
						str+="<div class=\"newsc\">["+datetime+"]</div>";
						str+="</div>";
                    
						$("#artlist").html(str);
					}
				}
				var totle = json.totle;
				
				//分页
				$("#pagemenu").pageMenuBar({
					rowPerPage:parseInt(opt.offset),
					sumRow:15, 
					pageNo:parseInt(pageNo),
					state:1,
					func:'getArticleListByPage',
					args:'"1"'
				});
			}, 
			"json");
}
</script>
</head>
<body>
<div id="container">
	<%@ include file="include/top.jsp" %>
  	<div id="contant">
    	<%@ include file="include/left.jsp" %>
        <div class="right">
        	<div class="rtnr">
           	  <div class="xpmmt">
        	<div class="xpmmtt">
            	<h1 id="topmenu">搜索</h1>
                <span>您所在的位置：<a href="index.jsp">首页</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a id="topmenu_z" href="javascript:void(0);">搜索</a></span>
            </div>
            <div class="xpmmz ll">
            	<div id="artlist" class="lanmu">
            	
                 </div>
                 <div id="pagemenu" class="lanmua"></div>
                 <div class="clear"></div>
            </div>
            <div class="xpmmx"><img src="images/xpmm_x.jpg" width="719" height="4" /></div>
        </div>
            
            </div>
        </div><!--右侧-->
    </div><!--内容区-->
 <%@ include file="include/foot.jsp" %>
</div><!--容器-->
</body>
</html>
