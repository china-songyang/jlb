<%@page import="com.saturn.app.utils.DateUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加网站留言</title>
<%@ include file="/app/includes/header.jsp"%>
<script type="text/javascript">
	function add() {
			$('#addForm').submit();
	}
	
	$(function() {
		$('#sendText').focus();
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="添加网站留言"
		icon="icon-add-form" collapsible="true" style="padding: 10px;">
		<form id="addForm"
			action="<%=request.getContextPath()%>/app/website/message/add.action"
			method="post">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>留言内容:</td>
					<td><textarea id="sendText" name="sendText" cols="50" rows="5"></textarea></td>
					<td><div id="sendTextTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">留言电话:</td>
					<td><input id="sendPhone" name="sendPhone" type="text"></input></td>
					<td><div id="sendPhoneTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">留言邮箱:</td>
					<td><input id="sendEmail" name="sendEmail" type="text"></input></td>
					<td><div id="sendEmailTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" onclick="add()" class="easyui-linkbutton"
								iconCls="icon-add">添加</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
						</div></td>
				</tr>
			</table>
			<input id="sendTime" type="hidden" name="sendTime" type="text" value="<%=DateUtils.getSystemTime()%>"></input>
			<input id="sendName" type="hidden" name="sendName" type="text" value="${authUser.name}"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});
		
		$("#sendText").formValidator({
			onfocus : "留言内容不超过500字符"
		}).inputValidator({
			min : 1,
			max : 500
		});
		
		$("#sendEmail").formValidator({
			empty : true,
			onfocus : "请正确填写邮箱，例如：some@163.com"
		}).regexValidator({
			regexp : "email"
		}).inputValidator({
			max : 100,
			onerror : "不超过100个字符"
		});

		$("#sendPhone").formValidator({
			empty : true,
			onfocus : "请正确填写电话(11位)，例如：13566969636"
		}).regexValidator({
			regexp : "phone"
		}).inputValidator({
			max : 100,
			onerror : "不超过100个字符"
		});
		
	});
</script>
</html>






