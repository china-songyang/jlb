package com.saturn.action.website.newDoor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.website.NewDoor;

public class AddNewDoorAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		NewDoor vo = BeanUtils.getBean(request, NewDoor.class);
		if(NewDoor.add(vo) == 1) {
			return new JspView("/app/website/newDoor/show.jsp");
		} else {
			return new JspErrorView("添加信息失败");
		}
	}
	
	@Override
	public String requestMapping() {
		return "/app/website/newDoor/add.action";
	}
}
