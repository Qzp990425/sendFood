package com.test.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.test.dao.AdminMapper;
import com.test.entity.Admin;
import com.test.service.AdminService;


@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminMapper adminMapper;
	
	
	public boolean login(Admin admin) {
		Admin checkAdmin = adminMapper.getAdminByUsername(admin);
		if(checkAdmin == null) {
			return false;
		} else {
			if(checkAdmin.getPassword().equals(admin.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}

	public Admin getAdminByUsername(Admin admin) {
		return adminMapper.getAdminByUsername(admin);
	}
	
	
	@Override
	public PageInfo<Admin> getAllAdmin(Integer pageNum) {
		PageHelper.startPage(pageNum, 5);
		List<Admin> admins = adminMapper.getAdmin();
		return new PageInfo<>(admins);
	}


	@Override
	public boolean updateAdmin(Admin admin) {
		Integer result = adminMapper.updateAdmin(admin);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}


	@Override
	public boolean addAdmin(Admin admin) {
		Integer result = adminMapper.addAdmin(admin);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean deleteAdmin(Integer id) {
		Integer result = adminMapper.deleteAdmin(id);
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}


	@Override
	public Admin getAdmin(Integer id) {
		return adminMapper.getAdminById(id);
	}
	
}
