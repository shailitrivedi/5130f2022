package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Admin;
import com.example.demo.model.Dept;
import com.example.demo.repository.AdminRepository;
import com.example.demo.repository.DeptRepository;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminRepository adminRepository;

	@Autowired
	DeptRepository deptRepository;

	@Override
	public boolean isUserNameExist(String userName) {
		Admin admin = adminRepository.findByUserName(userName);
		if (admin != null)
			return true;
		return false;
	}

	@Override
	public boolean isValidAdmin(String userName, String pass) {
		Admin admin = adminRepository.findByUserName(userName);
		String admin_repo_username = admin.getUserName();
		String admin_repo_pass = admin.getPassword();

		if (admin_repo_username.trim().equalsIgnoreCase(userName) && admin_repo_pass.equals(pass))
			return true;
		return false;
	}

	@Override
	public void saveDepartment(Dept dept) {
		deptRepository.save(dept);
	}

	@Override
	public boolean isDepartmentExists(String deptName) {
		Dept dept = deptRepository.findByDeptName(deptName);
		if (dept != null)
			return true;
		return false;
	}

	@Override
	public List<Dept> getAllDepartments() {
		return deptRepository.findAll();
	}

	@Override
	public Dept getDepartment(int deptId) {
		return deptRepository.findById(deptId);
	}

}
