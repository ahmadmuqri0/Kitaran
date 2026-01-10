<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="globals.css" rel="stylesheet">
    <title>Admin - Kitaran</title>
</head>
<body>
    <div class="app-container">
        <div class="sidebar">
            <div class="logo">Eco<span>System</span></div>
            <div class="nav-links">
                <a href="dashboard.jsp"> My Dashboard</a>
                <a href="input.jsp" class="active"> New Request</a>
                <a href="#" onclick="logout()" class="logout"> Logout</a>
            </div>
        </div>

        <div class="main-content">
            <div class="box" style="max-width: 600px; margin: 0 auto;">
                <h2>Create New Request</h2>
                <p>Welcome, ${sessionScope.username != null ? sessionScope.username : 'User'}</p>
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

                <form action="submitRequest.jsp" method="POST" onsubmit="return validateForm()">
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
                            value="<%= request.getParameter("item") != null ? request.getParameter("item") : "" %>" 
                            placeholder="e.g. Cardboard boxes" required>

                    <label>Pickup Address</label>
                    <input type="text" name="address" id="address" 
                            value="<%= request.getParameter("address") != null ? request.getParameter("address") : "" %>" 
                            placeholder="Block A, Apt 2..." required>

                    <!-- Hidden field for user ID if needed -->
                    <input type="hidden" name="userId" value="${sessionScope.userId}">

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