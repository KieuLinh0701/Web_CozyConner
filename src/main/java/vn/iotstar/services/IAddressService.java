package vn.iotstar.services;


import vn.iotstar.entity.Address;

public interface IAddressService {

	Address findByAddressId(int id);
	
	Address update(Address address);
	
	Address insert(Address address);
	
}
