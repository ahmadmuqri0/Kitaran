<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="kitaran.bean.User"%>
<%@page import="kitaran.bean.Payment"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FPX Payment Gateway - Kitaran</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/globals.css">
    <style>
        .fpx-container {
            max-width: 500px;
            margin: 50px auto;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            text-align: center;
        }
        .fpx-header {
            border-bottom: 2px solid #f3f4f6;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        .bank-logo-grid {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 10px;
            margin-bottom: 20px;
        }
        .bank-option {
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.8rem;
            font-weight: 600;
            color: #555;
            transition: 0.2s;
        }
        .bank-option:hover {
            border-color: #4CAF50;
            background: #f0f9f0;
        }
        .bank-option.selected {
            border-color: #4CAF50;
            background: #e8f5e9;
            color: #2e7d32;
        }
        .amount-box {
            background: #fef3c7;
            color: #d97706;
            padding: 15px;
            border-radius: 8px;
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 30px;
        }
        .error-msg {
            background: #fee2e2;
            color: #dc2626;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .success-msg {
            background: #d1fae5;
            color: #065f46;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <%
        // Check authentication
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        
        // Get error/success messages
        String error = (String) session.getAttribute("error");
        String success = (String) session.getAttribute("success");
        
        // Get amount from parameter
        Payment payment = (Payment) request.getAttribute("payment");
        
        // Clear messages after displaying
        session.removeAttribute("error");
        session.removeAttribute("success");
    %>
    
    <div class="fpx-container">
        <div class="fpx-header">
            <h2 style="color:#4CAF50">FPX Secure Gateway</h2>
            <p style="color:#888; font-size:0.9rem;">Kitaran System Payment</p>
        </div>
        
        <% if (error != null) { %>
            <div class="error-msg"><%= error %></div>
        <% } %>
        
        <% if (success != null) { %>
            <div class="success-msg"><%= success %></div>
        <% } %>
        
        <form action="payment" method="post" id="paymentForm">
            <input type="hidden" name="requestId" value="<%= payment.getId() %>">
            <input type="hidden" name="amount" id="amountInput" value="<%= payment.getAmount() %>">
            <input type="hidden" name="bankName" id="selectedBank" value="">
            
            <div style="text-align:left; margin-bottom:10px; font-weight:600; color:#555;">
                Total Amount Payable:
            </div>
            <div class="amount-box" id="pay-display">
                RM <%= String.format("%.2f", payment.getAmount()) %>
            </div>
            
            <div style="text-align:left; margin-bottom:10px; font-weight:600; color:#555;">
                Select Bank:
            </div>
            <div class="bank-logo-grid">
                <div class="bank-option" onclick="selectBank(this, 'Maybank2u')">Maybank2u</div>
                <div class="bank-option" onclick="selectBank(this, 'CIMB Clicks')">CIMB Clicks</div>
                <div class="bank-option" onclick="selectBank(this, 'Public Bank')">Public Bank</div>
                <div class="bank-option" onclick="selectBank(this, 'RHB Now')">RHB Now</div>
                <div class="bank-option" onclick="selectBank(this, 'AmBank')">AmBank</div>
                <div class="bank-option" onclick="selectBank(this, 'Bank Islam')">Bank Islam</div>
            </div>
            
            <button type="submit" class="btn w-full mb-2">Proceed to Pay</button>
        </form>
        <a href="dashboard" class="btn btn-secondary w-full" style="text-decoration: none; display:block;">
            Cancel
        </a>
    </div>
    
    <script>
        let selectedBankName = "";
        
        function selectBank(element, bankName) {
            // Remove selection from all banks
            const allBanks = document.querySelectorAll('.bank-option');
            allBanks.forEach(bank => bank.classList.remove('selected'));
            
            // Add selection to clicked bank
            element.classList.add('selected');
            selectedBankName = bankName;
            
            // Update hidden input
            document.getElementById('selectedBank').value = bankName;
        }
        
        // Form validation
        document.getElementById('paymentForm').addEventListener('submit', function(e) {
            const amount = parseFloat(document.getElementById('amountInput').value);
            const bank = document.getElementById('selectedBank').value;
            
            console.log(amount);
            
            if (!bank || bank.trim() === '') {
                e.preventDefault();
                alert('Please select a bank before proceeding.');
                return false;
            }
            
            if (amount <= 0 || isNaN(amount)) {
                e.preventDefault();
                alert('Invalid payment amount.');
                return false;
            }
            
            return true;
        });
    </script>
</body>
</html>