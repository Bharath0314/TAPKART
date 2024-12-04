<%@ page import="java.util.List"%>
<%@ page import="com.tapkart.model.Product"%>
<%@ page import="com.tapkart.model.Product"%>

<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet"
	href="https://fonts.cdnfonts.com/css/proxima-nova-condensed">
<title>Menu</title>
<style>
/* Import Google Fonts */
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap')
	;

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
	--box-shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.1);
	--box-shadow-md: 0 4px 12px rgba(0, 0, 0, 0.15);
	--box-shadow-lg: 0 8px 24px rgba(0, 0, 0, 0.2);
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
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
	position: relative;
	overflow: hidden;
}

.deal-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
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

@
keyframes pulse { 0% {
	transform: scale(1);
}

50
%
{
transform
:
scale(
1.1
);
}
100
%
{
transform
:
scale(
1
);
}
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
	background: rgba(255, 255, 255, 0.1);
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
@media ( max-width : 768px) {
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

@media ( max-width : 480px) {
	.category-grid, .product-grid {
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

.prev-btn, .next-btn {
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

.prev-btn:hover, .next-btn:hover {
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
@
keyframes fadeInDown {from { opacity:0;
	transform: translateY(-20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes fadeInUp {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* Add this to your media queries */
@media ( max-width : 768px) {
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

@media ( max-width : 480px) {
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
	background: radial-gradient(circle, rgba(255, 255, 255, 0.3) 0%,
		transparent 70%);
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
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
}

.newsletter-form input:focus {
	outline: none;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
	transform: translateY(-2px);
}

/* Responsive adjustments */
@media ( max-width : 1200px) {
	.deals-grid {
		grid-template-columns: repeat(3, 1fr);
	}
}

@media ( max-width : 900px) {
	.deals-grid {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 600px) {
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

@media ( max-width : 1400px) {
	.product-grid {
		grid-template-columns: repeat(4, 1fr);
	}
}

@media ( max-width : 1200px) {
	.product-grid {
		grid-template-columns: repeat(3, 1fr);
	}
}

@media ( max-width : 900px) {
	.product-grid {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 480px) {
	.product-grid {
		grid-template-columns: 1fr;
	}
	.product-card {
		max-width: 300px;
		margin: 0 auto;
	}
}

/* Add these new styles for the product details page */
.product-details-page {
	padding: 2rem 5%;
	background: var(--bg-light);
}

.breadcrumb {
	margin-bottom: 2rem;
	color: var(--text-gray);
}

.breadcrumb a {
	color: var(--primary-color);
	text-decoration: none;
}

.breadcrumb a:hover {
	text-decoration: underline;
}

.product-details-container {
	display: grid;
	grid-template-columns: 1fr 1.5fr;
	gap: 2rem;
	background: var(--text-light);
	padding: 2rem;
	border-radius: 12px;
	box-shadow: var(--box-shadow-sm);
}

.product-gallery {
	position: sticky;
	top: 100px;
}

.main-image {
	margin-bottom: 1rem;
	border-radius: 8px;
	overflow: hidden;
}

.main-image img {
	width: 100%;
	height: auto;
	transition: transform 0.3s ease;
}

.main-image:hover img {
	transform: scale(1.05);
}

.thumbnail-images {
	display: flex;
	gap: 1rem;
	margin-bottom: 1rem;
}

.thumbnail-images img {
	width: 70px;
	height: 70px;
	border-radius: 8px;
	cursor: pointer;
	border: 2px solid transparent;
	transition: all 0.3s ease;
}

.thumbnail-images img.active, .thumbnail-images img:hover {
	border-color: var(--primary-color);
	transform: translateY(-2px);
}

.action-buttons {
	display: flex;
	gap: 1rem;
	margin-top: 2rem;
}

.action-buttons button {
	flex: 1;
	padding: 1rem;
	border: none;
	border-radius: 8px;
	font-weight: 600;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 0.5rem;
	transition: all 0.3s ease;
}

.add-to-cart-btn {
	background: var(--gradient-primary);
	color: var(--text-light);
}

.buy-now-btn {
	background: var(--gradient-secondary);
	color: var(--text-light);
}

.action-buttons button:hover {
	transform: translateY(-2px);
	box-shadow: var(--box-shadow-md);
}

.product-info h1 {
	font-size: 2rem;
	margin-bottom: 1rem;
	color: var(--text-dark);
}

.rating-section {
	display: flex;
	align-items: center;
	gap: 1rem;
	margin-bottom: 1rem;
}

.rating {
	background: var(--accent-color);
	color: var(--text-light);
	padding: 0.3rem 0.6rem;
	border-radius: 4px;
	display: flex;
	align-items: center;
	gap: 0.3rem;
}

.rating i {
	color: #ffd700;
}

.price-section {
	display: flex;
	align-items: center;
	gap: 1rem;
	margin: 1.5rem 0;
}

.current-price {
	font-size: 2rem;
	font-weight: 600;
	color: var(--text-dark);
}

.original-price {
	font-size: 1.2rem;
	color: var(--text-gray);
	text-decoration: line-through;
}

.discount {
	color: var(--accent-color);
	font-weight: 600;
}

.offers-section {
	margin: 2rem 0;
	padding: 1rem;
	background: #f8f9fa;
	border-radius: 8px;
}

.offers-section ul {
	list-style: none;
}

.offers-section li {
	display: flex;
	align-items: center;
	gap: 0.5rem;
	margin: 0.8rem 0;
	color: var(--text-dark);
}

.offers-section i {
	color: var(--accent-color);
}

.variants-section {
	margin: 2rem 0;
}

.color-buttons, .storage-buttons {
	display: flex;
	gap: 1rem;
	margin: 1rem 0;
}

.color-btn, .storage-btn {
	padding: 0.8rem 1.5rem;
	border: 2px solid transparent;
	border-radius: 6px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.color-btn.active, .storage-btn.active {
	border-color: var(--primary-color);
	transform: scale(1.05);
}

.delivery-section {
	margin: 2rem 0;
}

.pincode-checker {
	display: flex;
	gap: 1rem;
	margin: 1rem 0;
}

.pincode-checker input {
	flex: 1;
	padding: 0.8rem;
	border: 1px solid #ddd;
	border-radius: 6px;
}

.pincode-checker button {
	padding: 0.8rem 1.5rem;
	background: var(--primary-color);
	color: var(--text-light);
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.delivery-info {
	display: flex;
	align-items: center;
	gap: 0.5rem;
	color: var(--accent-color);
	margin-top: 1rem;
}

.product-details-tabs {
	margin: 2rem 0;
	background: var(--text-light);
	border-radius: 12px;
	padding: 2rem;
	box-shadow: var(--box-shadow-sm);
}

.tabs-header {
	display: flex;
	gap: 1rem;
	border-bottom: 1px solid #ddd;
	margin-bottom: 2rem;
}

.tab-btn {
	padding: 1rem 2rem;
	border: none;
	background: none;
	cursor: pointer;
	font-weight: 500;
	color: var(--text-gray);
	position: relative;
}

.tab-btn.active {
	color: var(--primary-color);
}

.tab-btn.active::after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 0;
	width: 100%;
	height: 3px;
	background: var(--primary-color);
}

/* Responsive Design */
@media ( max-width : 1024px) {
	.product-details-container {
		grid-template-columns: 1fr;
	}
	.product-gallery {
		position: static;
	}
}

@media ( max-width : 768px) {
	.action-buttons {
		flex-direction: column;
	}
	.tabs-header {
		overflow-x: auto;
		white-space: nowrap;
	}
}

/* Add these new styles for the category page */
.category-page {
	padding: 2rem 5%;
	background: var(--bg-light);
}

.category-container {
	display: grid;
	grid-template-columns: 250px 1fr;
	gap: 2rem;
	margin-top: 2rem;
}

/* Filters Sidebar */
.filters-sidebar {
	background: var(--text-light);
	padding: 1.5rem;
	border-radius: 12px;
	box-shadow: var(--box-shadow-sm);
	height: fit-content;
	position: sticky;
	top: 100px;
}

.filter-section {
	margin-bottom: 1.5rem;
	padding-bottom: 1.5rem;
	border-bottom: 1px solid #eee;
}

.filter-section:last-child {
	border-bottom: none;
	margin-bottom: 0;
	padding-bottom: 0;
}

.filter-section h3 {
	margin-bottom: 1rem;
	color: var(--text-dark);
	font-size: 1.1rem;
}

/* Price Range Slider */
.price-range input[type="range"] {
	width: 100%;
	margin-bottom: 1rem;
}

.price-inputs {
	display: flex;
	align-items: center;
	gap: 0.5rem;
}

.price-inputs input {
	width: 80px;
	padding: 0.5rem;
	border: 1px solid #ddd;
	border-radius: 4px;
}

/* Checkbox and Radio Styles */
.checkbox-group, .radio-group {
	display: flex;
	flex-direction: column;
	gap: 0.8rem;
}

.checkbox-group label, .radio-group label {
	display: flex;
	align-items: center;
	gap: 0.5rem;
	color: var(--text-dark);
	cursor: pointer;
}

/* Products Section */
.products-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 2rem;
}

.sort-options select {
	padding: 0.8rem;
	border: 1px solid #ddd;
	border-radius: 6px;
	cursor: pointer;
}

.products-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
	gap: 1.5rem;
	margin-bottom: 2rem;
}

/* Pagination */
.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 0.5rem;
	margin-top: 2rem;
}

.pagination button {
	padding: 0.8rem 1.2rem;
	border: none;
	background: var(--text-light);
	border-radius: 6px;
	cursor: pointer;
	transition: all 0.3s ease;
}

.pagination .page-number.active {
	background: var(--primary-color);
	color: var(--text-light);
}

.pagination button:hover {
	background: var(--primary-color);
	color: var(--text-light);
}

/* Responsive Design */
@media ( max-width : 1024px) {
	.category-container {
		grid-template-columns: 200px 1fr;
	}
}

@media ( max-width : 768px) {
	.category-container {
		grid-template-columns: 1fr;
	}
	.filters-sidebar {
		position: static;
		margin-bottom: 2rem;
	}
	.products-header {
		flex-direction: column;
		gap: 1rem;
		align-items: flex-start;
	}
}

/* Styles for the product collection page */
.product-collection {
	padding: 2rem 5%;
	background: #f5f5f5;
	min-height: 100vh;
}

.collection-title {
	text-align: center;
	font-size: 2.5rem;
	color: #333;
	margin-bottom: 3rem;
	position: relative;
}

.collection-title::after {
	content: '';
	position: absolute;
	bottom: -10px;
	left: 50%;
	transform: translateX(-50%);
	width: 100px;
	height: 3px;
	background: linear-gradient(90deg, #2874f0, #fb641b);
}

.collection-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 2rem;
	padding: 1rem;
}

.collection-card {
	background: white;
	border-radius: 15px;
	padding: 1.5rem;
	position: relative;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.collection-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
}

.brand-tag {
	position: absolute;
	top: 1rem;
	right: 1rem;
	background: #2874f0;
	color: white;
	padding: 0.5rem 1rem;
	border-radius: 20px;
	font-size: 0.9rem;
	font-weight: 500;
}

.collection-card img {
	width: 100%;
	height: 300px;
	object-fit: contain;
	margin-bottom: 1.5rem;
	transition: transform 0.3s ease;
}

.collection-card:hover img {
	transform: scale(1.05);
}

.card-content h2 {
	font-size: 1.5rem;
	color: #333;
	margin-bottom: 1rem;
}

.variants {
	display: flex;
	gap: 0.5rem;
	margin-bottom: 1rem;
}

.variant-btn {
	padding: 0.5rem 1rem;
	border: 2px solid #e0e0e0;
	border-radius: 20px;
	background: none;
	cursor: pointer;
	transition: all 0.3s ease;
}

.variant-btn.active {
	background: #2874f0;
	color: white;
	border-color: #2874f0;
}

.colors {
	display: flex;
	gap: 0.5rem;
	margin-bottom: 1.5rem;
}

.color-btn {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	border: 2px solid #e0e0e0;
	cursor: pointer;
	transition: transform 0.3s ease;
}

.color-btn:hover {
	transform: scale(1.1);
}

.price-tag {
	display: flex;
	align-items: center;
	gap: 1rem;
	margin-bottom: 1rem;
}

.current-price {
	font-size: 1.5rem;
	font-weight: 600;
	color: #333;
}

.original-price {
	color: #666;
	text-decoration: line-through;
}

.discount {
	color: #388e3c;
	font-weight: 500;
}

.rating {
	display: flex;
	align-items: center;
	gap: 0.3rem;
	margin-bottom: 1.5rem;
}

.rating i {
	color: #ffd700;
}

.rating span {
	color: #666;
	font-size: 0.9rem;
}

.buy-now-btn {
	width: 100%;
	padding: 1rem;
	background: linear-gradient(90deg, #2874f0, #fb641b);
	color: white;
	border: none;
	border-radius: 25px;
	font-size: 1.1rem;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	overflow: hidden;
}

.buy-now-btn::before {
	content: '';
	position: absolute;
	top: -50%;
	left: -50%;
	width: 200%;
	height: 200%;
	background: radial-gradient(circle, rgba(255, 255, 255, 0.3) 0%,
		transparent 70%);
	transform: scale(0);
	transition: transform 0.5s ease-out;
}

.buy-now-btn:hover::before {
	transform: scale(1);
}

.buy-now-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(40, 116, 240, 0.3);
}

/* Responsive Design */
@media ( max-width : 768px) {
	.collection-grid {
		grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	}
	.collection-card {
		padding: 1rem;
	}
	.collection-card img {
		height: 250px;
	}
}

@media ( max-width : 480px) {
	.product-collection {
		padding: 1rem;
	}
	.collection-title {
		font-size: 2rem;
	}
	.card-content h2 {
		font-size: 1.3rem;
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
		<input type="text"
			placeholder="Search for products, brands and more...">
		<button class="search-btn">
			<i class="fas fa-search"></i>
		</button>
	</div>

	<div class="nav-buttons">
		<button>
			<i class="fas fa-home"></i> Home
		</button>
		<button>
			<i class="fas fa-th-large"></i> Categories
		</button>
		<button>
			<i class="fas fa-tags"></i> Deals
		</button>
		<button>
			<i class="fas fa-shopping-cart"></i> Cart
		</button>
		<button>
			<i class="fas fa-user"></i> Login
		</button>
	</div>
	</header>

	<main class="category-page">
	<div class="breadcrumb">
		<a href="index.html">Home</a> / <span>Smartphones</span>
	</div>

	<div class="category-container">
		<!-- Filters Sidebar -->
		<aside class="filters-sidebar">
		<div class="filter-section">
			<h3>Price Range</h3>
			<div class="price-range">
				<input type="range" min="0" max="100000" value="50000">
				<div class="price-inputs">
					<input type="number" placeholder="Min" value="0"> <span>to</span>
					<input type="number" placeholder="Max" value="100000">
				</div>
			</div>
		</div>
		<div class="filter-section">
			<h3>Customer Rating</h3>
			<div class="radio-group">
				<label><input type="radio" name="rating"> 4★ & above</label>
				<label><input type="radio" name="rating"> 3★ & above</label>
				<label><input type="radio" name="rating"> 2★ & above</label>
			</div>
		</div>
		</aside>

		<!-- Products Grid -->
		<div class="products-section">
			<div class="products-header">
				<h2>Smartphones </h2>
				<div class="sort-options">
					<select>
						<option>Sort by: Featured</option>
						<option>Price: Low to High</option>
						<option>Price: High to Low</option>
						<option>Customer Rating</option>
						<option>Newest First</option>
					</select>
				</div>
			</div>

			<div class="products-grid">
				<% List<Product> productAll = (List<Product>) request.getAttribute("particularProducts");
         if (productAll!= null && !productAll.isEmpty()) {
		for (Product pro : productAll) 
		{
		%>
				<form action="CallingCartServlet?productId="<%=pro.getProductId()%>" method="get" class="form-container">
					<div class="product-card">
						<div class="product-badge">New</div>
						<img src="<%=pro.getImagePath() %>>" alt="Smartphone">
							<input type="hidden" name="itemId"
							value="<%=pro.getProductId()%>" />
							<h3><%=pro.getName() %></h3>
							<h3><%=pro.getDescription() %></h3>
							<h5>
								Last:
								<%=pro.getQuantityInStock() %>
								Products
							</h5>
							<p class="price">
								₹<%=pro.getPrice() %>
								<span class="original-price">₹159,999</span>
							</p>
							<p class="discount">10% off</p>
							<div class="rating">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star-half-alt"></i> <span>(245)</span>
							</div> <label for="quantity" min:"1" value="1"
							style="display: inline-block; margin-right: 10px;">Quantity:</label>
							<input type="number" id="quantity" name="quantity" min="1" value:"1"
							style="display: inline-block; padding: 5px; font-size: 1rem; width: 80px; border: 1px solid #ccc; border-radius: 4px; margin-right: 10px;">
								<br></br>
								<button name="action" value="add" class="add-to-cart-btn">Add to Cart</button>
			</div>
				</form>
			<%
			}
			} else {
			out.println("No Restaurants found.");
			}
			%>
			<!-- Repeat similar product cards -->
			<!-- Add more product cards here -->
		</div>

		<!-- Pagination -->
		<div class="pagination">
			<button class="prev-page">
				<i class="fas fa-chevron-left"></i>
			</button>
			<button class="page-number active">1</button>
			<button class="page-number">2</button>
			<button class="page-number">3</button>
			<span>...</span>
			<button class="page-number">10</button>
			<button class="next-page">
				<i class="fas fa-chevron-right"></i>
			</button>
		</div>
	</div>
	</div>
	</main>

	<footer class="footer"> <!-- Footer content remains the same -->
	</footer>
</body>
</html>
