package vn.iotstar.services.implement;

import java.util.List;

import vn.iotstar.dao.ICartItemDao;
import vn.iotstar.dao.implement.CartItemDao;
import vn.iotstar.entity.CartItem;
import vn.iotstar.services.ICartItemService;

public class CartItemService implements ICartItemService{
	
	ICartItemDao cartItemDao = new CartItemDao();
	
	@Override
	public List<CartItem> findByCartId(int cart_id) {
		return cartItemDao.findByCartId(cart_id);
	}

	@Override
	public int totalPrice(List<CartItem> listCartItem) {
		return cartItemDao.totalPrice(listCartItem);
	}

}
