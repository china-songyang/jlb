
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>金兰宝科技有限公司</title>
<%@ include file="/include/include.jsp" %>
  <style type="text/css">
#scrollDiv{min-height:25px;line-height:35px;}
#scrollDiv li{height:25px;padding-left:10px;}

*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
/* scrollleft */
.scrollleft{width:920px;padding:5px 20px 0px 20px;margin:0px auto;}
.scrollleft li{float:left;margin-right:7px;display:inline;width:158px;text-align:center;line-height:19px}
.scrollleft img{width:136px;height:100px;padding:10px;border:solid 1px #ddd;}

a{color:#333;}
a:hover{color:#3366cc;text-decoration:none;}
/* marquee6 */
#marquee6{width:360px;height:135px; overflow:hidden;}
#marquee6 ul li{padding:0 10px;line-height:20px;height:20px;overflow:hidden;}
/* control */
.timescroll{float:right;}

</style>
 <script type="text/javascript">
 $(function() {
		//获得文章列表
		getArticleList("profile",450,{aid:"jlb.profile",start:'0',offset:'1'}, 1);
		getArticle_zxzx("news",14,{aid:"jlb.information ",start:'0',offset:'6'}, 2);
		getArticleList("service",18,{aid:"jlb.service",start:'0',offset:'6'}, 2);
		getArticleList("support",18,{aid:"jlb.support",start:'0',offset:'6'}, 2);
		getArticleList("download",21,{aid:"jlb.download",start:'0',offset:'6'}, 2);
		getArticle_cgal("case",21,{aid:"jlb.case",start:'0',offset:'16'}, 3);
		});
 
 /* 成功案例 插件*/
 function getArticle_cgal(divid,size,opt){
		$("#"+divid+"More").attr("href","<%=request.getContextPath()%>/jlb/list.jsp?cid="+opt.aid);
		$.post("<%=request.getContextPath()%>/webdo/article/articleListByPage.do", 
				opt, 
				function(json){
					var str = "";
					$("#"+divid).html(str);
					var num = json.rows.length;
					if(num>0){
						for(var i=0;i<num;i++) {
							var id = json.rows[i].id;
							var image = json.rows[i].image!=""?json.rows[i].image:"images/jctp_01.jpg";
							var title = size!=null&&size!=""&&json.rows[i].title.length>size?json.rows[i].title.substr(0,size)+"...":json.rows[i].title;
							var datetime = json.rows[i].createTime.substr(0,10);
							var url="<%=request.getContextPath()%>/jlb/detail.jsp?cid="+opt.aid+"&did="+id;
							str=$("#"+divid).html()+"<li><a href=\""+url+"\"><img width=\"160\" height=\"118\" alt=\""+json.rows[i].title+"\" src=\""+image+"\"/></a><span>"+title+"</span></li>";
							$("#"+divid).html(str);
						}
					}
					
					$(".scrollleft").imgscroll({
						speed: 20,    //图片滚动速度
						amount: 0,    //图片滚动过渡时间
						width: 1,     //图片滚动步数
						dir: "left"   // "left" 或 "up" 向左或向上滚动
					});
				}, 
				"json");
	};
 /* 最新资讯插件*/
 function getArticle_zxzx(divid,size,opt){
		$("#"+divid+"More").attr("href","<%=request.getContextPath()%>/jlb/list.jsp?cid="+opt.aid);
		$.post("<%=request.getContextPath()%>/webdo/article/articleListByPage.do", 
				opt, 
				function(json){
					var str = "";
					$("#"+divid).html(str);
					var num = json.rows.length;
					if(num>0){
						for(var i=0;i<num;i++) {
							var id = json.rows[i].id;
							var image = json.rows[i].image!=""?json.rows[i].image:"images/jctp_01.jpg";
							var title = size!=null&&size!=""&&json.rows[i].title.length>size?json.rows[i].title.substr(0,size)+"...":json.rows[i].title;
							var datetime = json.rows[i].createTime.substr(0,10);
							var url="<%=request.getContextPath()%>/jlb/detail.jsp?cid="+opt.aid+"&did="+id;
							str=$("#"+divid).html()+"<li><span class=\"timescroll\">"+datetime+"</span><a href=\""+url+"\">"+title+"</a></li>";
							$("#"+divid).html(str);
						}
					}
					
					$('#marquee6').kxbdSuperMarquee({
						isMarquee:true,
						isEqual:false,
						scrollDelay:30,
						controlBtn:{up:'#goUM',down:'#goDM'},
						direction:'up'
					});
				}, 
				"json");
	};
	
 </script>
</head>

<body>
<div class="body">
<%@ include file="/jlb/include/top.jsp" %>
<p id="back-to-top"><a href="#top"><span style="background: url('jlb/images/top.png');"></span></a></p>
<div class="con1">
<div class="con2">
<div id="hotpic">
        <div id="NewsPic">
            <a target="_blank" href="#" style="visibility: visible; display: block;">
                <img width="793" height="307" src="<%=request.getContextPath()%>/jlb/images/1.jpg" class="Picture" alt="测试用图片" title="第1张图片的说明文字" /></a>
            <a style="visibility: hidden; display: none;" target="_blank" href="#">
                <img class="Picture" src="<%=request.getContextPath()%>/jlb/images/2.jpg" style="width: 793px; height: 307px;" alt="测试用图片" title="第2张图片的说明文字" /></a>
            <a style="visibility: hidden; display: none;" target="_blank" href="#">
                <img class="Picture" src="<%=request.getContextPath()%>/jlb/images/3.jpg" style="width: 793px; height: 307px;" alt="测试用图片" title="第3张图片的说明文字" /></a>
            <a style="visibility: hidden; display: none;" target="_blank" href="#">
                <img class="Picture" src="<%=request.getContextPath()%>/jlb/images/4.jpg" style="width: 793px; height: 307px;" alt="测试用图片" title="第4张图片的说明文字" /></a>
            <a style="visibility: hidden; display: none;" target="_blank" href="#">
                <img width="793px" height="307px" src="<%=request.getContextPath()%>/jlb/images/5.jpg" class="Picture" alt="测试用图片" title="第5张图片的说明文字" /></a>
            <div class="Nav">
                <span class="Normal">5</span>
                <span class="Normal">4</span>
                <span class="Normal">3</span>
                <span class="Normal">2</span>
                <span class="Cur">1</span>            </div>
  </div>
</div>
    <script type="text/javascript">
        $('#hotpic').liteNav(2000);
    </script>
</div>
<div class="con3">
<h2>电脑医生到您家</h2>
<ul>
<li><h3><a href="#"></a>各大品牌笔记本<p>维修成功率高</p><p>清理技术好</p></h3><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_03.jpg" /></a></li>
<li><h3><a href="#"></a>台式电脑维修<p>上门安装系统</p><p>疑难杂症维修</p></h3><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_04.jpg" /></a></li>
<li><h3><a href="#"></a>显示器维修<p>液晶显示屏</p><p>LED屏幕维修</p></h3><a href="#"><img src="<%=request.getContextPath()%>/jlb/images/pic_05.jpg" /></a></li>
</ul>
</div>
</div>
<div class="con4">
<!-- 公司简介 -->
<div class="con5" id="profile"></div>

<div class="con6">
<p>15948321834</p>
<p>0431-81756788</p>
<p>1084809237</p>
<p>1084809237@qq.com</p>
</div>
</div>
<div class="con7">
	<!-- 最新资讯 -->
	<div class="con8" id="scrollDiv">
	<p class="xmore"><a href="#" id="newsMore"><img src="<%=request.getContextPath()%>/jlb/images/more_01.png" border="0" /></a></p>
	<!-- <ul id="news"></ul> -->
	<div id="marquee6">
		<ul id="news">
		</ul>
	</div>
	</div>
	<!-- 服务项目 -->
	<div class="con9">
	<p class="xmore"><a href="#" id="serviceMore"><img src="<%=request.getContextPath()%>/jlb/images/more_02.png" border="0" /></a></p>
		<ul id="service"></ul>
	</div>
</div>
<div class="con10">
	<!-- 技术支持 -->
	<div class="con11">
	<p class="xmore"><a href="#" id="supportMore"><img src="<%=request.getContextPath()%>/jlb/images/more_03.png" border="0" /></a></p>
	<ul id="support"></ul>
	</div>
	<!-- 软件下载 -->
	<div class="con12">
	<p class="xmore"><a href="#" id="downloadMore"><img src="<%=request.getContextPath()%>/jlb/images/more_04.png" border="0" /></a></p>
	<ul id="download"></ul>
	</div>
</div>
<div class="con13">
<!-- 成功案例 -->
<div id="demo">
	<div class="scrollleft">
		<ul id="case">
		</ul>
	</div>
</div>
</div>
</div>
<div id="footer">
<%@ include file="/jlb/include/foot.jsp" %>
</div>
<%@ include file="/jlb/include/cs.jsp" %>
</body>
</html>
