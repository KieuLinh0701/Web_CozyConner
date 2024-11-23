package vn.iotstar.dao.implement;


import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.IAddressDao;
import vn.iotstar.entity.Address;

public class AddressDao implements IAddressDao{

	@Override
	public Address findByAddressId(int id) {
		EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT c FROM Address c WHERE c.address_id = :id";
        TypedQuery<Address> query = enma.createQuery(jpql, Address.class);
        query.setParameter("id", id);
        return query.getSingleResult();
	}

}
