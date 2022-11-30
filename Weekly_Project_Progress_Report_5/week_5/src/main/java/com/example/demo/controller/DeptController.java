package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo.model.Dept;
import com.example.demo.model.User;
import com.example.demo.service.DeptService;

@Controller
@RequestMapping("/dept")
@SessionAttributes("dept_firstname")
public class DeptController {

	Logger logger = LoggerFactory.getLogger(DeptController.class);

	@Autowired
	private DeptService deptService;

	@GetMapping(value = "/login")
	public String loginPage() {
		logger.info("<=====  LOGIN PAGE WILL BE RETURNED ===> ");
		return "dept/Login";

	}

	@PostMapping(value = "/dashboard")
	public String homePage(@RequestParam String userName, @RequestParam String pass, Model model) {
		String email = userName;
		if (deptService.isEmailExist(email)) {
			// logger.info("<== DEPARTMENT CONTROLLER | Email Exists ==>");
			if (deptService.isValidDept(email, pass)) {
				// logger.info("<== DEPARTMENT CONTROLLER | Email and PASSWORD MATCHES ==>");
				Dept dept = deptService.getFirstName(email);
				// logger.info("<== DEPARTMENT CONTROLLER | AFTER /dashboard ==>" + dept);
				model.addAttribute("dept_firstname", dept.getFirstName());
				return "dept/Home";
			} else {
				model.addAttribute("login-message", "Sorry!! Username or Password is Incorrect!!");
				return "redirect:/dept/login";
			}
		}
		model.addAttribute("login-message", "Email id does not exist!! Please Contact to Admin!!");
		return "redirect:/dept/login";

	}

	@GetMapping(value = "/dashboard")
	public String homePage1() {
		return "dept/Home";
	}

	@GetMapping(value = "/ComplaintList")
	public String ComplaintList() {
		return "dept/ComplaintList";
	}

	@GetMapping(value = "/ResolvedComplaintList")
	public String ResolvedComplaintList() {
		return "dept/ResolvedComplaintList";
	}

	@GetMapping(value = "/ResolveComplaints")
	public String ResolveComplaints() {
		return "dept/ResolveComplaints";
	}

	@PostMapping(value = "/add")
	public String addUser(@RequestBody User user) {
		String email = user.getEmail();
		String password = user.getPassword();
		String username = user.getUserName();
		String role = user.getRole();

		// adminService.saveUser(user);
		return "User has been saved!";
	}

	@GetMapping(value = "/logout")
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/";
	}

}
