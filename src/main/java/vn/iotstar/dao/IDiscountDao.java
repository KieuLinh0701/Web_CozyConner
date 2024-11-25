package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.Discount;

public interface IDiscountDao {
	
	List<Discount> findAll();
	
	Discount findById(int discount_id);

}
