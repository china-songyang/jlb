package com.saturn.action.website.recommend;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.website.Recommend;

public class DeteleRecommendAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String idStr = request.getParameter("ids");
		String[] ids = idStr.split("__");
		Recommend.removes(ids);
		return new JspView("/app/website/recommend/show.jsp");
	}
	@Override
	public String requestMapping() {
		return "/app/website/recommend/deleteRecommend.action";
	}
}
