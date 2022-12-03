package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Integer> {

	// Meaning: SELECT * FROM ADMIN WHERE USERNAME = username
	Admin findByUserName(String username);

	Admin findByEmail(String email);

}
