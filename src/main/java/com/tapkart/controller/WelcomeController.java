package com.tapkart.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tapkart.daoimpl.CategoryDaoImpl;
import com.tapkart.model.Category;

@Controller
public class WelcomeController {

	@RequestMapping("/CallingProductServlet")
	public String show(Model model)
	{
		CategoryDaoImpl category = new CategoryDaoImpl();
		List<Category> Categories = category.getAllCategories();
		model.addAttribute("Categories", Categories);
		return "welcome";
	}
}
