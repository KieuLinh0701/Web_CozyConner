package vn.iotstar.services.implement;

import java.util.List;

import vn.iotstar.dao.IDiscountDao;
import vn.iotstar.dao.implement.DiscountDao;
import vn.iotstar.entity.Discount;
import vn.iotstar.services.IDiscountService;

public class DiscountService implements IDiscountService{
	
	IDiscountDao discountDao = new DiscountDao();
	
	@Override
	public List<Discount> findAll() {
		return discountDao.findAll();
	}

	@Override
	public Discount findById(int discount_id) {
		return discountDao.findById(discount_id);
	}

}
