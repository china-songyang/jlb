package com.saturn.website;

import java.util.List;

import org.json.JSONObject;

import com.saturn.app.db.DymaticCondition;
import com.saturn.app.db.ListData;
import com.saturn.app.db.ORMapping;
import com.saturn.app.db.ResultORMapping;
import com.saturn.app.db.SimpleDaoTemplate;

public class Recommend {
	private String id;
	private String brand;
	private String model;
	private String oldCost;
	private String nowCost;
	private String factory;
	private String createtime;
	private String type;
	private String typename;
	private String state;
	private String statename;
	private String text;
	
	private static ORMapping<Recommend> mapping = new ResultORMapping<Recommend>();
	
	public static List<Recommend> getByShow() {
		return SimpleDaoTemplate.query("SELECT * FROM web_recommend WHERE state = 'visible.true' order by createtime desc, id desc", null,
				mapping, Recommend.class);
	}
	
	public static ListData<Recommend> getByShow(String start, String offset) {
		
		return SimpleDaoTemplate.query("SELECT * FROM web_recommend WHERE state = 'visible.true' order by createtime desc, id desc",
				new DymaticCondition(),
				mapping, Recommend.class, start, offset);
		
	}
	
	public static Recommend get(String id) {
		return SimpleDaoTemplate.queryOne("select * from web_recommend where 1=1 and id = '"+ id +"'",
				null, mapping, Recommend.class);
	}
	public static int add(Recommend vo) {
		return SimpleDaoTemplate.update(
				"insert into web_recommend(brand, model, oldCost, nowCost, createtime, factory, type, typename, state, statename, text) values(?,?,?,?,?,?,?,?,?,?,?)", 
				vo.getBrand(), vo.getModel(), vo.getOldCost(), vo.getNowCost(),
				vo.getCreatetime(), vo.getFactory(), vo.getType(), vo.getTypename(), 
				vo.getState(), vo.getStatename(), vo.getText());
	}
	
	public static int edit(Recommend vo) {
		return SimpleDaoTemplate.update("update web_recommend set brand = ?, model = ?, oldCost = ?, nowCost = ?, createtime = ?, factory = ?, type = ?, typename = ?, state = ?, statename = ?, text = ? where id = ?", 
				vo.getBrand(), vo.getModel(), vo.getOldCost(), vo.getNowCost(),
				vo.getCreatetime(), vo.getFactory(), vo.getType(),
				vo.getTypename(), vo.getState(), vo.getStatename(), vo.getText(), vo.getId());
	}
	
	public static ListData<Recommend> getAll(Recommend vo, String start, String offset,
			String orderBy, String order) {
		return SimpleDaoTemplate.query("select * from web_recommend where 1=1",
				new DymaticCondition().addSimpleCondition(vo, "id", "brand", "model", "oldCost", "nowCost", "createtime", "factory", "type","typename", "state", "statename", "text")
				.addCondition("order by {0} {1}", orderBy, order),
				mapping, Recommend.class, start, offset);
	}
	
	public static void removes(String[] ids){
		if(ids != null) {
			for(String  id : ids) {
				remove(id);
			}
		}
	}
	
	public static int remove(String id) {
		return SimpleDaoTemplate.update("delete from web_recommend where 1=1 and id = ?", id);
	}
	public Recommend(){
		
	}
	
	public Recommend(String id, String brand, String model, String oldCost, String nowCost, String factory, String createtime,
			String type, String typename, String state, String statename, String text){
		super();
		this.id = id;
		this.brand = brand;
		this.model = model;
		this.oldCost = oldCost;
		this.nowCost = nowCost;
		this.factory = factory;
		this.createtime = createtime;
		this.type = type;
		this.typename = typename;
		this.state = state;
		this.statename = statename;
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
	public String getOldCost() {
		return oldCost;
	}
	public void setOldCost(String oldCost) {
		this.oldCost = oldCost;
	}
	public String getNowCost() {
		return nowCost;
	}
	public void setNowCost(String nowCost) {
		this.nowCost = nowCost;
	}
	public String getFactory() {
		return factory;
	}
	public void setFactory(String factory) {
		this.factory = factory;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getStatename() {
		return statename;
	}

	public void setStatename(String statename) {
		this.statename = statename;
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
