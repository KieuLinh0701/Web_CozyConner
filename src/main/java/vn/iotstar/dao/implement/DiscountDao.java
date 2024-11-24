package vn.iotstar.dao.implement;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.IDiscountDao;
import vn.iotstar.dao.IPaymentDao;
import vn.iotstar.entity.Discount;
import vn.iotstar.entity.PaymentMethod;

public class DiscountDao implements IDiscountDao {

	@Override
	public List<Discount> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Discount> query = enma.createNamedQuery("Discount.findAll", Discount.class);
		return query.getResultList();
	}
}
