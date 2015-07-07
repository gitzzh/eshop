package com.eshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	@Column(name = "product_id")
	private Integer productId;

	/**
	 * 产品名称
	 */
	@Column(name = "product_name", length = 100)
	private String productName;

	@ManyToOne
	@JoinColumn(name = "product_type_id")
	private ProductType productType;

}
