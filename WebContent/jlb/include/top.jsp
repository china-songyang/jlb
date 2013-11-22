<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Content"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
			$(function() {
				//获得菜单
				$.post("<%=request.getContextPath()%>/webdo/menu/menulist.do", 
						{rootcid:"door"}, 
						function(json){
							var str = "";
							var num = json.length;
							if(num>0){
								for(var i=0;i<num;i++) {
									
									var id = json[i].id;
									var url = json[i].path;
									var title = json[i].name;
									if(url!=null&&url.Trim()!="default"&&url.Trim()!=""){
										if(url.Trim().indexOf("http://")<0){
											if(url.Trim().indexOf("?")<0){
												url="<%=request.getContextPath()%>/door/"+url.Trim()+"?cid="+id;
											}else{
												if(url.Trim().indexOf("cid")<0){
													url="<%=request.getContextPath()%>/door/"+url.Trim()+"&cid="+id;
												}else{
													url="<%=request.getContextPath()%>/door/"+url.Trim();
												}
											}
										}else{
											url=url.Trim();
										}
									}else{
										url="javascript:void(0);";
									}
									var __id = "<%= request.getParameter("cid")%>";
									if (__id == null) {
										__id = id;
									}
									if (__id==id) {
										str=$("#menulist").html()+"<li><a href=\""+url+"\" style=\"color:#f0d065\">"+title+"</a></li>";
									}else{
										str=$("#menulist").html()+"<li><a href=\""+url+"\">"+title+"</a></li>";
									}
									
									$("#menulist").html(str);
								}
							}
						}, 
						"json");
			});
</script>
<script type="text/javascript">
function getArticleList(divid,size,opt){
	$("#"+divid+"More").attr("href","<%=request.getContextPath()%>/door/list.jsp?cid="+opt.aid);
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
						var datetime = json.rows[i].createTime.substr(0,10);
						var url="<%=request.getContextPath()%>/door/detail.jsp?cid="+opt.aid+"&did="+id;
						str=$("#"+divid).html()+"<li><a href=\""+url+"\">·"+title+"</a></li>";
						$("#"+divid).html(str);
					}
				}
			}, 
			"json");
}
</script>

<div class="top">
<div class="logo"></div>
<div class="search">搜索
  <input type="text" class="input"name="textfield" />
  <input name="" type="button" class="button" id="GO" value="GO" />
</div>
</div>
<div class="nav2">
<ul>
<li><a href="#" id="aa">首页</a></li>
<li><a href="#" id="b">公司概况</a></li>
<li><a href="#" id="c">最新资讯</a></li>
<li><a href="#" id="d">服务项目</a></li>
<li><a href="#" id="e">成功案例</a></li>
<li><a href="#" id="f">技术支持</a></li>
<li><a href="#" id="g">软件下载</a></li>
<li><a href="#" id="h">在线留言</a></li>
<li><a href="#" id="i">联系我们</a></li>
</ul>
</div>
    

