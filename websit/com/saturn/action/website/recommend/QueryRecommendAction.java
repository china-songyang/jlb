package com.saturn.action.website.recommend;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.website.Recommend;

public class QueryRecommendAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		Recommend recommend = Recommend.get(id);
		request.setAttribute("recommend", recommend);
		return new JspView("/app/website/recommend/edit.jsp");
	}
	
	@Override
	public String requestMapping() {
		return "/app/website/recommend/queryRecommend.action";
	}
}
