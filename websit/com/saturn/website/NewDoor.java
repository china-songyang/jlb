package com.saturn.website;

import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class NewDoor {
	
	private String id;
	private String brand;
	private String model;
	private String price;
	private String mole;
	private String typeName;
	private String state;
	private String stateName;
	private String image;
	private String createTime;
	private String text;
	
	
	private static ORMapping<NewDoor> mapping = new ResultORMapping<NewDoor>();
	
	public static List<NewDoor> getByShow() {
		return SimpleDaoTemplate.query("SELECT * FROM web_newdoor WHERE state = 'visible.true' order by createTime desc, id desc", null,
				mapping, NewDoor.class);
	}
	
	public static ListData<NewDoor> getByShow(String start, String offset) {
		
		return SimpleDaoTemplate.query("SELECT * FROM web_newdoor WHERE state = 'visible.true' order by createTime desc, id desc",
				new DymaticCondition(),
				mapping, NewDoor.class, start, offset);
		
	}
	
	
	public static NewDoor get(String id) {
		return SimpleDaoTemplate.queryOne("select * from web_newdoor where 1=1 and id = '"+ id +"'",
				null, mapping, NewDoor.class);
	}
	
	public static int edit(NewDoor vo) {
		return SimpleDaoTemplate.update("update web_newdoor set brand = ?, model = ?, price = ?, mole = ?, typeName = ?, state = ?, statename = ?, image = ?, createTime = ?, text = ? where id = ?", 
				vo.getBrand(), vo.getModel(), vo.getPrice(), vo.getMole(),
				vo.getTypeName(), vo.getState(), vo.getStateName(),
				vo.getImage(), vo.getCreateTime(), vo.getText(), vo.getId());
	}
	
	public static int add(NewDoor vo) {
		return SimpleDaoTemplate.update(
				"insert into web_newdoor(brand, model, price, mole, typeName, state, stateName, image, createTime, text) values(?,?,?,?,?,?,?,?,?,?)", 
				vo.getBrand(), vo.getModel(), vo.getPrice(),
				vo.getMole(), vo.getTypeName(), vo.getState(), vo.getStateName(), 
				vo.getImage(), vo.getCreateTime(), vo.getText());
	}
	
	public static ListData<NewDoor> getAll(NewDoor vo, String start, String offset,
			String orderBy, String order) {
		return SimpleDaoTemplate.query("select * from web_newdoor where 1=1",
				new DymaticCondition().addSimpleCondition(vo, "id", "brand", "model", "price", "nowCost", "createtime", "factory","typename", "state", "statename", "text")
				.addCondition("order by {0} {1}", orderBy, order),
				mapping, NewDoor.class, start, offset);
	}
	
	public static void removes(String[] ids){
		if(ids != null) {
			for(String  id : ids) {
				remove(id);
			}
		}
	}
	
	public static int remove(String id) {
		return SimpleDaoTemplate.update("delete from web_newdoor where 1=1 and id = ?", id);
	}
	
	public NewDoor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NewDoor(String id, String brand, String model, String price, String mole, 
			String createTime,  String typeName, String state, String stateName, String image, String text){
		super();
		this.id = id;
		this.brand = brand;
		this.model = model;
		this.price = price;
		this.mole = mole;
		this.createTime = createTime;
		this.typeName = typeName;
		this.state = state;
		this.stateName = stateName;
		this.image = image;
		this.text = text;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getMole() {
		return mole;
	}
	public void setMole(String mole) {
		this.mole = mole;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return new JSONObject(this).toString();
	}
	
}
