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

import com.example.demo.model.User;
import com.example.demo.service.UserService;

@Controller
@RequestMapping("/user")
@SessionAttributes("firstname")
public class UserController {

	Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@GetMapping(value = "/login")
	public String loginPage() {
		logger.info("<=====  LOGIN PAGE WILL BE RETURNED ===> ");
		return "user/Login";
	}

//	@PostMapping(value = "/checkUser")
//	public void checkUser(@RequestParam String userName, @RequestParam String pass) {
//
//	}

	@PostMapping(value = "/dashboard")
	public String homePage(@RequestParam String userName, @RequestParam String pass, Model model) {
		if (userService.isUserNameExist(userName)) {
			if (userService.isValidUser(userName, pass)) {
				User user = userService.getFirstName(userName);
				model.addAttribute("firstname", user.getFirstName());
				return "user/Home";
			} else {
				model.addAttribute("login-message", "Sorry!! Username or Password is Incorrect!!");
				return "redirect:/user/login";
			}
		}
		model.addAttribute("login-message", "Username does not exist!! Please Sign Up!!");
		return "redirect:/user/login";

	}

	@GetMapping(value = "/dashboard")
	public String homePage1() {
		return "user/Home";
	}

	@GetMapping(value = "/ComplaintList")
	public String ComplaintList() {
		return "user/ComplaintList";
	}

	@GetMapping(value = "/TrackComplaint")
	public String TrackComplaint() {
		return "user/TrackComplaint";
	}

	@GetMapping(value = "/NewComplaint")
	public String NewComplaint() {
		return "user/NewComplaint";
	}

	@PostMapping(value = "/add")
	public String addUser(@RequestBody User user) {
		String email = user.getEmail();
		String password = user.getPassword();
		String username = user.getUserName();
		String role = user.getRole();

		userService.saveUser(user);
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

//HttpSession session = request.getSession();
// session.setAttribute("userName", userName);

//ModelAndView mv = null;
//if (userService.isValidUser(userName, pass)) {
//	mv = new ModelAndView("user/Home");
//	mv.addObject("message", "");
//	return mv;
//} else {
//	mv = new ModelAndView("user/Login");
//	mv.addObject("message", "Sorry! Username and/or Password is incorrect!");
//	return mv;
//}
