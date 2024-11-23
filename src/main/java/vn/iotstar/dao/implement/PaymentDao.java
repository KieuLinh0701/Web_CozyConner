package vn.iotstar.dao.implement;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.IPaymentDao;
import vn.iotstar.entity.PaymentMethod;

public class PaymentDao implements IPaymentDao {

	@Override
	public List<PaymentMethod> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<PaymentMethod> query = enma.createNamedQuery("PaymentMethod.findAll", PaymentMethod.class);
		return query.getResultList();
	}
}
