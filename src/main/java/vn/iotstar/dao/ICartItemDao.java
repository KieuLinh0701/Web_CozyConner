package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.CartItem;

public interface ICartItemDao {
	
	List<CartItem> findByCartId(int cart_id);
	
	int totalPrice(List<CartItem> listCartItem);

}
