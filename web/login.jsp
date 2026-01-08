<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Kitaran</title>
    <style>
        /* Keep all existing CSS styles */
        body.login-layout {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        .box {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        h1.logo {
            color: #333;
            margin-bottom: 20px;
        }
        
        h1.logo span {
            color: #4CAF50;
        }
        
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .btn {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px;
            margin: 10px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        
        .btn:hover {
            background-color: #45a049;
        }
        
        p {
            color: #666;
            margin-bottom: 20px;
        }
        
        .error-message {
            color: #ff0000;
            background-color: #ffe6e6;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 15px;
            text-align: center;
            border: 1px solid #ffcccc;
        }
        
        .demo-credentials {
            background-color: #f0f8ff;
            padding: 10px;
            border-radius: 4px;
            margin-top: 20px;
            font-size: 14px;
            border-left: 4px solid #4CAF50;
        }
    </style>
</head>
<body class="login-layout">
    <div class="box" style="width: 400px; text-align:center;">
        <h1 class="logo">Ki<span>taran</span></h1>
        <p>Login to 3R Management System (JSP)</p>
        
        <%-- Display error message if login failed --%>
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <div class="error-message">
                <%= errorMessage %>
            </div>
        <%
            }
        %>
        
        <%-- Demo credentials --%>
        <div class="demo-credentials">
            <strong>Demo Credentials:</strong><br>
            Admin: admin / admin123<br>
            User: any username / user123
        </div>
        
        <%-- Form submits to LoginServlet --%>
        <form id="loginForm" method="POST" action="LoginServlet">
            <input type="text" id="username" name="username" placeholder="Username" required>
            <input type="password" id="password" name="password" placeholder="Password" required>
            <button type="submit" class="btn">Login</button>
        </form>
    </div>
    
    <script>
        // Optional: Keep client-side validation for better UX
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('loginForm').addEventListener('submit', function(event) {
                const username = document.getElementById('username').value;
                const password = document.getElementById('password').value;
                
                if (username && password) {
                    if (username.length < 3) {
                        alert('Username must be at least 3 characters long');
                        event.preventDefault();
                        return;
                    }
                    
                    if (password.length < 6) {
                        alert('Password must be at least 6 characters long');
                        event.preventDefault();
                        return;
                    }
                }
                // If validation passes, form will submit to servlet
            });
        });
    </script>
</body>
</html>