package com.example.demo.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Dept;
import com.example.demo.service.AdminService;

@Controller
@RequestMapping("/admin")
@SessionAttributes("uname")
public class AdminController {

	Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private AdminService adminService;

	@GetMapping(value = "/login")
	public String loginPage() {
		logger.info("<=====  LOGIN PAGE WILL BE RETURNED ===> ");
		return "admin/Login";

	}

	@PostMapping(value = "/dashboard")
	public String homePage(@RequestParam String userName, @RequestParam String pass, Model model) {
		if (adminService.isUserNameExist(userName)) {
			if (adminService.isValidAdmin(userName, pass)) {
				model.addAttribute("uname", userName);
				return "admin/Home";
			} else {
				model.addAttribute("login-message", "Sorry!! Username or Password is Incorrect!!");
				return "redirect:/admin/login";
			}
		}
		model.addAttribute("login-message", "Username does not exist!! Please Sign Up!!");
		return "redirect:/admin/login";
	}

	@GetMapping(value = "/dashboard")
	public String homePage1() {
		return "admin/Home";
	}

	@GetMapping(value = "/ComplaintList")
	public String ComplaintList() {
		return "admin/ComplaintList";
	}

	@GetMapping(value = "/DepartmentList")
	public ModelAndView DepartmentList() {
		ModelAndView mv = new ModelAndView("admin/DepartmentList");
		List<Dept> deptList = adminService.getAllDepartments();
		mv.addObject("department-list", deptList);
		return mv;
	}

	@GetMapping(value = "/AdminUpdateComplaint")
	public String AdminUpdateComplaint() {
		return "admin/AdminUpdateComplaint";
	}

	@GetMapping(value = "/AddDepartment")
	public String AddDepartment() {
		return "admin/AddDepartment";
	}

	@GetMapping(value = "/UpdateDepartment")
	public ModelAndView UpdateDepartment(@RequestParam("deptId") int deptId) {
		logger.info("<== Admin Controller | id to search for department ==>" + deptId);

		ModelAndView mv = new ModelAndView("admin/AddDepartment");
		Dept dept1 = adminService.getDepartment(deptId);
		mv.addObject("DepartmentObject", dept1);
		return mv;
	}

	@PostMapping(value = "/registerDepartment")
	public String addUser(Dept dept, Model model) {
		dept.setRole("DEPARTMENT");
		dept.setEmail_verified(true);
		logger.info("<== Admin Controller | department object ==>" + dept);
		// ModelAndView mv = new ModelAndView("admin/AddDepartment");
		if (!adminService.isDepartmentExists(dept.getDeptName())) {
			logger.info("<=== Admin Controller | saving dept object ===>" + dept);
			dept.setDeptName(dept.getDeptName().trim().toUpperCase());
			adminService.saveDepartment(dept);
			logger.info("<=== Admin Controller | dept saved ===>" + dept);
			model.addAttribute("save-status", "New Department has been created!!");
			return "redirect:/admin/AddDepartment";
		}
		logger.info("<=== Admin Controller | dept is not saving ===>" + dept);
		model.addAttribute("save-status", "Sorry! Department already exists!!");
		return "redirect:/admin/AddDepartment";

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
