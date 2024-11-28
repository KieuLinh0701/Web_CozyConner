package vn.iotstar.entity;

import java.io.Serializable;
import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "designs")
public class Designs implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "design_id")
	private int designId;

	@Column(name = "title", columnDefinition = "NVARCHAR(255) NOT NULL")
	private String title;

	@Column(name = "content", columnDefinition = "TEXT NOT NULL")
	private String content;

	@Column(name = "image", columnDefinition = "NVARCHAR(500) NULL")
	private String image;

	// Ngày tạo (chỉ lưu ngày tháng năm)
	@Column(name = "create_date", columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private LocalDate createDate;

	// Quan hệ "Nhiều blog thuộc về một User"
	@ManyToOne
	@JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false)
	private User user;

	// Trạng thái thiết kế (0: bị ẩn, 1: hoạt động)
	@Column(name = "status", columnDefinition = "INT DEFAULT 1")
	private int status;

	// Constructors
	public Designs() {
	}

	public Designs(String title, String content, String image,User user, LocalDate createDate, int status) {
		this.title = title;
		this.content = content;
		this.image = image;
		this.user=user;
		this.createDate = createDate;
		this.status = status;
	}

	// Getters and Setters
	public int getDesignId() {
		return designId;
	}

	public void setDesignId(int designId) {
		this.designId = designId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

	public LocalDate getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
