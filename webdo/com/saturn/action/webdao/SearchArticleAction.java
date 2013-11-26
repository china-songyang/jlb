package com.saturn.action.webdao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.JSONUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.website.Article;

public class SearchArticleAction implements IAction{

	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String aid = request.getParameter("aid");
		System.out.println("aid:"+aid);
		String start = request.getParameter("start");
		String offset = request.getParameter("offset");
		ListData<Article> data = Article.getByTitle(aid, start, offset);
		System.out.println(data);
		return new JsonView(JSONUtils.getDataGridJSON(data.getTotal(),
				data.getList()));
	}

	@Override
	public String requestMapping() {
		return "/webdo/recommend/searchArticle.do";
	}

}
