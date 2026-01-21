<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="globals.css" rel="stylesheet">
    <title>Register - Kitaran</title>
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

        /* Password strength indicator */
        .password-strength {
            height: 4px;
            background: var(--neutral-200);
            border-radius: 2px;
            overflow: hidden;
            margin-top: 8px;
        }

        .password-strength-bar {
            height: 100%;
            width: 0%;
            transition: all var(--transition-base);
            background: var(--neutral-300);
        }

        .password-strength-bar.weak {
            width: 33%;
            background: var(--danger);
        }

        .password-strength-bar.medium {
            width: 66%;
            background: var(--warning);
        }

        .password-strength-bar.strong {
            width: 100%;
            background: var(--success);
        }
    </style>
</head>
<body>
    <div class="auth-container">
        <div class="auth-card">
            <h1 class="logo">Ki<span>TARAN</span></h1>
            <p class="subtitle">Create your account to get started</p>
            
            <form action="register" method="post" id="registerForm">
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
                            placeholder="Choose a unique username" 
                            required
                            minlength="3"
                            autocomplete="username"
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
                            placeholder="Create a strong password" 
                            required
                            minlength="6"
                            autocomplete="new-password"
                        >
                        <div class="password-strength">
                            <div class="password-strength-bar" id="passwordStrengthBar"></div>
                        </div>
                    </div>
                    
                    <div class="input-wrapper">
                        <label for="no_phone">
                            <i class="fas fa-phone"></i>
                            <span>Phone Number</span>
                        </label>
                        <input
                            type="text"
                            id="no_phone"
                            name="no_phone"
                            placeholder="e.g., 0123456789"
                            required
                            pattern="[0-9]{10,15}"
                            title="Please enter a valid phone number (10-15 digits)"
                            autocomplete="tel"
                        >
                    </div>
                    
                    <div class="input-wrapper">
                        <label for="address">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>Address</span>
                        </label>
                        <input
                            type="text"
                            id="address"
                            name="address"
                            placeholder="Your pickup address"
                            required
                            title="Please enter your address"
                            autocomplete="street-address"
                        >
                    </div>
                    
                    <button type="submit" class="btn w-full">
                        <i class="fas fa-user-plus"></i>
                        Create Account
                    </button>
                </div>
            </form>
            
            <div class="auth-footer">
                <p>
                    Already have an account? 
                    <a href="login">
                        <i class="fas fa-sign-in-alt"></i> Sign in here
                    </a>
                </p>
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
            
            // Password strength indicator
            const passwordInput = document.getElementById('password');
            const strengthBar = document.getElementById('passwordStrengthBar');
            
            passwordInput.addEventListener('input', function() {
                const password = this.value;
                let strength = 0;
                
                if (password.length >= 6) strength++;
                if (password.length >= 10) strength++;
                if (/[a-z]/.test(password) && /[A-Z]/.test(password)) strength++;
                if (/\d/.test(password)) strength++;
                if (/[^a-zA-Z0-9]/.test(password)) strength++;
                
                strengthBar.className = 'password-strength-bar';
                
                if (strength <= 2) {
                    strengthBar.classList.add('weak');
                } else if (strength <= 3) {
                    strengthBar.classList.add('medium');
                } else {
                    strengthBar.classList.add('strong');
                }
            });
            
            // Form validation
            const form = document.getElementById('registerForm');
            
            form.addEventListener('submit', function(event) {
                const username = document.getElementById('username').value.trim();
                const password = document.getElementById('password').value;
                const phone = document.getElementById('no_phone').value.trim();
                const address = document.getElementById('address').value.trim();
                
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
                
                if (!/^[0-9]{10,15}$/.test(phone)) {
                    showError('Please enter a valid phone number (10-15 digits)');
                    event.preventDefault();
                    return;
                }
                
                if (address.length < 5) {
                    showError('Please enter a complete address');
                    event.preventDefault();
                    return;
                }
            });
        });
    </script>
</body>
</html>