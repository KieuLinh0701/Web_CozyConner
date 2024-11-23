package vn.iotstar.services;

import java.util.List;

import vn.iotstar.entity.PaymentMethod;

public interface IPaymentService {
	
	List<PaymentMethod> findAll();
}
