package com.test.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.test.entity.Type;

public interface TypeService {
	PageInfo<Type> getAllType(Integer pageNum);
	
	List<Type> getTypeList();
	
	boolean deleteType(Integer tid);
	
	boolean insertType(String name);
	
	boolean updateType(Type type);
	
	Type getTypeByTid(Integer tid);
}
