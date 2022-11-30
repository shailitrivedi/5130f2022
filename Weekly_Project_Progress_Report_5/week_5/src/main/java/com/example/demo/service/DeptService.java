package com.example.demo.service;

import com.example.demo.model.Dept;

public interface DeptService {

	boolean isUserNameExist(String userName);

	boolean isValidDept(String email, String pass);

	boolean isEmailExist(String email);

	Dept getFirstName(String email);

}
