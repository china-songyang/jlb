package com.saturn.action.webdao;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.website.NewDoor;

public class NewDoorAction implements IAction {

	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		//-------
		String id = request.getParameter("id");
		NewDoor newdoor = NewDoor.get(id);
		JSONObject jobj = new JSONObject();
		if (newdoor != null) {
			jobj = new JSONObject(newdoor);
		}
		return new JsonView(jobj.toString());
	}

	public String requestMapping() {
		return "/webdo/newdoor/onenewdoor.do";
	}

}
