package com.saturn.action.webdao;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.website.Recommend;

public class RecommendAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		//-------
		String id = request.getParameter("id");
		Recommend recommend = Recommend.get(id);
		JSONObject jobj = new JSONObject();
		if (recommend != null) {
			jobj = new JSONObject(recommend);
		}
		return new JsonView(jobj.toString());
	}

	public String requestMapping() {
		return "/webdo/recommend/onerecommend.do";
	}

}
