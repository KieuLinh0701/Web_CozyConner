package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.Cart;

public interface ICartDao {
	
	List<Cart> findByUser(int user_id);

}
