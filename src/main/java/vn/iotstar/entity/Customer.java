package vn.iotstar.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;


@Entity
@Table(name="customer")
@NamedQuery(name="Customer.findAll", query="SELECT cus FROM Customer cus")
public class Customer implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */

	public Customer() {
	}

	/*
	 * Trường khóa chính @Id Tham chiếu đến cột CategoryId
	 */
	@Id
	@GeneratedValue
	@Column(name="CustomerId")
	private int customerId;
	
	@Column(name="CustomerName", columnDefinition = "NVARCHAR(200) NOT NULL")
	private String customername;
	
	@Column(name="CustomerEmail", columnDefinition = "NVARCHAR(200) NOT NULL")
	private String customerEmail;
	
	@Column(name="Images", columnDefinition = "NVARCHAR(500) NULL")
	private String images;
	
	@Column(name="CustomerAddr", columnDefinition = "NVARCHAR(200) NULL")
	private String customerAddr;

	
	@OneToMany(mappedBy="customer")

	
	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String getCustomerAddr() {
		return customerAddr;
	}

	public void setCustomerAddr(String customerAddr) {
		this.customerAddr = customerAddr;
	}
	
	
	/*
	 * @OneToMany(mappedBy="category") là một annotation trong Hibernate và JPA
	 * (Java Persistence API) được sử dụng để thiết lập mối quan hệ một-nhiều giữa
	 * hai thực thể. Trong trường hợp này, nó chỉ định rằng một thực thể Category có
	 * thể liên kết với nhiều thực thể Video.
	 */
	/* Quản lý các Video thuộc về một danh mục cụ thể */
	
	
	
}
