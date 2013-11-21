package com.saturn.action.website.newDoor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspView;
import com.saturn.website.NewDoor;

public class DeleteNewDoorAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		String idstr = request.getParameter("ids");
		String[] ids = idstr.split("__");
		NewDoor.removes(ids);
		
		return new JspView("/app/website/newDoor/show.jsp");
	}
	
	@Override
	public String requestMapping() {
		return "/app/website/newDoor/deleteNewDoor.action";
	}
}
