package com.saturn.website;

import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class Message {
	
	private String id;
	
	private String sendTime;
	private String sendText;
	private String sendEmail;
	private String sendPhone;
	private String sendName;
	
	
	
	private static ORMapping<Message> mapping = new ResultORMapping<Message>();
	
	public static List<Message> getByCid(String cid,String type) {
		return SimpleDaoTemplate.query("SELECT * FROM web_message WHERE 1 = 1 AND cid = '" + cid + "' AND type = '" + type + "' order by sendtime desc", null,
				mapping, Message.class);
	}
	
	public static int add(Message vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user(id, name, gender)
		//根据列的顺序获取值对象的属性值。例子：vo.getId(), vo.getName(), vo.getGender()
		return SimpleDaoTemplate.update(
				"INSERT INTO web_message(sendTime, sendText, sendEmail, sendPhone, sendName) VALUES(?, ?, ?, ?, ?)", 
				
				vo.getSendTime(),
				vo.getSendText(),
				vo.getSendEmail(),
				vo.getSendPhone(),
				vo.getSendName()
				
		);
	}
	
	public static int edit(Message vo) {
		//指定值对象类型(VOClass)。例子：User
		//指定插入表名称(tableName)。例子：如user表3个列，tableName=user
		//指定修改列信息(modify)。例子：name=?, value=?
		//根据修改列的顺序获取值对象的属性值。例子：vo.getName(), vo.getValue(), vo.getId()
		return SimpleDaoTemplate.update(
				"UPDATE web_message SET sendTime = ?, sendText = ?, sendEmail = ?, sendPhone = ?, sendName = ? WHERE id = ?", 
				vo.getSendTime(),
				vo.getSendText(),
				vo.getSendEmail(),
				vo.getSendPhone(),
				vo.getSendName(),
				vo.getId()
		);
	}
	
	public static Message get(String id) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定表主键(key)。例子:key=id
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.queryOne(
				"SELECT * FROM web_message WHERE 1 = 1 and id = '" + id + "'",
				null, mapping, Message.class);
	}
	
	public static ListData<Message> getAll(Message vo, String start,
			String offset, String orderBy, String order) {
		//指定值对象类型(VOClass)。例子VOClass=User
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		//指定O-R映射规则对象。默认mapping
		return SimpleDaoTemplate.query("SELECT * FROM web_message WHERE 1 = 1",
				new DymaticCondition().addSimpleCondition(vo, "sendTime", "sendName", "sendText", "sendPhone")
						.addCondition("ORDER BY {0} {1}", orderBy, order),
				mapping, Message.class, start, offset);
	}
	
	
	public static int remove(final String id) {
		//指定插入表名称(tableName)。例子：如user表，tableName=user
		return SimpleDaoTemplate.update("DELETE FROM web_message WHERE id = ?",
				id);
	}
	
	public static void removes(String[] ids) {
		if (ids != null) {
			for (String id : ids) {
				remove(id);
			}
		}
	}
	
	public Message() {
		
	}

	public Message(String id,  String sendTime,
			String sendText, String sendEmail, String sendPhone,
			String sendName) {
		
		super();
		this.id = id;
		this.sendTime = sendTime;
		this.sendText = sendText;
		this.sendEmail = sendEmail;
		this.sendPhone = sendPhone;
		this.sendName = sendName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getSendText() {
		return sendText;
	}

	public void setSendText(String sendText) {
		this.sendText = sendText;
	}

	public String getSendEmail() {
		return sendEmail;
	}

	public void setSendEmail(String sendEmail) {
		this.sendEmail = sendEmail;
	}

	public String getSendPhone() {
		return sendPhone;
	}

	public void setSendPhone(String sendPhone) {
		this.sendPhone = sendPhone;
	}

	public String getSendName() {
		return sendName;
	}

	public void setSendName(String sendName) {
		this.sendName = sendName;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
}
