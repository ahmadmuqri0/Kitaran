<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kitaran.bean.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="globals.css" rel="stylesheet">
    <title>Admin - Kitaran</title>
    
    <style>
        /* Simple Input Page Styles */
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: var(--bg-accent);
        }
        
        .app-container {
            display: flex;
            min-height: 100vh;
        }
        
     
        
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: var(--primary);
            margin-bottom: 40px;
        }
        
        .logo span {
            color: var(--accent);
        }
        
        .nav-links {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        
        .nav-links a {
            padding: 12px 15px;
            text-decoration: none;
            color: var(--neutral-700);
            border-radius: 8px;
            transition: 0.3s;
        }
        
        .nav-links a:hover {
            background: var(--neutral-100);
        }
        
        .nav-links a.active {
            background: var(--bg-accent);
            color: var(--accent);
            font-weight: bold;
        }
        
        .nav-links .logout {
            color: var(--danger);
            margin-top: auto;
        }
        
        /* Main Content */
        .main-content {
            flex: 1;
            padding: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        /* Form Box */
        .box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: var(--shadow-md);
            width: 100%;
            max-width: 600px;
        }
        
        .box h2 {
            color: var(--primary);
            margin-bottom: 10px;
        }
        
        .box p {
            color: var(--neutral-600);
            margin-bottom: 25px;
            font-size: 14px;
        }
        
        /* Alert Messages */
        .alert {
            padding: 12px 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 14px;
        }
        
        .alert-success {
            background: hsl(145, 55%, 95%);
            color: hsl(145, 55%, 35%);
            border-left: 4px solid var(--success);
        }
        
        .alert-error {
            background: hsl(5, 75%, 95%);
            color: hsl(5, 75%, 45%);
            border-left: 4px solid var(--danger);
        }
        
        .alert-info {
            background: hsl(210, 80%, 95%);
            color: hsl(210, 80%, 40%);
            border-left: 4px solid hsl(210, 80%, 55%);
        }
        
        /* Form Elements */
        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        label {
            font-weight: 500;
            color: var(--neutral-700);
            font-size: 14px;
            margin-bottom: 5px;
            display: block;
        }
        
        select, input[type="text"] {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid var(--neutral-300);
            border-radius: 8px;
            font-size: 14px;
            transition: 0.3s;
            background: white;
        }
        
        select:focus, input[type="text"]:focus {
            outline: none;
            border-color: var(--accent);
            box-shadow: 0 0 0 3px rgba(107, 35, 51, 0.1);
        }
        
        /* Button */
        .btn {
            background: var(--accent);
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 10px;
        }
        
        .btn:hover {
            background: hsl(107, 35%, 45%);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }
        
        /* Mobile Responsive */
        @media (max-width: 768px) {
            .app-container {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                padding: 15px;
            }
            
            .nav-links {
                flex-direction: row;
                flex-wrap: wrap;
                gap: 5px;
            }
            
            .nav-links a {
                padding: 8px 12px;
                font-size: 14px;
            }
            
            .main-content {
                padding: 20px;
            }
            
            .box {
                padding: 20px;
            }
        }
    </style>
    
    
</head>
<body>
    <div class="app-container">
        <aside class="sidebar">
            <div class="logo">Ki<span>TARAN</span></div>
            <nav class="nav-links">
                <ul>
                    <li><a href="dashboard">Dashboard</a></li>
                    <li><a href="request.jsp" class="active">New Request</a></li>
                    <li class="spacer"></li>
                    <li>
                        <form action="logout" method="post">
                            <button type="submit" class="logout">Logout</button>
                        </form>
                    </li>
                </ul>
            </nav>
        </aside>

        <div class="main-content">
            <div class="box" style="max-width: 600px; margin: 0 auto;">
                <h2>Create New Request</h2>
                <p>Welcome, ${user.username}</p>
                <p>Fill in details. The driver will weigh the items.</p>

                <%
                    String message = (String) request.getAttribute("message");
                    String messageType = (String) request.getAttribute("messageType");
                    if (message != null) {
                %>
                    <div class="alert alert-<%= messageType != null ? messageType : "info" %>" style="margin-bottom: 20px; padding: 10px; border-radius: 5px;">
                        <%= message %>
                    </div>
                <%
                    }
                %>

                <form action="request" method="POST" onsubmit="return validateForm()">
                    <label>Category</label>
                    <select name="type" id="type" required>
                        <option value="">Select Category</option>
                        <option value="Plastic" <%= "Plastic".equals(request.getParameter("type")) ? "selected" : "" %>>Plastic</option>
                        <option value="Paper" <%= "Paper".equals(request.getParameter("type")) ? "selected" : "" %>>Paper</option>
                        <option value="Metal" <%= "Metal".equals(request.getParameter("type")) ? "selected" : "" %>>Metal</option>
                        <option value="Glass" <%= "Glass".equals(request.getParameter("type")) ? "selected" : "" %>>Glass</option>
                    </select>

                    <label>Item Description</label>
                    <input type="text" name="item" id="item" 
                           placeholder="e.g. Cardboard boxes" required>

                    <label>Pickup Address</label>
                    <input type="text" name="address" id="address" 
                            value="${user.address}" 
                            placeholder="Block A, Apt 2..." readonly>

                    <!-- Hidden field for user ID if needed -->
                    <input type="hidden" name="userId" value="${user.id}">

                    <button type="submit" class="btn">Submit Request</button>
                </form>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
    <script>
        function validateForm() {
            var type = document.getElementById('type').value;
            var item = document.getElementById('item').value;
            var address = document.getElementById('address').value;

            if (type === "" || item === "" || address === "") {
                alert("Please fill in all fields");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>