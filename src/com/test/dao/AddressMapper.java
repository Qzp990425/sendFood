package com.test.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test.entity.Address;

@Repository
public interface AddressMapper {
	
	public List<Address> getAddressByUid(Integer uid);
	
	public Integer deleteAddress(Integer aid);
	
	public Integer addAddress(Address address);
	
	public Integer updateAddress(Address address);
	
	public Address getAddressById(Integer aid);
}
