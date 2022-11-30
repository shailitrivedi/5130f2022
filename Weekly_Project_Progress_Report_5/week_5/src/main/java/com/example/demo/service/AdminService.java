package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Dept;

public interface AdminService {

	boolean isUserNameExist(String userName);

	boolean isValidAdmin(String userName, String pass);

	void saveDepartment(Dept dept);

	boolean isDepartmentExists(String deptName);

	List<Dept> getAllDepartments();

	Dept getDepartment(int deptId);

}
