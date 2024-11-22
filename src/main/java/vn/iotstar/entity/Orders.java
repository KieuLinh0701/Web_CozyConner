package vn.iotstar.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;


@Entity
@Table(name="orders")
@NamedQuery(name="Orders.findAll", query="SELECT ord FROM Orders ord")
public class Orders implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	

	/**
	 * 
	 */

	public Orders() {
	}

	/*
	 * Trường khóa chính @Id Tham chiếu đến cột CategoryId
	 */
	@Id
	@GeneratedValue
	@Column(name="OrderId")
	private int oustomerId;
	
	@Column(name="CustomerId")
	private int customerId;
	
	@Column(name="OrderDate")
	private Date orderDate;
	
	@Column(name="Note", columnDefinition = "NVARCHAR(500) NULL")
	private String note;

	@OneToMany(mappedBy="orders")

	
	public int getOustomerId() {
		return oustomerId;
	}

	public void setOustomerId(int oustomerId) {
		this.oustomerId = oustomerId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	
	
	/*
	 * @OneToMany(mappedBy="category") là một annotation trong Hibernate và JPA
	 * (Java Persistence API) được sử dụng để thiết lập mối quan hệ một-nhiều giữa
	 * hai thực thể. Trong trường hợp này, nó chỉ định rằng một thực thể Category có
	 * thể liên kết với nhiều thực thể Video.
	 */
	/* Quản lý các Video thuộc về một danh mục cụ thể */
	
	
	
}
