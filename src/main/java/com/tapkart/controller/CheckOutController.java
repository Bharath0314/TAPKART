package com.tapkart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tapkart.model.Cart;
import com.tapkart.model.CartItem;
import com.tapkart.model.User;
@Controller
public class CheckOutController {

	@RequestMapping("/CallingCheckOutServlet")
	public String method(HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("user");
		int userId = user.getUserId();
		double totalPrice=0.0;
		if (cart != null) {

			totalPrice = 0;
			for (CartItem item : cart.getItems().values()) {
				totalPrice += item.getPrice() * item.getQuantity();
			}
			session.setAttribute("totalPrice", totalPrice);
		}
		return "checkout";
	}

}
