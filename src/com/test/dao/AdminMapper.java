package com.test.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.test.entity.Admin;




@Repository
public interface AdminMapper {
	
	public Admin getAdminByUsername(Admin admin);
	
	public Admin getAdminById(Integer id);
	
	public List<Admin> getAdmin();
	
	public Integer addAdmin(Admin admin);
	
	public Integer deleteAdmin(Integer id);
	
	public Integer updateAdmin(Admin admin);
}
