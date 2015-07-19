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
 * 产品类型
 * 
 */
@Entity
@Table(name = "product_type")
public class ProductType implements BaseEntity {

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
	 * 父ID
	 */
	/*@Column(name = "parent_id")
	private Integer parentId;*/
	
	/**
	 * 产品名称
	 */
	@Column(name = "name", length = 100)
	private String name;

	/**
	 * 产品参数
	 */
	@Column(name = "params",columnDefinition = "LONGTEXT")
	private String params;
	
	/**
	 * 父对象
	 */
	@ManyToOne
	@JoinColumn(name = "parent_id")
	private ProductType parent;
	
	 /**
	 * 产品集合
	 */
    @OneToMany(mappedBy = "productType", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<Product> products;

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

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public ProductType getParent() {
		return parent;
	}

	public void setParent(ProductType parent) {
		this.parent = parent;
	}

	
	

}
