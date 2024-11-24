																																																	package vn.iotstar.entity;

import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;

@Entity
@Table(name = "discount")
@NamedQuery(name = "Discount.findAll", query = "SELECT v FROM Discount v")
public class Discount implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "discountId")
    private int discountId;

    @Column(name = "discountName", columnDefinition = "NVARCHAR(50) NOT NULL")
    private String discountName;

    @Column(name = "percent", columnDefinition = "INT NOT NULL")
    private int percent;

    @Column(name = "description", columnDefinition = "NVARCHAR(255) NULL")
    private String description;

    @Column(name = "quantity", columnDefinition = "INT NOT NULL")
    private int quantity;

    public Discount() {
    }

    public Discount(String discountName, int percent, String description, int quantity) {
        super();
        this.discountName = discountName;
        this.percent = percent;
        this.description = description;
        this.quantity = quantity;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    public String getDiscountName() {
        return discountName;
    }

    public void setDiscountName(String discountName) {
        this.discountName = discountName;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
