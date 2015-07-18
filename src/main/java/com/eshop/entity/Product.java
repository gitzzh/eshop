package com.eshop.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 产品
 * 
 *
 */
@Entity
@Table(name = "product")
public class Product extends StatefulEntity {

	/**
	 * SID
	 */
	private static final long serialVersionUID = 8309761980836294238L;

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;

	/**
	 * 产品名称
	 */
	@Column(name = "name", length = 100)
	private String name;
	
	/**
	 * 描述
	 */
	@Column(name = "description", length = 100)
	private String description;
	
	/**
	 * 产品参数
	 */
	@Column(name = "params",columnDefinition = "LONGTEXT")
	private String params;
	
	/**
	 * 成本
	 */
	@Column(name = "cost")
	private Float cost;
	
	/**
	 * 价格
	 */
	@Column(name = "price")
	private Float price;

	@ManyToOne
	@JoinColumn(name = "product_type_id")
	private ProductType productType;
	
	/**
	 * 图片集合
	 */
	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<ProductImg> productImgs;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public Float getCost() {
		return cost;
	}

	public void setCost(Float cost) {
		this.cost = cost;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public ProductType getProductType() {
		return productType;
	}

	public void setProductType(ProductType productType) {
		this.productType = productType;
	}

	public Set<ProductImg> getProductImgs() {
		return productImgs;
	}

	public void setProductImgs(Set<ProductImg> productImgs) {
		this.productImgs = productImgs;
	}

	
	
	

}
