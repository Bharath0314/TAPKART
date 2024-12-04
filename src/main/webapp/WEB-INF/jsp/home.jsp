<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tapkart.model.Category"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
 <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
/* Import Google Fonts */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

/* Custom Properties */
:root {
    --primary-color: #2874f0;
    --secondary-color: #ff9f00;
    --accent-color: #388e3c;
    --danger-color: #ff5722;
    --text-light: #ffffff;
    --text-dark: #212121;
    --text-gray: #878787;
    --bg-light: #f1f3f6;
    --bg-dark: #172337;
    --gradient-primary: linear-gradient(135deg, #2874f0, #1a5db4);
    --gradient-secondary: linear-gradient(135deg, #ff9f00, #ff6b00);
    --box-shadow-sm: 0 2px 8px rgba(0,0,0,0.1);
    --box-shadow-md: 0 4px 12px rgba(0,0,0,0.15);
    --box-shadow-lg: 0 8px 24px rgba(0,0,0,0.2);
    --transition-fast: all 0.2s ease;
    --transition-normal: all 0.3s ease;
    --transition-slow: all 0.4s ease;
}

/* Global Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Roboto', Arial, sans-serif;
}

body {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    background-color: #f1f3f6;
}

/* Header Styles */
.header {
    background-color: #2874f0;
    padding: 1rem 5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: sticky;
    top: 0;
    z-index: 1000;
}

.header-left h1 {
    color: white;
    font-size: 1.8rem;
    font-style: italic;
}

.search-container {
    flex: 0.6;
    display: flex;
    align-items: center;
}

.search-container input {
    width: 100%;
    padding: 0.8rem;
    border: none;
    border-radius: 4px 0 0 4px;
    font-size: 1rem;
}

.search-btn {
    padding: 0.8rem 1.5rem;
    background: white;
    border: none;
    border-radius: 0 4px 4px 0;
    cursor: pointer;
}

.nav-buttons {
    display: flex;
    gap: 1rem;
}

.nav-buttons button {
    padding: 0.5rem 1rem;
    border: none;
    background: transparent;
    color: white;
    cursor: pointer;
    font-size: 1rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

/* Welcome Banner */
.welcome-banner {
    background: linear-gradient(45deg, #2874f0, #5f9ea0);
    color: white;
    padding: 3rem 5%;
    text-align: center;
}

.banner-content h2 {
    font-size: 2.5rem;
    margin-bottom: 1rem;
}

.shop-now-btn {
    padding: 1rem 2rem;
    background: #ff9f00;
    border: none;
    border-radius: 4px;
    color: white;
    font-size: 1.1rem;
    cursor: pointer;
    margin-top: 1rem;
}

/* Categories Section */
.categories-section {
    padding: 2rem 5%;
    background: white;
    margin: 1rem 0;
}

.category-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 1.5rem;
    margin-top: 1.5rem;
}

.category-card {
    background: var(--text-light);
    padding: 2rem;
    border-radius: 15px;
    transition: var(--transition-normal);
    box-shadow: var(--box-shadow-sm);
    position: relative;
    overflow: hidden;
    z-index: 1;
}

.category-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: var(--gradient-primary);
    opacity: 0;
    z-index: -1;
    transition: var(--transition-normal);
}

.category-card:hover::before {
    opacity: 0.1;
}

.category-card:hover {
    transform: translateY(-10px) scale(1.02);
    box-shadow: var(--box-shadow-lg);
}

.category-card i {
    font-size: 2.5rem;
    background: var(--gradient-primary);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    margin-bottom: 1rem;
    transition: var(--transition-normal);
}

.category-card:hover i {
    transform: scale(1.2) rotate(5deg);
}

/* Featured Products */
.featured-products {
    padding: 2rem 5%;
    background: white;
    margin: 1rem 0;
}

.product-grid {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 1rem;
    margin-top: 1.5rem;
    padding: 0 1rem;
}

.product-card {
    background: var(--text-light);
    padding: 1rem;
    border-radius: 15px;
    box-shadow: var(--box-shadow-sm);
    transition: var(--transition-normal);
    position: relative;
    overflow: hidden;
}

.product-card::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 4px;
    background: var(--gradient-primary);
    transform: scaleX(0);
    transition: var(--transition-normal);
}

.product-card:hover::after {
    transform: scaleX(1);
}

.product-card:hover {
    transform: translateY(-8px);
    box-shadow: var(--box-shadow-lg);
}

.product-badge {
    position: absolute;
    top: 1rem;
    left: -3rem;
    background: var(--gradient-secondary);
    color: var(--text-light);
    padding: 0.5rem 3rem;
    transform: rotate(-45deg);
    font-size: 0.9rem;
    font-weight: 500;
    box-shadow: var(--box-shadow-sm);
}

.add-to-cart-btn {
    width: 100%;
    padding: 12px;
    background: var(--gradient-primary);
    color: var(--text-light);
    border: none;
    border-radius: 25px;
    font-weight: 500;
    cursor: pointer;
    transition: var(--transition-normal);
    opacity: 0.9;
    transform: translateY(10px);
    opacity: 0;
}

.product-card:hover .add-to-cart-btn {
    transform: translateY(0);
    opacity: 1;
}

.product-card img {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-radius: 8px;
}

.product-card h3 {
    font-size: 1rem;
    margin: 0.5rem 0;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.price {
    font-size: 1rem;
    margin: 0.3rem 0;
}

.original-price {
    font-size: 0.9rem;
    text-decoration: line-through;
    color: var(--text-gray);
    margin-left: 0.5rem;
}

.rating {
    color: #ffc107;
    margin: 0.5rem 0;
}

/* Deals Section */
.deals-section {
    padding: 2rem 5%;
    background: white;
    margin: 1rem 0;
}

.deals-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 2rem;
    margin-top: 2rem;
    padding: 0 1rem;
}

.deal-card {
    padding: 1.5rem;
    border-radius: 20px;
    background: white;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.deal-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
}

.deal-timer {
    color: #ff4444;
    font-weight: 600;
    margin: 10px 0;
}

.deal-description {
    color: #666;
    margin-bottom: 15px;
}

.discount-badge {
    position: absolute;
    top: 1rem;
    right: 1rem;
    background: var(--gradient-secondary);
    color: var(--text-light);
    width: 60px;
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    font-weight: 600;
    box-shadow: var(--box-shadow-sm);
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.1); }
    100% { transform: scale(1); }
}

/* Footer Styles */
.footer {
    background: #172337;
    color: white;
    padding: 3rem 5% 1rem;
    margin-top: auto;
}

.footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 2rem;
    margin-bottom: 2rem;
}

.footer-section h3 {
    margin-bottom: 1rem;
}

.footer-section ul {
    list-style: none;
}

.footer-section ul li {
    margin-bottom: 0.5rem;
}

.footer-section ul li a {
    color: var(--text-gray);
    text-decoration: none;
    transition: var(--transition-normal);
    position: relative;
    padding-left: 15px;
}

.footer-section ul li a::before {
    content: '→';
    position: absolute;
    left: 0;
    opacity: 0;
    transition: var(--transition-normal);
}

.footer-section ul li a:hover {
    color: var(--text-light);
    padding-left: 20px;
}

.footer-section ul li a:hover::before {
    opacity: 1;
}

.social-links {
    display: flex;
    gap: 1rem;
}

.social-links a {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: rgba(255,255,255,0.1);
    transition: var(--transition-normal);
}

.social-links a:hover {
    background: var(--gradient-secondary);
    transform: translateY(-5px) rotate(360deg);
}

.footer-bottom {
    text-align: center;
    padding-top: 2rem;
    border-top: 1px solid #454545;
    color: #878787;
}

/* Responsive Design */
@media (max-width: 768px) {
    .header {
        flex-direction: column;
        gap: 1rem;
        padding: 1rem;
    }

    .search-container {
        width: 100%;
    }

    .nav-buttons {
        width: 100%;
        justify-content: space-between;
    }

    .nav-buttons button span {
        display: none;
    }

    .category-grid {
        grid-template-columns: repeat(2, 1fr);
    }
    
    .product-grid {
        grid-template-columns: repeat(2, 1fr);
    }
    
    .newsletter-form {
        flex-direction: column;
        gap: 1rem;
    }
    
    .newsletter-form button {
        width: 100%;
    }
}

@media (max-width: 480px) {
    .category-grid,
    .product-grid {
        grid-template-columns: 1fr;
    }
    
    .product-card {
        max-width: 300px;
        margin: 0 auto;
    }
}

/* Update the banner slider styles */
.banner-slider {
    position: relative;
    width: 100%;
    height: 300px;
    overflow: hidden;
    margin-bottom: 2rem;
}

.slider-content {
    position: relative;
    width: 100%;
    height: 100%;
}

.banner-images {
    position: relative;
    width: 100%;
    height: 100%;
}

.slide {
    position: absolute;
    width: 100%;
    height: 100%;
    opacity: 0;
    transition: opacity 0.5s ease-in-out;
    object-fit: cover;
}

.slide.active {
    opacity: 1;
}

.banner-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    color: var(--text-light);
    z-index: 2;
    width: 100%;
    padding: 0 20px;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.banner-text h2 {
    font-size: 2.5rem;
    margin-bottom: 1rem;
    animation: fadeInDown 0.5s ease-out;
}

.banner-text p {
    font-size: 1.2rem;
    margin-bottom: 1.5rem;
    animation: fadeInUp 0.5s ease-out;
}

.shop-now-btn {
    padding: 1rem 2.5rem;
    background: var(--gradient-secondary);
    border: none;
    border-radius: 25px;
    color: var(--text-light);
    font-size: 1.1rem;
    cursor: pointer;
    transition: var(--transition-normal);
    box-shadow: var(--box-shadow-md);
    animation: fadeInUp 0.7s ease-out;
}

.shop-now-btn:hover {
    transform: translateY(-2px);
    box-shadow: var(--box-shadow-lg);
    background: var(--gradient-primary);
}

/* Slider Controls */
.slider-controls {
    position: absolute;
    top: 50%;
    width: 100%;
    transform: translateY(-50%);
    z-index: 3;
    display: flex;
    justify-content: space-between;
    padding: 0 20px;
}

.prev-btn,
.next-btn {
    background: rgba(255, 255, 255, 0.3);
    border: none;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--text-light);
    transition: var(--transition-normal);
}

.prev-btn:hover,
.next-btn:hover {
    background: rgba(255, 255, 255, 0.5);
    transform: scale(1.1);
}

/* Slider Dots */
.slider-dots {
    position: absolute;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 10px;
    z-index: 3;
}

.dot {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.5);
    cursor: pointer;
    transition: var(--transition-normal);
}

.dot.active {
    background: var(--text-light);
    transform: scale(1.2);
}

/* Animations */
@keyframes fadeInDown {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Add this to your media queries */
@media (max-width: 768px) {
    .banner-text h2 {
        font-size: 2rem;
    }
    
    .banner-text p {
        font-size: 1rem;
    }
    
    .shop-now-btn {
        padding: 0.8rem 2rem;
        font-size: 1rem;
    }
}

@media (max-width: 480px) {
    .banner-text h2 {
        font-size: 1.5rem;
    }
    
    .slider-controls {
        display: none;
    }
}

/* Add these new styles for enhanced buttons */

/* Enhanced View Deal Button */
.view-deal-btn {
    width: 100%;
    padding: 12px 24px;
    background: linear-gradient(135deg, #2874f0, #1a5db4);
    color: white;
    border: none;
    border-radius: 25px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    overflow: hidden;
    position: relative;
    z-index: 1;
}

.view-deal-btn::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, #1a5db4, #2874f0);
    transition: all 0.5s ease;
    z-index: -1;
}

.view-deal-btn:hover::before {
    left: 0;
}

.view-deal-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(40, 116, 240, 0.3);
}

.view-deal-btn:hover i {
    transform: translateX(5px);
}

.view-deal-btn i {
    transition: transform 0.3s ease;
}

/* Enhanced Subscribe Button */
.subscribe-btn {
    padding: 15px 40px;
    background: linear-gradient(135deg, #ff9f00, #ff6b00);
    color: white;
    border: none;
    border-radius: 30px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    position: relative;
    overflow: hidden;
    font-size: 1.1rem;
}

.subscribe-btn::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle, rgba(255,255,255,0.3) 0%, transparent 70%);
    transform: scale(0);
    transition: transform 0.5s ease-out;
}

.subscribe-btn:hover::before {
    transform: scale(1);
}

.subscribe-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 20px rgba(255, 159, 0, 0.4);
}

.subscribe-btn:hover i {
    transform: translate(5px, -5px);
}

.subscribe-btn i {
    transition: transform 0.3s ease;
}

/* Newsletter Form Enhancement */
.newsletter-form {
    max-width: 600px;
    margin: 2rem auto;
    display: flex;
    gap: 1rem;
    padding: 0 1rem;
}

.newsletter-form input {
    flex: 1;
    padding: 15px 25px;
    border: none;
    border-radius: 30px;
    font-size: 1rem;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
}

.newsletter-form input:focus {
    outline: none;
    box-shadow: 0 4px 15px rgba(0,0,0,0.15);
    transform: translateY(-2px);
}

/* Responsive adjustments */
@media (max-width: 1200px) {
    .deals-grid {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media (max-width: 900px) {
    .deals-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 600px) {
    .deals-grid {
        grid-template-columns: 1fr;
    }
    
    .newsletter-form {
        flex-direction: column;
    }
    
    .subscribe-btn {
        width: 100%;
    }
}

@media (max-width: 1400px) {
    .product-grid {
        grid-template-columns: repeat(4, 1fr);
    }
}

@media (max-width: 1200px) {
    .product-grid {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media (max-width: 900px) {
    .product-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 480px) {
    .product-grid {
        grid-template-columns: 1fr;
    }
    
    .product-card {
        max-width: 300px;
        margin: 0 auto;
    }
}
</style>
</head>
<body>
    <header class="header">
        <div class="header-left">
            <h1>TapKart</h1>
            <span class="tagline">Explore Plus</span>
        </div>
        
        <div class="search-container">
            <input type="text" placeholder="Search for products, brands and more...">
            <button class="search-btn"><i class="fas fa-search"></i></button>
        </div>

        <div class="nav-buttons">
            <button><i class="fas fa-home"></i> <a href="#" style="text-decoration: none; color: white;">Home</a></button>
            <button><i class="fas fa-th-large"></i> <a href="#categories-section" style="text-decoration: none; color: white;">Categories</a></button>
            <button><i class="fas fa-tags"></i> <a href="#deals-section" style="text-decoration: none; color: white;">Deals</a></button>
            <button><i class="fas fa-shopping-cart"></i><a href="CallingCart2Servlet" style="text-decoration: none; color: white;">Cart</a></button>
            <button><i class="fas fa-user"></i><a href="profile.jsp" style="color:white; text-decoration: none;">Profile</a></button>
        </div>
    </header>

    <main>
        <!-- Welcome Banner with Slider -->
        <section class="banner-slider">
            <div class="slider-content">
                <div class="banner-images">
                    <img src="https://www.chawlamedicos.com/images/shipping-banner.jpg" alt="Banner 1" class="slide active">
                    <img src="https://via.placeholder.com/1200x300" alt="Banner 2" class="slide">
                    <img src="https://via.placeholder.com/1200x300" alt="Banner 3" class="slide">
                </div>
                <div class="banner-text">
                    <h2>Welcome to TapKart</h2>
                    <p>Discover Amazing Deals & Offers</p>
                    <button class="shop-now-btn">Shop Now</button>
                </div>
                <div class="slider-controls">
                    <button class="prev-btn"><i class="fas fa-chevron-left"></i></button>
                    <button class="next-btn"><i class="fas fa-chevron-right"></i></button>
                </div>
                <div class="slider-dots">
                    <span class="dot active"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </div>
            </div>
        </section>

        <!-- Categories Section -->
        <section id="categories-section" class="categories-section">
            <h2>Shop By Category</h2>
            <div class="category-grid">
                <div class="category-card">
                    <i class="fas fa-mobile-alt"></i>
                    <h3>Electronics</h3>
                    <p>Up to 40% off</p>
                </div>
                <div class="category-card">
                    <i class="fas fa-tshirt"></i>
                    <h3>Fashion</h3>
                    <p>50-80% off</p>
                </div>
                <div class="category-card">
                    <i class="fas fa-home"></i>
                    <h3>Home & Living</h3>
                    <p>From ₹199</p>
                </div>
                <div class="category-card">
                    <i class="fas fa-laptop"></i>
                    <h3>Computers</h3>
                    <p>Up to 30% off</p>
                </div>
                <div class="category-card">
                    <i class="fas fa-gamepad"></i>
                    <h3>Gaming</h3>
                    <p>Starting ₹999</p>
                </div>
                <div class="category-card">
                    <i class="fas fa-dumbbell"></i>
                    <h3>Sports</h3>
                    <p>Min 20% off</p>
                </div>
            </div>
        </section>

        <!-- Featured Products -->
        <section class="featured-products">
            <h2>Featured Products</h2>
            <div class="product-grid">
            <%
			List<Category> r = (List<Category>) request.getAttribute("Categories");
			if (r != null && !r.isEmpty()) {
				for (Category cate : r) {
			%>
           <form action="CallingParticularProductsServlet?categoryId=<%=cate.getCategoryId()%>" method="post">
                <div class="product-card">
                    <div class="product-badge">Bestseller</div>
                    <img src="<%=cate.getImagePath() %>" alt="Smartphone">
                    <h3><%=cate.getCategoryName()%></h3>
                    <p class="price"><%=cate.getCategoryDescription()%><span class="original-price">₹59,999</span></p>
                    <p class="discount">20% off</p>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <span>(245)</span>
                    </div>
                    <button class="add-to-cart-btn">Explore Products</button>
                </div>
                </form>
                <%
			}
			} else {
			out.println("No Restaurants found.");
			}
			%>           
        </section>

        <!-- Deals Section -->
        <section id="deals-section" class="deals-section">
            <h2>Today's Deals</h2>
            <div class="deals-grid">
                <div class="deal-card">
                    <div class="discount-badge">-50%</div>
                    <img src="data:image/jpeg;base64,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" alt="Flash Deal">
                    <h3>Flash Sale!</h3>
                    <p class="deal-timer">Ends in: 05:23:45</p>
                    <p class="deal-description">Premium Smartphones</p>
                    <button class="view-deal-btn">
                        <span>View Deal</span>
                        <i class="fas fa-arrow-right"></i>
                    </button>
                </div>

                <div class="deal-card">
                    <div class="discount-badge">-60%</div>
                    <img src="data:image/jpeg;base64,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" alt="Special Deal">
                    <h3>Special Offer</h3>
                    <p class="deal-timer">Ends in: 02:45:18</p>
                    <p class="deal-description">Fashion & Accessories</p>
                    <button class="view-deal-btn">
                        <span>View Deal</span>
                        <i class="fas fa-arrow-right"></i>
                    </button>
                </div>

                <div class="deal-card">
                    <div class="discount-badge">-35%</div>
                    <img src="data:image/jpeg;base64,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" alt="Clearance Deal">
                    <h3>Clearance Sale</h3>
                    <p class="deal-timer">Ends in: 08:15:30</p>
                    <p class="deal-description">Home Appliances</p>
                    <button class="view-deal-btn">
                        <span>View Deal</span>
                        <i class="fas fa-arrow-right"></i>
                    </button>
                </div>

                <div class="deal-card">
                    <div class="discount-badge">-45%</div>
                    <img src="data:image/jpeg;base64,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" alt="Tech Deal">
                    <h3>Tech Bonanza</h3>
                    <p class="deal-timer">Ends in: 03:45:20</p>
                    <p class="deal-description">Latest Gadgets</p>
                    <button class="view-deal-btn">
                        <span>View Deal</span>
                        <i class="fas fa-arrow-right"></i>
                    </button>
                </div>

                <div class="deal-card">
                    <div class="discount-badge">-70%</div>
                    <img src="data:image/jpeg;base64,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" alt="Mega Deal">
                    <h3>Mega Discount</h3>
                    <p class="deal-timer">Ends in: 01:30:15</p>
                    <p class="deal-description">Limited Stock</p>
                    <button class="view-deal-btn">
                        <span>View Deal</span>
                        <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </section>

        <!-- Newsletter Section -->
        <section class="newsletter-section">
            <center><h2>Subscribe to Our Newsletter</h2></center>
            <center><p>Get updates about new products and special offers!</p></center>
            <div class="newsletter-form">
                <input type="email" placeholder="Enter your email address">
                <button class="subscribe-btn">
                    <span>Subscribe</span>
                    <i class="fas fa-paper-plane"></i>
                </button>
            </div>
        </section>
    </main>

    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>Customer Support</h3>
                <ul>
                    <li><a href="#">Help Center</a></li>
                    <li><a href="#">Track Order</a></li>
                    <li><a href="#">Returns & Refunds</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">FAQ</a></li>
                </ul>
            </div>
            
            <div class="footer-section">
                <h3>Policies</h3>
                <ul>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of Service</a></li>
                    <li><a href="#">Shipping Policy</a></li>
                    <li><a href="#">Return Policy</a></li>
                    <li><a href="#">Security</a></li>
                </ul>
            </div>
            
            <div class="footer-section">
                <h3>About Us</h3>
                <ul>
                    <li><a href="#">Our Story</a></li>
                    <li><a href="#">Careers</a></li>
                    <li><a href="#">Press</a></li>
                    <li><a href="#">Blog</a></li>
                </ul>
            </div>

            <div class="footer-section">
                <h3>Connect With Us</h3>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                    <a href="#"><i class="fab fa-pinterest"></i></a>
                </div>
                <div class="app-downloads">
                    <h4>Download Our App</h4>
                    <div class="app-buttons">
                        <a href="#" ><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-w_85zZdcNq5iBqWcAFf08VfWS7jn2-Hlow&s" alt="App Store" width="120" height="40"></a>
                        <a href="#" ><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsNYwEfwyyF_WQ_ZPLp4E5ZOgWXgSBoqZW_5zDt1YBDLQFUbXAqorTCqBS3wDkusCXqA&usqp=CAU" alt="Play Store" width="120" height="40"></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>© 2024 TapKart. All rights reserved.</p>
            <div class="payment-methods">
                <i class="fab fa-cc-visa"></i>
                <i class="fab fa-cc-mastercard"></i>
                <i class="fab fa-cc-amex"></i>
                <i class="fab fa-cc-paypal"></i>
            </div>
        </div>
    </footer>

</html>
    