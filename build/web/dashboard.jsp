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
    <%
        if (session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>
    <div class="app-container">
        <div class="sidebar">
            <div class="logo">Ki<span>TARAN</span></div>
            <div class="nav-links">
                <a href="dashboard.jsp" class="active"> Dashboard</a>
                <a href="input.jsp"> New Request</a>
                <a href="logout" class="logout"> Logout</a>
            </div>
        </div>

        <div class="main-content">
            <h2 style="margin-bottom:20px;">Welcome, <span id="username-display">${sessionScope.username != null ? sessionScope.username : 'User'}</span></h2>

            <div class="stats-row">
                <div class="stat-card">
                    <span class="stat-num" id="total-weight">${totalWeight != null ? totalWeight : '0'} kg</span>
                    <span class="stat-label">Total Recycled Weight</span>
                </div>
                
                <div class="stat-card">
                    <span class="stat-num" id="bill-amount">RM ${outstandingPenalty != null ? outstandingPenalty : '0.00'}</span>
                    <span class="stat-label">Outstanding Penalty</span>
                    
                    <c:if test="${outstandingPenalty > 0}">
                        <div id="pay-section" style="width:100%; margin-top:10px;">
                            <button onclick="payBill()" class="btn btn-red" style="padding:8px; font-size:0.8rem;">Pay Now</button>
                        </div>
                    </c:if>
                </div>
            </div>

            <div class="box">
                <h3>My Recycling History</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Item</th>
                            <th>Verified Weight</th>
                            <th>Penalty Cost</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody id="user-table">
                        <!-- You can use JSTL to loop through recycling history -->
                        <%-- 
                        <c:forEach var="record" items="${recyclingHistory}">
                            <tr>
                                <td>${record.type}</td>
                                <td>${record.item}</td>
                                <td>${record.weight} kg</td>
                                <td>RM ${record.penalty}</td>
                                <td>${record.status}</td>
                            </tr>
                        </c:forEach>
                        --%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>