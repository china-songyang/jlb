package com.saturn.action.webdao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saturn.app.utils.BeanUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JspErrorView;
import com.saturn.app.web.view.JspView;
import com.saturn.website.Message;

public class MessageAction implements IAction{
	@Override
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		Message vo = BeanUtils.getBean(request, Message.class);
		
		if (Message.add(vo) == 1) {
			return new JspView("/jlb/success.jsp");
		} else {
			return new JspErrorView("留言失败");
		}
	}
	
	@Override
	public String requestMapping() {
		return "/webdo/message/addMessage.do";
	}
}
