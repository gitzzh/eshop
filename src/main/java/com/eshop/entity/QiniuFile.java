package com.eshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "qiniu_file")
public class QiniuFile extends StatefulEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1451532064400606472L;

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;
	
	/**
	 * 存储空间
	 */
	@Column(name = "bucket")
	private String bucket;
	
	/**
	 * 资源名称 key
	 */
	@Column(name = "fkey")
	private String fkey;
	
	/**
	 * 文件路径
	 */
	@Column(name = "path")
	private String path;
	
	/**
	 * 文件名称
	 */
	@Column(name = "name")
	private String name;
	
	/**
	 * 文件大小
	 */
	@Column(name = "size")
	private Long size;

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

	public String getBucket() {
		return bucket;
	}

	public void setBucket(String bucket) {
		this.bucket = bucket;
	}

	public String getFkey() {
		return fkey;
	}

	public void setFkey(String fkey) {
		this.fkey = fkey;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Long getSize() {
		return size;
	}

	public void setSize(Long size) {
		this.size = size;
	}

	

	
	
}
