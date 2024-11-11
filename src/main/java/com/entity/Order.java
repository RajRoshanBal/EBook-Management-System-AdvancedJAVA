package com.entity;

public class Order {

	

	private String order_id;
	private int uid;
	private String username;
	private String email;
	private String phno;
	private String book_name;
	private String address;
	private String author;
	private String price;
	private String payment_type;
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public Order(String order_id, int uid, String username, String email, String phno, String book_name, String address,
			String author, String price, String payment_type) {
		super();
		this.order_id = order_id;
		this.uid = uid;
		this.username = username;
		this.email = email;
		this.phno = phno;
		this.book_name = book_name;
		this.address = address;
		this.author = author;
		this.price = price;
		this.payment_type = payment_type;
	}
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", uid=" + uid + ", username=" + username + ", email=" + email
				+ ", phno=" + phno + ", book_name=" + book_name + ", address=" + address + ", author=" + author
				+ ", price=" + price + ", payment_type=" + payment_type + "]";
	}
	
	
	
}
