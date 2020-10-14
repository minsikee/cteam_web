package order;

import java.util.HashMap;
import java.util.List;

public class OrderListVO {
	private int order_num;
	private String item_name;
	private String member_id;
	private String item_imgpath;
	private String item_price;
	private String item_su;
	private String order_date;
	private String order_state;
	private List<ProductVO> order_item;
	
	public List<ProductVO> getOrder_item() {
		return order_item;
	}
	public void setOrder_item(List<ProductVO> order_item) {
		this.order_item = order_item;
	}
	public String getItem_price() {
		return item_price;
	}
	public void setItem_price(String item_price) {
		this.item_price = item_price;
	}
	public String getItem_su() {
		return item_su;
	}
	public void setItem_su(String item_su) {
		this.item_su = item_su;
	}
	public String getItme_price() {
		return item_price;
	}
	public void setItme_price(String itme_price) {
		this.item_price = itme_price;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getItem_imgpath() {
		return item_imgpath;
	}
	public void setItem_imgpath(String item_imgpath) {
		this.item_imgpath = item_imgpath;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	
	
}