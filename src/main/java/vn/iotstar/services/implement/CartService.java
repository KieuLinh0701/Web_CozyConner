package vn.iotstar.services.implement;

import java.util.List;

import vn.iotstar.dao.ICartDao;
import vn.iotstar.dao.implement.CartDao;
import vn.iotstar.entity.Cart;
import vn.iotstar.services.ICartService;

public class CartService implements ICartService{
	
	ICartDao cartDao = new CartDao();
	
	@Override
	public List<Cart> findByUser(int user_id) {
		return cartDao.findByUser(user_id);
	}

}
