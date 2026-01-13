<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="globals.css" rel="stylesheet">
        <title>Register - Kitaran</title>
    </head>
    <body>
        <main>
            <section class="container">
                <div class="card text-center">
                    <h1 class="logo">Ki<span>TARAN</span></h1>
                    <p class="subtitle">Register to 3R Management System</p>
                    
                    <form action="register" method="post" id="registerForm">
                        <div class="form-group">
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
                            
                            <div class="input-wrapper">
                                <label for="no_phone">Phone Number</label>
                                <input
                                    type="text"
                                    id="no_phone"
                                    name="no_phone"
                                    placeholder="Enter your number: 01234567890"
                                    required
                                    pattern="[0-9]{10,15}"
                                    title="Please enter a valid phone number (10-15 digits)"
                                >
                            </div>
                            
                            <button type="submit" class="btn w-full mt-2">Register</button>
                        </div>
                    </form>
                    
                    <p class="text-center mt-3 text-sm text-muted">
                        Already have an account? 
                        <a href="login" class="text-accent font-semibold" style="text-decoration: none;">Login here</a>
                    </p>
                </div>
            </section>
        </main>
    </body>
    <script src="toast.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Tunjuk mesej dari servlet pakai notification
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
                
            // buat form validation pakai notification
            const form = document.getElementById('registerForm');
                
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
</html>