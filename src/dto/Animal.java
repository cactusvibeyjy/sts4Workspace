package dto;

import java.io.Serializable;

public class Animal implements Serializable{

	private static final long serialVersionUID = 7910850722545213899L;
	private String a_name;
	private String a_area;
	private String a_age;
	private int quantity;

	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_area() {
		return a_area;
	}
	public void setA_area(String a_area) {
		this.a_area = a_area;
	}
	public String getA_age() {
		return a_age;
	}
	public void setA_age(String a_age) {
		this.a_age = a_age;
	}
	
	/*
	 * public String getName() { return name; } public void setName(String name) {
	 * this.name = name; } public String getArea() { return area; } public void
	 * setArea(String area) { this.area = area; } public int getAge() { return age;
	 * } public void setAge(int age) { this.age = age; }
	 */
	
}
