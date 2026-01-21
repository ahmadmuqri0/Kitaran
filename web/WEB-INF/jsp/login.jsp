<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/globals.css" rel="stylesheet">
    <title>Login - Kitaran</title>
    <style>
        /* Auth Pages Layout */
        .auth-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
            background: linear-gradient(135deg, var(--neutral-50) 0%, var(--neutral-100) 100%);
            position: relative;
            overflow: hidden;
        }

        /* Decorative Background Elements */
        .auth-container::before,
        .auth-container::after {
            content: '';
            position: absolute;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(123, 166, 130, 0.08) 0%, transparent 70%);
            filter: blur(60px);
            z-index: 0;
        }

        .auth-container::before {
            width: 500px;
            height: 500px;
            top: -100px;
            right: -100px;
        }

        .auth-container::after {
            width: 400px;
            height: 400px;
            bottom: -100px;
            left: -100px;
        }

        .auth-card {
            background: var(--bg-primary);
            border: 1px solid var(--neutral-200);
            border-radius: var(--radius-xl);
            padding: 48px;
            width: 100%;
            max-width: 480px;
            box-shadow: var(--shadow-xl);
            position: relative;
            z-index: 1;
            animation: slideUp 0.4s ease;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .auth-card .logo {
            font-size: 36px;
            font-weight: 800;
            color: var(--primary);
            text-align: center;
            margin-bottom: 12px;
            letter-spacing: -1px;
        }

        .auth-card .logo span {
            color: var(--primary-dark);
        }

        .auth-card .subtitle {
            text-align: center;
            color: var(--neutral-500);
            font-size: 16px;
            margin-bottom: 36px;
            font-weight: 500;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .input-wrapper {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .input-wrapper label {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 600;
            font-size: 14px;
            color: var(--neutral-700);
        }

        .input-wrapper label i {
            color: var(--primary);
            font-size: 16px;
            width: 20px;
            text-align: center;
        }

        .input-wrapper input {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid var(--neutral-200);
            border-radius: var(--radius-md);
            font-family: 'Inter', sans-serif;
            font-size: 15px;
            color: var(--neutral-800);
            background: var(--bg-primary);
            transition: all var(--transition-base);
        }

        .input-wrapper input::placeholder {
            color: var(--neutral-400);
        }

        .input-wrapper input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(123, 166, 130, 0.1);
        }

        .auth-card .btn {
            margin-top: 12px;
            padding: 16px;
            font-size: 16px;
            font-weight: 700;
            box-shadow: var(--shadow-md);
        }

        .auth-card .btn:hover {
            box-shadow: var(--shadow-lg);
        }

        .auth-footer {
            margin-top: 32px;
            padding-top: 24px;
            border-top: 1px solid var(--neutral-200);
            text-align: center;
        }

        .auth-footer p {
            color: var(--neutral-500);
            font-size: 14px;
        }

        .auth-footer a {
            color: var(--primary);
            font-weight: 700;
            text-decoration: none;
            transition: color var(--transition-fast);
        }

        .auth-footer a:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        /* Features Section */
        .features {
            margin-top: 32px;
            padding-top: 24px;
            border-top: 1px solid var(--neutral-200);
        }

        .features h4 {
            font-size: 14px;
            font-weight: 700;
            color: var(--neutral-700);
            margin-bottom: 16px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
        }

        .feature-item {
            text-align: center;
            padding: 12px;
        }

        .feature-item i {
            font-size: 24px;
            color: var(--primary);
            margin-bottom: 8px;
        }

        .feature-item span {
            display: block;
            font-size: 12px;
            color: var(--neutral-600);
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="auth-container">
        <div class="auth-card">
            <h1 class="logo">Ki<span>TARAN</span></h1>
            <p class="subtitle">Welcome back! Sign in to your account</p>
            
            <form method="post" action="login" id="loginForm">
                <div class="form-group">
                    <div class="input-wrapper">
                        <label for="username">
                            <i class="fas fa-user"></i>
                            <span>Username</span>
                        </label>
                        <input 
                            type="text" 
                            id="username" 
                            name="username" 
                            placeholder="Enter your username" 
                            required
                            minlength="3"
                            autocomplete="username"
                            autofocus
                        >
                    </div>
                    
                    <div class="input-wrapper">
                        <label for="password">
                            <i class="fas fa-lock"></i>
                            <span>Password</span>
                        </label>
                        <input 
                            type="password" 
                            id="password" 
                            name="password" 
                            placeholder="Enter your password" 
                            required
                            minlength="6"
                            autocomplete="current-password"
                        >
                    </div>
                    
                    <button type="submit" class="btn w-full">
                        <i class="fas fa-sign-in-alt"></i>
                        Sign In
                    </button>
                </div>
            </form>
            
            <div class="auth-footer">
                <p>
                    New to Kitaran? 
                    <a href="register">
                        <i class="fas fa-user-plus"></i> Create an account
                    </a>
                </p>
            </div>

            <div class="features">
                <h4>Why Choose Kitaran?</h4>
                <div class="features-grid">
                    <div class="feature-item">
                        <i class="fas fa-recycle"></i>
                        <span>Easy Recycling</span>
                    </div>
                    <div class="feature-item">
                        <i class="fas fa-truck"></i>
                        <span>Pickup Service</span>
                    </div>
                    <div class="feature-item">
                        <i class="fas fa-chart-line"></i>
                        <span>Track Progress</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="toast.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Show messages from servlet
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
            
            // Form validation
            const form = document.getElementById('loginForm');
            form.addEventListener('submit', function(event) {
                const username = document.getElementById('username').value.trim();
                const password = document.getElementById('password').value;
                
                if (username.length < 3) {
                    showError('Username must be at least 3 characters');
                    event.preventDefault();
                    return;
                }
                
                if (password.length < 6) {
                    showError('Password must be at least 6 characters');
                    event.preventDefault();
                    return;
                }
            });
        });
    </script>
</body>
</html>