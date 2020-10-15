package com.test.service;

import com.github.pagehelper.PageInfo;
import com.test.entity.Admin;

public interface AdminService {
	
	public boolean login(Admin admin);
	
	public PageInfo<Admin> getAllAdmin(Integer pageNum);
	
	public boolean updateAdmin(Admin admin);
	
	public boolean addAdmin(Admin admin);
	
	public boolean deleteAdmin(Integer id);
	
	public Admin getAdmin(Integer id);
}
