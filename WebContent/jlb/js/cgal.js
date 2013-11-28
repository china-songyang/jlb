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