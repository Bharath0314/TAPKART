<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tapkart.model.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tap Foods</title>
    <link rel="icon" href="http://localhost:8080/tapfoods/Images/icon.png">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .box {
            width: 450px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
        }

        .signup h1 {
            font-size: 28px;
            color: #2d3436;
            text-align: center;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 10px;
        }

        .signup h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: #fc8019;
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #666;
            font-size: 14px;
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 15px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 16px;
            background: #f8f9fa;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            border-color: #fc8019;
            box-shadow: 0 0 0 4px rgba(252, 128, 25, 0.1);
            outline: none;
        }

        .form-group input[readonly] {
            background-color: #f1f3f5;
            cursor: not-allowed;
        }

        .submit {
            text-align: center;
            margin-top: 30px;
        }

        .submit input {
            background: linear-gradient(45deg, #fc8019, #ff9f4a);
            color: white;
            padding: 15px 40px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
        }

        .submit input:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(252, 128, 25, 0.3);
        }

        .login {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .login h4 {
            color: #666;
            font-size: 14px;
        }

        .login a {
            color: #fc8019;
            text-decoration: none;
            font-weight: 600;
        }

        .login a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .box {
                width: 100%;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="box">
        <div class="signup">
        <%
		User user = (User) session.getAttribute("user");
		%>
            <h1><%=user.getName()%> Details</h1>
        </div>
        <form action="EditUserDetails.jsp" method="post">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" 
                    value="<%=user.getName()%>" 
                    pattern="[A-Za-z\s]{3,}"
                    title="Name should contain only letters and spaces"
                    readonly>
            </div>

            <div class="form-group">
                <label for="userName">Username</label>
                <input type="text" id="userName" name="userName" 
                    value="<%=user.getUserName()%>"
                    pattern="[a-zA-Z][a-zA-Z0-9_]{2,}"
                    title="Start with a letter, only letters, numbers and underscore allowed"
                    readonly>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" 
                    value="<%=user.getEmail()%>"
                    title="Enter a valid email address"
                    readonly>
            </div>

            <div class="form-group">
                <label for="phoneNo">Phone Number</label>
                <input type="tel" id="phoneNo" name="phoneNo" 
                    value="<%=user.getPhoneNo()%>"
                    pattern="[6-9][0-9]{9}"
                    title="Enter 10-digit mobile number starting with 6-9"
                    readonly>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" 
                    value="<%=user.getAddress() != null ? user.getAddress() : ""%>"
                    pattern="[A-Za-z0-9\s,-]{3,}"
                    title="Enter a valid address"
                    <%=user.getAddress() != null ? "readonly" : ""%>
                    required>
            </div>

            <div class="submit">
                <input type="submit" value="Edit">
            </div>

            <!-- Keep your existing login/back section -->
            <div class="login">
                    <h4>
					
				<%String isthismenu = (String)session.getAttribute("isthismenu");
				  String isthiscart = (String)session.getAttribute("isthiscart");
				  String isthischeckout = (String)session.getAttribute("isthischeckout");
				  String isthisconfirm = (String)session.getAttribute("isthisconfirm");
				  String isthishistory = (String)session.getAttribute("isthishistory");
				  String isthisviewcart = (String)session.getAttribute("isthisviewcart");
				  
				  
				     if(isthismenu !=null&&isthismenu.equalsIgnoreCase("menu")){ 
					 %>
					 Change Your Mind?<a href="Menu.jsp">Go Back</a>
						
						<%
						}
						else if(isthiscart !=null&&isthiscart.equalsIgnoreCase("cart"))
						{
						%>
						Change Your Mind?<a href="Cart.jsp">Go Back</a>
						<%
						}
						else if(isthischeckout !=null&&isthischeckout.equalsIgnoreCase("checkout"))
						{
						%>
						Change Your Mind?<a href="CheckOut.jsp">Go Back</a>
						<%
						}
						else if(isthisconfirm !=null && isthisconfirm.equalsIgnoreCase("confirm"))
						{
						%>
						Change Your Mind?<a href="OrderConfirm.jsp">Go Back</a>
						<%
						}
						else if(isthishistory !=null&&isthishistory.equalsIgnoreCase("history"))
						{
						%>
						Change Your Mind?<a href="OrderHistory.jsp">Go Back</a>
						<%
						}
						else if(isthisviewcart !=null&& isthisviewcart.equalsIgnoreCase("viewcart"))
						{
						%>
						Change Your Mind?<a href="ViewCart.jsp">Go Back</a>
						<%
						}
						else
						{
						%>
						Change Your Mind?<a href="CallingHomeProductServlet">Go Back</a>
						<%
						}
						%>
					</h4>
            </div>
        </form>
    </div>
</body>
</html>
					