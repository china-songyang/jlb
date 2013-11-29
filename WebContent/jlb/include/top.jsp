<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Content"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
function getArticleList(divid,size,opt,type){
	$("#"+divid+"More").attr("href","<%=request.getContextPath()%>/jlb/list.jsp?cid="+opt.aid);
	//获得文章列表

	$.post("<%=request.getContextPath()%>/webdo/article/articleListByPage.do", 
			opt, 
			
			function(json){
				var str = "";
				$("#"+divid).html(str);
				var num = json.rows.length;
				var aid = "";
				if(num>0){
					for(var i=0;i<num;i++) { 
						var id = json.rows[i].id;
						var image = json.rows[i].image;
						var title = size!=null&&size!=""&&json.rows[i].title.length>size?json.rows[i].title.substr(0,size)+"...":json.rows[i].title;
						var text = size!=null&&size!=""&&json.rows[i].text.length>size?json.rows[i].text.substr(0,size)+"...":json.rows[i].text;
						var datetime = json.rows[i].createTime.substr(0,10);
						var url="<%=request.getContextPath()%>/jlb/detail.jsp?cid="+opt.aid+"&did="+id;
						if(type == 1){
							str=$("#"+divid).html()+"<li><a href=\""+url+"\">"+text+"</li>";
						}else if(type == 2){
							str=$("#"+divid).html()+"<li><a href=\""+url+"\">"+title+"</a></li>"; 
						} else{
							str=$("#"+divid).html()+"<a href=\""+url+"\">"+text+""; 
						}
						$("#"+divid).html(str);
					}
				}
			}, 
			"json");
}
</script>

<div class="top">
<div class="logo"></div>
<form action="<%=request.getContextPath()%>/jlb/list.jsp" method="post">
<div class="search">搜索
  <input type="text" class="input" name="cid" />
  <input type="hidden" value="search" name="type" />
  <input name="" type="submit" class="button" id="GO" value="GO"  />
</div>
 </form>
</div>
<div class="nav2">
<ul>
<li><a href="<%=request.getContextPath()%>/index.jsp" id="aa">首页</a></li>
<li><a href="<%=request.getContextPath()%>/jlb/detail.jsp?cid=jlb.profile&did=588" id="b">公司概况</a></li>
<li><a href="<%=request.getContextPath()%>/jlb/list.jsp?cid=jlb.information" id="c">最新资讯</a></li>
<li><a href="<%=request.getContextPath()%>/jlb/list.jsp?cid=jlb.service" id="d">服务项目</a></li>
<li><a href="<%=request.getContextPath()%>/jlb/list.jsp?cid=jlb.case&type=cgal" id="e">成功案例</a></li>
<li><a href="<%=request.getContextPath()%>/jlb/list.jsp?cid=jlb.support" id="f">技术支持</a></li>
<li><a href="<%=request.getContextPath()%>/jlb/list.jsp?cid=jlb.download" id="g">软件下载</a></li>
<li><a href="<%=request.getContextPath()%>/jlb/message.jsp" id="h">在线留言</a></li>
<li><a href="<%=request.getContextPath()%>/jlb/detail.jsp?cid=jlb.contact&did=589" id="i">联系我们</a></li>
</ul>
</div>
    

