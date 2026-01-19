<%@page import="kitaran.bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/globals.css" rel="stylesheet">
    <title>Dashboard - Kitaran</title>
</head>
<body>
    <div class="app-container">
        <aside class="sidebar">
            <div class="logo">Ki<span>TARAN</span></div>
            <nav class="nav-links">
                <ul>
                    <li><a href="dashboard" class="active">Dashboard</a></li>
                    <li><a href="request.jsp">New Request</a></li>
                    <li class="spacer"></li>
                    <li>
                        <form action="logout" method="post">
                            <button type="submit" class="logout">Logout</button>
                        </form>
                    </li>
                </ul>
            </nav>
        </aside>
        <main class="main-content">
            <h2>Welcome, <span id="username-display">${user.getUsername()}</span></h2>
            
            <div class="stats-row">
                <div class="stat-card">
                    <span class="stat-num" id="total-weight">${totalWeight != null ? totalWeight : '0'} kg</span>
                    <span class="stat-label">Total Recycled Weight</span>
                </div>
                
                <div class="stat-card">
                    <span class="stat-num" id="bill-amount">RM ${outstandingPenalty != null ? outstandingPenalty : '0.00'}</span>
                    <span class="stat-label">Outstanding Penalty</span>
                    
                    <div style="width:100%; margin-top:10px;">
                        <button onclick="payBill()" class="btn btn-red" style="padding:8px; font-size:0.8rem;">Pay Now</button>
                    </div>
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
                        <c:choose>
                            <c:when test="${not empty recyclingHistory}">
                                <c:forEach var="record" items="${recyclingHistory}">
                                    <tr>
                                        <td>${record.type}</td>
                                        <td>${record.item}</td>
                                        <td>${record.weight} kg</td>
                                        <td>RM ${record.penalty}</td>
                                        <td>${record.status}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5" class="text-center text-muted">No recycling history yet</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
    
    <script>
        function payBill() {
            const amount = document.getElementById('bill-amount').textContent.replace('RM ', '').trim();
            if (amount && parseFloat(amount) > 0) {
                window.location.href = 'payment.jsp?amount=' + amount;
            } else {
                alert('No outstanding penalty to pay.');
            }
        }
    </script>
</body>
</html>