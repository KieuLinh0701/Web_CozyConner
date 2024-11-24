package vn.iotstar.services.implement;

import java.util.List;

import vn.iotstar.dao.IDiscountDao;
import vn.iotstar.dao.implement.DiscountDao;
import vn.iotstar.entity.Discount;
import vn.iotstar.services.IDiscountService;

public class DiscountService implements IDiscountService{
	
	IDiscountDao cartDao = new DiscountDao();
	
	@Override
	public List<Discount> findAll() {
		return cartDao.findAll();
	}

}
