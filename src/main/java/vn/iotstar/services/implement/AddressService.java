package vn.iotstar.services.implement;

import vn.iotstar.dao.IAddressDao;
import vn.iotstar.dao.implement.AddressDao;
import vn.iotstar.entity.Address;
import vn.iotstar.services.IAddressService;

public class AddressService implements IAddressService{
	
	IAddressDao addressDao = new AddressDao();

	@Override
	public Address findByAddressId(int id) {
		return addressDao.findByAddressId(id);
	}
	

}
