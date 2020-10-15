package com.test.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.test.dao.TypeMapper;
import com.test.entity.Type;
import com.test.service.TypeService;


@Service
public class TypeServiceImpl implements TypeService{
	
	@Autowired
	TypeMapper typeMapper;

	@Override
	public PageInfo<Type> getAllType(Integer pageNum) {
		PageHelper.startPage(pageNum, 5);
		List<Type> list = typeMapper.selectAllType();
		return new PageInfo<>(list);
	}

	@Override
	public List<Type> getTypeList() {
		List<Type> list = typeMapper.selectAllType();
		return list;
	}

	@Override
	public boolean deleteType(Integer tid) {
		if(typeMapper.deleteType(tid)==1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean insertType(String name) {
		if(typeMapper.insertType(name)==1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateType(Type type) {
		if(typeMapper.updateType(type)==1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Type getTypeByTid(Integer tid) {
		// TODO Auto-generated method stub
		return typeMapper.getTypeByTid(tid);
	}
	
	
}
