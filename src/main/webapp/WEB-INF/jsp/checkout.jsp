<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.tapkart.model.Cart"%>
<%@ page import="com.tapkart.model.CartItem"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success - TapKart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #14279B;
            --secondary-color: #3B82F6;
            --success-color: #10B981;
            --text-dark: #1F2937;
            --text-light: #6B7280;
            --bg-light: #F3F4F6;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background-color: var(--bg-light);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .success-container {
            background: white;
            border-radius: 16px;
            padding: 40px;
            max-width: 600px;
            width: 100%;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .success-icon {
            width: 80px;
            height: 80px;
            background: var(--success-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 24px;
            animation: scaleIn 0.5s ease;
        }

        .success-icon i {
            color: white;
            font-size: 40px;
        }

        h1 {
            color: var(--text-dark);
            margin-bottom: 16px;
            font-size: 28px;
        }

        .order-number {
            color: var(--text-light);
            margin-bottom: 32px;
            font-size: 16px;
        }

        .order-details {
            background: var(--bg-light);
            padding: 24px;
            border-radius: 12px;
            margin-bottom: 32px;
            text-align: left;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            color: var(--text-dark);
        }

        .detail-row:last-child {
            margin-bottom: 0;
        }

        .detail-label {
            color: var(--text-light);
            font-weight: 500;
        }

        .detail-value {
            font-weight: 600;
        }

        .buttons {
            display: flex;
            gap: 16px;
            justify-content: center;
        }

        .btn {
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            font-size: 16px;
        }

        .primary-btn {
            background: var(--primary-color);
            color: white;
        }

        .primary-btn:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
        }

        .secondary-btn {
            background: white;
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
        }

        .secondary-btn:hover {
            background: var(--bg-light);
            transform: translateY(-2px);
        }

        .delivery-status {
            margin: 32px 0;
            position: relative;
        }

        .status-line {
            height: 4px;
            background: var(--bg-light);
            position: relative;
            margin: 20px 0;
            border-radius: 2px;
        }

        .status-progress {
            position: absolute;
            height: 100%;
            width: 33%;
            background: var(--success-color);
            border-radius: 2px;
            transition: width 0.5s ease;
        }

        .status-steps {
            display: flex;
            justify-content: space-between;
            margin-top: 8px;
        }

        .step {
            text-align: center;
            color: var(--text-light);
            font-size: 14px;
        }

        .step.active {
            color: var(--success-color);
            font-weight: 600;
        }

        @keyframes scaleIn {
            from {
                transform: scale(0);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        @media (max-width: 480px) {
            .success-container {
                padding: 24px;
            }

            .buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="success-container">
        <div class="success-icon">
            <i class="fas fa-check"></i>
        </div>
        <h1>Order Placed Successfully!</h1>
        <p class="order-number">Order #TK12345678</p>

        <div class="order-details">
            <div class="detail-row">
                <span class="detail-label">Order Date</span>
                <span class="detail-value">December 04,2024</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Delivery Expected</span>
                <span class="detail-value">December 07,2024</span>
            </div>
            <div class="detail-row">
            <% 
                            Cart cart = (Cart) session.getAttribute("cart");
                            if (cart != null) {
                                double totalPrice = (double) session.getAttribute("totalPrice");
                                DecimalFormat df = new DecimalFormat("#.##");

                                for (CartItem item : cart.getItems().values()) {
                                    double itemTotal = item.getPrice() * item.getQuantity();
                        %>
						<tr>
							<td><%= item.getName() %></td>
							<td>&#x20B9;<%= item.getPrice() %></td>
							<td><%= item.getQuantity() %></td>
							<td>&#x20B9;<%= df.format(itemTotal) %></td>
						</tr>
						<% 
                                
                            }
                        %>
					</tbody>
				</table>
				<div class="total-price">
					<% if (session.getAttribute("totalPrice") != null) { %>
					<p>
						Total Price: &#x20B9;<%= df.format(totalPrice) %></p>
					<% }
                    }%>
				</div>
				<br><br>
            <div class="detail-row">
                <span class="detail-label">Payment Method</span>
                <span class="detail-value">Credit Card (**** 1234)</span>
            </div>
        </div>

        <div class="delivery-status">
            <div class="status-line">
                <div class="status-progress"></div>
            </div>
            <div class="status-steps">
                <div class="step active">
                    <i class="fas fa-check-circle"></i>
                    <p>Order Confirmed</p>
                </div>
                <div class="step">
                    <i class="fas fa-box"></i>
                    <p>Processing</p>
                </div>
                <div class="step">
                    <i class="fas fa-truck"></i>
                    <p>Shipping</p>
                </div>
                <div class="step">
                    <i class="fas fa-home"></i>
                    <p>Delivered</p>
                </div>
            </div>
        </div>

        <div class="buttons">
            <button class="btn primary-btn">Track Order</button>
            <a href="CallingHomeProductServlet"><button class="btn secondary-btn">Continue Shopping</button></a>
        </div>
    </div>
</body>
</html>