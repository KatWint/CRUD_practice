package com.katwdojo.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.katwdojo.authentication.models.LoginUser;
import com.katwdojo.authentication.models.User;
import com.katwdojo.authentication.services.UserServices;


@Controller
public class HomeController {
 
	@Autowired
	private UserServices userServ;
 
	@GetMapping("/")
	public String index(@ModelAttribute("newUser")User newUser, @ModelAttribute("newLogin")LoginUser loginuser) {
		return "index.jsp";
 }
 
	@PostMapping("/register")
	public String register(@Valid@ModelAttribute("newUser") User newUser, 
			BindingResult result, HttpSession session, @ModelAttribute("newLogin")LoginUser loginuser) {
		userServ.validate(newUser, result);
		if(result.hasErrors()) {
			return "index.jsp";
     }
		userServ.registerUser(newUser);
		session.setAttribute("loggedInUser", newUser);
			return "redirect:/home";
 }
 
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
         BindingResult result, HttpSession session, @ModelAttribute("newUser") User newUser) {
		userServ.authenticateUser(newLogin, result);
		if(result.hasErrors()) {
			return "index.jsp";
		}
		User loggedInUser=userServ.findByEmail(newLogin.getEmail());
		session.setAttribute("loggedInUser", loggedInUser);
		return "redirect:/home";
 }
 
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/home")
	public String home(HttpSession session) {
		if(session.getAttribute("loggedInUser")!=null) {
			return "home.jsp";
		}else {
			return "redirect:/";
		}
	}
}
