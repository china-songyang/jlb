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
<%@ include file="../include/include.jsp" %>
 <script type="text/javascript">
var type='<%=request.getParameter("type")%>'
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
	if(type!=null&&type!=""&&type=="search"){
		opt.aid=aid;
		$.post("<%=request.getContextPath()%>/webdo/recommend/searchArticle.do", 
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
					}else{
						$("#artlist").html("没有文章");
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
	}else if(type!=null&&type!=""&&type=="cgal"){
		$.post("<%=request.getContextPath()%>/webdo/article/articleListByPage.do", 
				opt,
				function(json){
					var str = "";
					$("#artlist").html(str);
					var num = json.rows.length;
					var aid = "";
					if(num>0){
						str+=$("#artlist").html()+"<table>";
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
							str+=$("#artlist").html()+"<td><a href=\""+url+"\"><img src="+image+" width='200' height='200'><br>"+title+"</a></td>";
						}
						str+=$("#artlist").html()+"</table>";
						$("#artlist").html(str);
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
	}else{
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
}

</script>
</head>

<body>
<div class="body">
<%@ include file="/jlb/include/top.jsp" %>
<div class="con20">
<%@ include file="/jlb/include/left.jsp" %>
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
<%@ include file="/jlb/include/cs.jsp" %>
</body>
</html>
