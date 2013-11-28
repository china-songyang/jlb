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
						{aid:"jlbhtml.foot",id:""}, 
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
			
	/* 获取页底数据 */
	getArticleList("bottom",1000,{aid:"jlb.foot",start:'0',offset:'6'}, 3);
	getArticleList("link",1000,{aid:"jlb.link",start:'0',offset:'6'}, 3);
</script>
<div class="links" id="link">
	
</div>
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
<div class="footer_text" id="bottom">
</div>
 
  