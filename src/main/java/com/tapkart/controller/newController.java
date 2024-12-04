package com.tapkart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class newController {
	@RequestMapping("/Logged")
	protected String loginpage() {
		return "Login";
	}
}
