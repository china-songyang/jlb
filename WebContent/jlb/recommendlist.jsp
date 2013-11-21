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
var opt={start:'0',offset:'25'};
$(function() {
	getRecommendListByPage("",1,0);
	});
	
function getRecommendListByPage(aid,pageNo,start){
	opt.start=start;
	//获得文章列表
	$.post("<%=request.getContextPath()%>/webdo/recommend/recommendListByPage.do", 
			opt,
			function(json){
				var str = "<tr>";
				str+= "<th align=\"center\">品牌</th>";
				str+= "<th align=\"center\">型号</th>";
				str+= "<th align=\"center\">原价</th>";
				str+= "<th align=\"center\">现价</th>";
				str+= "<th align=\"center\">厂家</th>";
				str+= "</tr>";
      
				$("#artlist").html(str);
				var num = json.rows.length;
				var aid = "";
				if(num>0){
					for(var i=0;i<num;i++) {
						var id = json.rows[i].id;
						var brand = json.rows[i].brand;
						var model = json.rows[i].model;
						var oldCost = json.rows[i].oldCost;
						var nowCost = json.rows[i].nowCost;
						var factory = json.rows[i].factory;
						var datetime = json.rows[i].createtime.substr(0,10);
						var url="<%=request.getContextPath()%>/door/recommenddetail.jsp?did="+id;
						
						str+= "<tr onclick=\"javascript:location='"+url+"';\" style=\"cursor: pointer;\">";
						str+= "<td>"+brand+"</td>";
						str+= "<td>"+model+"</td>";
						str+= "<td>"+oldCost+"</td>";
						str+= "<td>"+nowCost+"</td>";
						str+= "<td>"+factory+"</td>";
						str+= "</tr>";
                    
					}
				}
				$("#artlist").html(str);
				var totle = json.total;
				//分页
				$("#pagemenu").pageMenuBar({
					rowPerPage:parseInt(opt.offset),
					sumRow:parseInt(totle), 
					pageNo:parseInt(pageNo),
					state:1,
					func:'getRecommendListByPage',
					args:'""'
				});
			}, 
			"json");
}
</script>
</head>
<body>
<p id="back-to-top"><a href="#top"><span style="background: url('images/top.png');"></span></a></p>
<a name="top"></a>
<div id="container">
	<%@ include file="include/top.jsp" %>
  	<div id="contant">
    	<%@ include file="include/left.jsp" %>
        <div class="right">
        	<div class="rtnr">
           	  <div class="xpmmt">
        	<div class="xpmmtt">
            	<h1 id="topmenu"></h1>
                <span>您所在的位置：<a href="index.jsp">首页</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="./recommendlist.jsp">推荐木门</a></span>
            </div>
            <div class="ll">
            	<div class="lanmu" valign="top">
            	<table id="artlist" width="95%" border="0" cellspacing="0" cellpadding="0" class="tjmumenxq">
    </table>
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
