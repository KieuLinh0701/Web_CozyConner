package vn.iotstar.dao.implement;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.ICartDao;
import vn.iotstar.entity.Cart;

public class CartDao implements ICartDao{

	@Override
	public List<Cart> findByUser(int user_id) {
		 EntityManager enma = JPAConfig.getEntityManager();
	        String jpql = "SELECT c FROM Cart c WHERE c.user.id = :id";
	        TypedQuery<Cart> query = enma.createQuery(jpql, Cart.class);
	        query.setParameter("id", user_id);
	        return query.getResultList();
	}

}
