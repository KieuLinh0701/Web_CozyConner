package vn.iotstar.services;

import java.util.List;

import vn.iotstar.entity.CartItem;

public interface ICartItemService {
	
	List<CartItem> findByCartId(int cart_id);
	
	int totalPrice(List<CartItem> listCartItem);

}
