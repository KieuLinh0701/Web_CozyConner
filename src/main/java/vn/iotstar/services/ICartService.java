package vn.iotstar.services;

import java.util.List;

import vn.iotstar.entity.Cart;

public interface ICartService {

	List<Cart> findByUser(int user_id);
	
}
