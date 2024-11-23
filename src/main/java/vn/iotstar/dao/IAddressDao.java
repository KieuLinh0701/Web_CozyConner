package vn.iotstar.dao;


import vn.iotstar.entity.Address;

public interface IAddressDao {
	
	Address findByAddressId(int id);
	
	Address update(Address address);

}
