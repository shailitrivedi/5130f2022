package com.example.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.User;
import com.example.demo.service.UserService;

@Controller
public class HomeController {
	Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	UserService userService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("/")
	public String welcomePage() {
		return "Index";
	}

	@GetMapping("/userSignUp")
	public String signUpPage() {
		return "user/SignUp";
	}

	@PostMapping("/registerUser")
	public String addUser(@ModelAttribute("register-message") User user, Model mv) {
		user.setRole("USER");
		user.setEmail_verified(true);
		logger.info("<== User ==>" + user);

		// ModelAndView mv = new ModelAndView("user/SignUp");
		// String pass = user.getPassword();
		// String encryptPass = passwordEncoder.encode(pass);
		// user.setPassword(encryptPass);

		// check the username and email exist or not?
		if ((!userService.isUserNameExist(user.getUserName())) && (!userService.isEmailExist(user.getEmail()))) {
			User user1 = userService.saveUser(user);
			mv.addAttribute("register-message", "User has been created");
			logger.info("<== User ==> User has been created");
			return "user/SignUp";
		} else if (userService.isEmailExist(user.getUserName())) {
			mv.addAttribute("register-message", "Email id is already there! Please try different Email!!");
			logger.info("<== User ==> Email id is already there! Please try different Email!!");
			return "user/SignUp";
		}
		mv.addAttribute("register-message", "Username is already there! Please try with different user name!!");
		logger.info("<== User ==> Username is already there! Please try with different user name");
		return "user/SignUp";
	}

}
