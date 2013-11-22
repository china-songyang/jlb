<%@page import="com.saturn.website.Article"%>
<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Content"%>
<%@page import="com.saturn.website.CountPerson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    long count = CountPerson.replaceCount(request.getRealPath("/")+"count.txt");
   if(session.getAttribute("CHEN_CHAO")==null){
    session.setAttribute("CHEN_CHAO","123");
    session.setMaxInactiveInterval(60*60*24);
   count = count+1;
   CountPerson.saveCount(request.getRealPath("/")+"count.txt",count);
}
 %>
<script type="text/javascript">
			$(function() {
				//按获得文章
				$.post("<%=request.getContextPath()%>/webdo/article/onearticle.do", 
						{aid:"doorhtml.foot",id:""}, 
						function(json){
							var id = json.id;
							var titlez = json.title;
							var text = json.text;
							if(text==null||text.Trim()=="")
								$("#bq").html("");
							else
								$("#bq").html(text);
						}, 
						"json");
			});

			function toIndex(){
			//返回首页
				location="./index.jsp";
			}
			
			function toNew(){
			//跳转到新闻页
				location="./newlist.jsp?cid=ccgdzs.newlist";
			}
</script>
<div class="links">
<a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_20.jpg" border="0" /></a><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_20.jpg" border="0" /></a><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_20.jpg" border="0" /></a><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_20.jpg" border="0" /></a><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_20.jpg" border="0" /></a><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_20.jpg" border="0" /></a><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_20.jpg" border="0" /></a></div>
<div class="footer">
<ul>
<li><img src="<%=request.getContextPath()%>/jlb/images/bottom_01.png" /></li>
<li><img src="<%=request.getContextPath()%>/jlb/images/bottom_02.png" /></li>
<li><img src="<%=request.getContextPath()%>/jlb/images/bottom_03.png" /></li>
<li><img src="<%=request.getContextPath()%>/jlb/images/bottom_04.png" /></li>
<li><img src="<%=request.getContextPath()%>/jlb/images/bottom_05.png" /></li>
<li><img src="<%=request.getContextPath()%>/jlb/images/bottom_06.png" /></li>
</ul>
</div>
<div class="footer_text">
<p>Copyright (R)2013-2016 All rights reserved </p>
<p>长春市金兰宝科技有限责任公司 http://www.ccjlbkj.com | 0431-81756788  81756781</p>
<p>蜀ICP备09004450 网站总访问数：25971436人次</p>
</div>
 
  