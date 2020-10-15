package com.test.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.test.entity.Address;

public interface AddressService {
	List<Address> getAllAddress(Integer uid);
	
	PageInfo<Address> getAllAddressByPage(Integer pageNum,Integer uid);
	
	boolean insertAddress(Address address);
	
	boolean deleteAddress(Integer aid);
	
	boolean updateAddress(Address address);
	
	Address getAddressById(Integer aid);
}
