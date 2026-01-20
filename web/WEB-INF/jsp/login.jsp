<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/globals.css" rel="stylesheet">
    <title>Login | Kitaran</title>
    
    <style>
        /* Specific Styles for Login Page */
        .login-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            width: 100%;
            position: relative;
            z-index: 1;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.75);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.4);
            padding: 50px 40px;
            border-radius: 40px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15);
            text-align: center;
            transition: transform 0.3s ease;
        }

        .login-card:hover {
            transform: translateY(-5px);
        }

        .input-group {
            text-align: left;
            margin-bottom: 25px;
        }

        .input-group label {
            display: block;
            font-weight: 700;
            font-size: 0.85rem;
            color: var(--primary);
            margin-bottom: 10px;
            margin-left: 5px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .input-field {
            width: 100%;
            padding: 16px 20px;
            border-radius: 18px;
            border: 2px solid transparent;
            background: rgba(255, 255, 255, 0.9);
            font-size: 1rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0,0,0,0.02);
        }

        .input-field:focus {
            outline: none;
            border-color: var(--accent);
            background: white;
            box-shadow: 0 10px 15px -3px var(--accent-glow);
        }

        .login-btn {
            width: 100%;
            padding: 18px;
            border-radius: 18px;
            border: none;
            background: linear-gradient(135deg, var(--accent) 0%, #4f9a69 100%);
            color: white;
            font-size: 1.1rem;
            font-weight: 800;
            cursor: pointer;
            box-shadow: 0 10px 20px var(--accent-glow);
            transition: all 0.3s ease;
        }

        .login-btn:hover {
            transform: scale(1.02);
            box-shadow: 0 15px 25px var(--accent-glow);
        }

        .subtitle {
            color: #718096;
            margin-bottom: 35px;
            font-size: 0.95rem;
        }

        /* Decorative blobs specifically for login */
        .blob {
            position: absolute;
            width: 300px;
            height: 300px;
            background: var(--accent-glow);
            filter: blur(80px);
            border-radius: 50%;
            z-index: -1;
            animation: move 15s infinite alternate;
        }

        @keyframes move {
            from { transform: translate(-20%, -20%); }
            to { transform: translate(20%, 20%); }
        }
    </style>
</head>
<body>
    <div class="login-wrapper">
        <div class="blob" style="top: 10%; left: 20%;"></div>
        <div class="blob" style="bottom: 10%; right: 20%; background: rgba(100, 150, 255, 0.2);"></div>

        <main class="login-card">
            <div class="logo" style="margin-bottom: 10px;">Ki<span>TARAN</span></div>
            <p class="subtitle">Welcome back! Please login to your account.</p>

            <form method="post" action="login" id="loginForm">
                <div class="input-group">
                    <label for="username">Username</label>
                    <input 
                        type="text" 
                        id="username" 
                        name="username" 
                        class="input-field"
                        placeholder="e.g. janesmith" 
                        required
                        minlength="3"
                    >
                </div>
                
                <div class="input-group">
                    <label for="password">Password</label>
                    <input 
                        type="password" 
                        id="password" 
                        name="password" 
                        class="input-field"
                        placeholder="••••••••" 
                        required
                        minlength="6"
                    >
                </div>
                
                <button type="submit" class="login-btn">Sign In</button>
                
                <p style="margin-top: 30px; font-size: 0.9rem; color: #718096;">
                    New to Kitaran? 
                    <a href="register" style="color: var(--accent); font-weight: 700; text-decoration: none;">Create an account</a>
                </p>
            </form>
        </main>
    </div>
    
    <script src="toast.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Integration with your existing Toast/Notification system
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
            
            const form = document.getElementById('loginForm');
            form.addEventListener('submit', function(event) {
                const username = document.getElementById('username').value.trim();
                const password = document.getElementById('password').value;
                
                if (username.length < 3) {
                    showError('Username is too short');
                    event.preventDefault();
                } else if (password.length < 6) {
                    showError('Password must be at least 6 characters');
                    event.preventDefault();
                }
            });
        });
    </script>
</body>
</html>