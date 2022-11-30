package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.example.demo.repository.AdminRepository;
import com.example.demo.repository.UserRepository;

@SpringBootApplication
@EnableJpaRepositories(basePackageClasses = { UserRepository.class, AdminRepository.class })
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}
