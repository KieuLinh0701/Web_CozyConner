package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.Category;

public interface ICategoryDao {
	void insert(Category category);

	void update(Category category);

	void delete(int cateid) throws Exception;

	public Category findById(int cateid);

	public Category findByCategoryname(String name) throws Exception;

	public List<Category> searchByName(String catname);

	public List<Category> findAll();

	public List<Category> findAll(int page, int pagesize);

	public int count();
}
