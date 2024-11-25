package vn.iotstar.services;

import java.util.List;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.Discount;

public interface IDiscountService {
	
	List<Discount> findAll();
	
	Discount findById(int discount_id);

}
