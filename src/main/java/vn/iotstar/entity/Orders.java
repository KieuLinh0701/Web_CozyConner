package vn.iotstar.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;


@Entity
@Table(name="orders")
@NamedQuery(name="Orders.findAll", query="SELECT ord FROM Orders ord")
public class Orders implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="OrderId")
	private int OrderId;
	
	@JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
    private User user;
	
	@Column(name="OrderDate")
	private Date orderDate;
	
	@Column(name="Note", columnDefinition = "NVARCHAR(500) NULL")
	private String note;
	
	@Column(name="status", columnDefinition = "NVARCHAR(100) NULL")
	private String status;
	
	@ManyToOne
	@JoinColumn(name = "payment_id", referencedColumnName = "payment_id", nullable = false)
    private PaymentMethod payment;
	
	@ManyToOne
	@JoinColumn(name = "discount_id", referencedColumnName = "discountId", nullable = false)
    private Discount discount;

	@OneToMany(mappedBy="orders", cascade = CascadeType.PERSIST)
	private Set<OrderDetail> orderDetails;
	
	public Orders() {
	}

	public int getOrderId() {
		return OrderId;
	}

	public void setOrderId(int orderId) {
		OrderId = orderId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
}
