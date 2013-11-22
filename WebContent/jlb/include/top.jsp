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
							str=$("#"+divid).html()+"<a href=\""+url+"\">"+text+"</li>";
						}else {
							str=$("#"+divid).html()+"<li><a href=\""+url+"\">"+title+"</a></li>"; 
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
    

