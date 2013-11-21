package com.saturn.action.website.recommend;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.website.Recommend;

public class UpdateRecommendAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		Recommend vo = BeanUtils.getBean(request, Recommend.class);
		if(Recommend.edit(vo) == 1) {
			return new JspView("/app/website/recommend/show.jsp");
		}
		return new JspErrorView("修改失败");
	}
	@Override
	public String requestMapping() {
		return "/app/website/recommend/updateRecommend.action";
	}
}
