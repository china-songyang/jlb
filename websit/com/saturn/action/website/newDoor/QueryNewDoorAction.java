package com.saturn.action.website.newDoor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.website.NewDoor;

public class QueryNewDoorAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		
		NewDoor newDoor = NewDoor.get(id);
		request.setAttribute("newDoor", newDoor);
		return new JspView("/app/website/newDoor/edit.jsp");
	}
	
	@Override
	public String requestMapping() {
		return "/app/website/newDoor/query.action";
	}
}
