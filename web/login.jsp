<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="globals.css" rel="stylesheet">
        <title>Login - Kitaran</title>
    </head>
    <body>
        <main>
            <section class="container login-container">
                <div class="card text-center">
                    <h1 class="logo">Ki<span>taran</span></h1>
                    <p class="subtitle">Login to 3R Management System</p>
                    
                    <%-- Login Form --%>
                    <form method="post" action="login" id="loginForm" class="form-group">
                        <div class="input-wrapper">
                            <label for="username">Username</label>
                            <input 
                                type="text" 
                                id="username" 
                                name="username" 
                                placeholder="Enter your username" 
                                required
                                minlength="3"
                            >
                        </div>
                        
                        <div class="input-wrapper">
                            <label for="password">Password</label>
                            <input 
                                type="password" 
                                id="password" 
                                name="password" 
                                placeholder="Enter your password" 
                                required
                                minlength="6"
                            >
                        </div>
                        
                        <button type="submit" class="btn w-full mt-1">Login</button>
                    </form>
                </div>
            </section>
        </main>
        
        <script src="toast.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Display server-side messages as toasts
                <%
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    String successMessage = (String) request.getAttribute("successMessage");
                    
                    if (errorMessage != null) {
                %>
                    showError('<%= errorMessage.replace("'", "\\'") %>');
                <%
                    }
                    
                    if (successMessage != null) {
                %>
                    showSuccess('<%= successMessage.replace("'", "\\'") %>');
                <%
                    }
                %>
                
                // Form validation with toast notifications
                const form = document.getElementById('loginForm');
                
                form.addEventListener('submit', function(event) {
                    const username = document.getElementById('username').value.trim();
                    const password = document.getElementById('password').value;
                    
                    if (username.length < 3) {
                        showError('Username must be at least 3 characters long');
                        event.preventDefault();
                        return;
                    }
                    
                    if (password.length < 6) {
                        showError('Password must be at least 6 characters long');
                        event.preventDefault();
                        return;
                    }
                });
            });
        </script>
    </body>
</html>