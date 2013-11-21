<%@page import="com.saturn.website.Content"%>
<%@page import="com.saturn.app.utils.DateUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加网站文章</title>
<!-- kindEditor和easyui样式冲突 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/panel.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/combo.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/combobox.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/linkbutton.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/saturn.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/formValidator/validator.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/formValidator.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/formValidatorRegex.js"></script>

<%@ include file="/app/includes/kindEditor.jsp" %>
<script type="text/javascript">
	
	var editoraa = "";
	
	function add() {
		editoraa.sync();
		$('#addForm').submit();
	}
	
	KindEditor.ready(function(K) {

		//-----编辑器上传图片----
		editoraa = K.create('textarea[name="text"]', {
			cssPath : '<%=request.getContextPath()%>/app/js/kindEditor/plugins/code/prettify.css',
			fileManagerJson : '<%=request.getContextPath()%>/app/system/upload/fileManager.action',
			uploadJson : '<%=request.getContextPath()%>/app/system/upload/upload.action',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['addForm'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['addForm'].submit();
				});
			}
		});
		//-------单独上传图片----------
		var uploadbutton = K.uploadbutton({
			button : K('#uploadButton')[0],
			fieldName : 'imgFile',
			url : '<%=request.getContextPath()%>/app/system/upload/upload.action?dir=appCar',
			afterUpload : function(data) {
				if (data.error === 0) {
					var url = K.formatUrl(data.url, 'absolute');
					
					K('#image').val(url);
					$('#imageShow').attr("src", url);
				} else {
					alert(data.message);
				}
			}
		});
		
		uploadbutton.fileBox.change(function(e) {
			uploadbutton.submit();
		});
		
		var editor = K.editor({
			fileManagerJson : '<%=request.getContextPath()%>/app/system/upload/fileManager.action?dir=appCar'
		});
		K.plugin('filemanager').call(editor, K);
		K('#filemanager').click(function() {
			var dialog = editor.plugin.filemanagerDialog({
				viewType : 'VIEW',
				clickFn : function(url, title) {
					K('#image').val(url);
					editor.hideDialog();
					$('#imageShow').attr("src", url);
				}
			});
		});
	});
	
	$(function() {
		$('#title').focus();
		
		$('#type').combobox({
			width : 250,
			value : "article.state.normal",
			onSelect : function(record){
				$('#typeName').val(record.text);
		    }
		});
		
		$('#state').combobox({
			width : 250,
			value : "visible.true",
			onSelect : function(record){
				$('#stateName').val(record.text);
		    }
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="添加信息"
		icon="icon-add-form" collapsible="true" style="padding: 10px;">
		<form id="addForm"
			action="<%=request.getContextPath()%>/app/website/newDoor/add.action"
			method="post">
			<table>
			<tr>
			<td width="550px">
			<table class="table-form">
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>品牌:</td>
					<td><input id="brand" name="brand" type="text"></input></td>
					<td><div id="brandTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>型号:</td>
					<td><input id="model" name="model" type="text"></input></td>
					<td><div id="modelTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>价格:</td>
					<td><input id="price" name="price" type="text"></input></td>
					<td><div id="priceTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>风格:</td>
					<td><input id="mole" name="mole" type="text"></input></td>
					<td><div id="moleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>类型:</td>
					<td><input id="typeName" name="typeName" type="text"></input></td>
					<td><div id="typeNameTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>显示:</td>
					<td><select id="state" class="easyui-combobox"
						name="state" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=visible" valueField="id"
						textField="text" editable="false"></select></td>
					<td><div id="titleTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">图片:</td>
					<td><input id="image" name="image" type="text" value="" readonly="readonly"/></td>
					<td><div id="imageTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="#" onclick="add()" class="easyui-linkbutton"
								iconCls="icon-add">添加</a> <a href="javascript:history.back(-1)"
								class="easyui-linkbutton" iconCls="icon-cancel">取消</a>(提交: Ctrl+Enter)
						</div></td>
				</tr>
			</table>
			</td>
			<td>
				<img id = "imageShow" alt="" src="" width="150px"/> 
				<div>
				<a id="filemanager" href="#" class="easyui-linkbutton" iconCls="icon-add">服务器</a>
				<input type="button" id="uploadButton" value="上传" style="width:70"/> 
				</div>
			</td>
			</tr>
			</table>
			<textarea name="text" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
			<input id="stateName" type="hidden" name="stateName" type="text" value="显示"></input>
			<input id="createTime" type="hidden" name="createTime" type="text" value="<%=DateUtils.getSystemTime()%>"></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});
		
		$("#title").formValidator({
			onfocus : "题目不能为空！并且不超过100字符"
		}).inputValidator({
			min : 1,
			max : 100
		});
		
		$("#text").formValidator({
			onfocus : "内容不能为空！并且不超过2000字符"
		}).inputValidator({
			min : 1,
			max : 2000
		});
	});
</script>
</html>