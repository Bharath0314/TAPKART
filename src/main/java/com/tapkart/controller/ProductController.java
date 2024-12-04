package com.tapkart.controller;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tapkart.daoimpl.ProductDaoImpl;
import com.tapkart.model.Product;

@Controller
public class ProductController {


	@RequestMapping("/CallingParticularProductsServlet")
	public String showProduct(@RequestParam("categoryId") int categoryId,Model model,HttpSession session) {
		ProductDaoImpl particularProducts = new ProductDaoImpl();
		List<Product> particular = particularProducts.getAllProductsByCategoryId(categoryId);
		model.addAttribute("particularProducts", particular);
		session.setAttribute("categoryId", categoryId);
		return "products";
	}
}
