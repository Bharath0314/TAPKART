package com.tapkart.controller;

import com.tapkart.model.Cart;
import com.tapkart.model.CartItem;
import com.tapkart.model.Product;

public class Demo {

	public static void main(String[] args) {
		CartItem p1 = new CartItem(1,"name",233,30.00);
		CartItem p2 = new CartItem(2,"nam",213443,301324.00);
		Cart c=new Cart();
		c.addItem(p1);
		c.addItem(p2);
		for (CartItem item : c.getItems().values()) {
			System.out.println(item.getPrice());
		}

	}

}
