package com.test.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.test.entity.Type;

@Repository
public interface TypeMapper {
	List<Type> selectAllType();
	
	Integer deleteType(Integer tid);
	
	Integer updateType(Type type);
	
	Integer insertType(String name);
	
	Type getTypeByTid(Integer tid);
}
