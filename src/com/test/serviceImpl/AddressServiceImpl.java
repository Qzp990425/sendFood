package com.test.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.test.dao.AddressMapper;
import com.test.entity.Address;
import com.test.service.AddressService;

@Service
public class AddressServiceImpl implements  AddressService{

	@Autowired
	AddressMapper addressMapper;
	
	@Override
	public List<Address> getAllAddress(Integer uid) {
		// TODO Auto-generated method stub
		List<Address> list = addressMapper.getAddressByUid(uid);
		return list;
	}

	@Override
	public PageInfo<Address> getAllAddressByPage(Integer pageNum,Integer uid) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 5);
		List<Address> list = addressMapper.getAddressByUid(uid);		
		return new PageInfo<>(list);
	}

	@Override
	public boolean insertAddress(Address address) {
		Integer result = addressMapper.addAddress(address);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteAddress(Integer aid) {
		Integer result = addressMapper.deleteAddress(aid);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateAddress(Address address) {
		Integer result = addressMapper.updateAddress(address);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Address getAddressById(Integer aid) {
		// TODO Auto-generated method stub
		return addressMapper.getAddressById(aid);
	}

}
