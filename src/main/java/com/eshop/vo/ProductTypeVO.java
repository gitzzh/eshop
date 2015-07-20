package com.eshop.vo;

public class ProductTypeVO {
	private Integer id;
	private String name;
	private boolean hasChildren;
	
	public ProductTypeVO() {
		// TODO Auto-generated constructor stub
	}
	
	public ProductTypeVO(Integer id, String name, boolean hasChildren) {
		super();
		this.id = id;
		this.name = name;
		this.hasChildren = hasChildren;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isHasChildren() {
		return hasChildren;
	}
	public void setHasChildren(boolean hasChildren) {
		this.hasChildren = hasChildren;
	}
	
	
}
