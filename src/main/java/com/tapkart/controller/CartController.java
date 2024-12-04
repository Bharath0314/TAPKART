package com.tapkart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tapkart.daoimpl.ProductDaoImpl;
import com.tapkart.model.Cart;
import com.tapkart.model.CartItem;
import com.tapkart.model.Product;

import javax.servlet.http.HttpSession;

@Controller
public class CartController {

    private ProductDaoImpl productDao;

    @RequestMapping("/CallingCartServlet")
    public String cart(
        @RequestParam("action") String action,
        @RequestParam("itemId") int itemId,
        @RequestParam("quantity") int quantity,
        HttpSession session,
        Model model
    ) {
        // Retrieve the cart from the session
        Cart cart = (Cart) session.getAttribute("cart");

        // Initialize a new cart if it doesn't already exist in the session
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        // Handle the action
        switch (action) {
            case "add":
                addItemToCart(cart, itemId, quantity);
                break;
            case "update":
                updateCartItem(cart, itemId, quantity);
                break;
            case "remove":
                removeItemFromCart(cart, itemId);
                break;
            case "clear":
                clearFromCart(cart);
                break;
            default:
                model.addAttribute("error", "Invalid action: " + action);
        }

        // Update the cart in the session and model for the view
        session.setAttribute("cart", cart);
        model.addAttribute("cart", cart);

        return "Cart"; // Return the cart view
    }

    private void addItemToCart(Cart cart, int itemId, int quantity) {
    	int itemI = itemId;
		int quantit = quantity;
		System.out.println(itemI);
		System.out.println(quantit);
		ProductDaoImpl productDao = new ProductDaoImpl();
		Product product = productDao.getProduct(itemI);
		if (product != null) {
			CartItem item = new CartItem(product.getProductId(), product.getCategoryId(), product.getName(), quantit,
					product.getPrice());
			item.setImagePath(product.getImagePath());

			cart.addItem(item);
       
    }
    }

    private void updateCartItem(Cart cart, int itemId, int quantity) {
        if (quantity > 0) {
            cart.updateItem(itemId, quantity); // Update item quantity in the cart
        }
    }

    private void removeItemFromCart(Cart cart, int itemId) {
        cart.removeItem(itemId); // Remove item from the cart
    }

    private void clearFromCart(Cart cart) {
        cart.clear(); // Clear the entire cart
    }
    
    @RequestMapping("/CallingCart2Servlet")
    public String cart(
        HttpSession session,
        Model model
    ) {
        // Retrieve the cart from the session
        Cart cart = (Cart) session.getAttribute("cart");

        // Initialize a new cart if it doesn't already exist in the session
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        
        // Update the cart in the session and model for the view
        session.setAttribute("cart", cart);
        model.addAttribute("cart", cart);

        return "Cart"; // Return the cart view
    }

    
}
