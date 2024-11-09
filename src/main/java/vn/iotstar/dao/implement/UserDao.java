package vn.iotstar.dao.implement;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.IUserDao;
import vn.iotstar.entity.User;

public class UserDao implements IUserDao {

	@Override
	public int count() {
		EntityManager enma = JPAConfig.getEntityManager();
		String jpql = "SELECT count(c) FROM User c";
		Query query = enma.createQuery(jpql);
		return ((Long) query.getSingleResult()).intValue();
	}

	@Override
	public List<User> findAll(int page, int pagesize) {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<User> query = enma.createNamedQuery("User.findAll", User.class);
		query.setFirstResult(page * pagesize);
		query.setMaxResults(pagesize);
		return query.getResultList();
	}

	@Override
	public List<User> findByFullname(String fullname) {
		EntityManager enma = JPAConfig.getEntityManager();
		String jpql = "SELECT c FROM User c WHERE c.fullname like :fullname";
		TypedQuery<User> query = enma.createQuery(jpql, User.class);
		query.setParameter("fullname", "%" + fullname + "%");
		return query.getResultList();
	}

	@Override
	public List<User> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<User> query = enma.createNamedQuery("User.findAll", User.class);
		return query.getResultList();
	}

	@Override
	public void delete(int id) throws Exception {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			User user = enma.find(User.class, id);
			if (user != null) {
				enma.remove(user);
			} else {
				throw new Exception("Không tìm thấy");
			}
			enma.remove(user);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	@Override
	public void update(User user) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.merge(user);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	@Override
	public void insert(User user) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.persist(user);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	@Override
	public User findById(int id) {
		EntityManager enma = JPAConfig.getEntityManager();
		User user = enma.find(User.class, id);
		return user;
	}

	@Override
	public User findByEmail(String email) {
		EntityManager enma = JPAConfig.getEntityManager();

		try {
			String jpql = "SELECT c FROM User c WHERE c.email like :email";
			TypedQuery<User> query = enma.createQuery(jpql, User.class);
			query.setParameter("email", "%" + email + "%");
	        return query.getSingleResult();
	    } catch (NoResultException e) {
	        return null; 
	    }
	}

}
