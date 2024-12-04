package com.tapkart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tapkart.model.User;
import com.tapkart.daoimpl.UserDaoImpl;

@Controller
public class LoginController {
	@RequestMapping("/loginController")
	protected String login(@RequestParam String username,@RequestParam String password,HttpSession session) {
		String userName = username;
		String Password = password;
		System.out.println(userName);
		System.out.println(Password);
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		boolean isValid = userDaoImpl.isValidUser(userName, Password);
		//String role = userDaoImpl.getUserRole(userName, encryptedPassword);
		User user=userDaoImpl.getUserByuserNameAndPassword(userName, Password);
		Integer attempts = (Integer) session.getAttribute("attempts");
		if (attempts == null) {
			attempts = 0;
		}
		if (isValid ) {
			session.setAttribute("user",user);
			session.setAttribute("userName", userName);
			System.out.println(userName+" "+"Customersisexcecuting");
			return "redirect:/CallingHomeProductServlet";
		}
		return "None";
	}

}
/* ENUM('Customers', 'RestaurentAdmin', 'DeliveryAgent', 'SystemAdmin') */