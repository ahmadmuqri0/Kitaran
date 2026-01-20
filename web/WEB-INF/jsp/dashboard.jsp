<%@page import="kitaran.bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/globals.css" rel="stylesheet">
    <title>Dashboard - Kitaran</title>
   
    <style>
        
    </style>
    
    
</head>
<body>
    <div class="app-container">
        <aside class="sidebar">
            <div class="logo">Ki<span>TARAN</span></div>
            <nav class="nav-links">
                <ul>
                    <li><a href="dashboard" class="active">Dashboard</a></li>
                    <li><a href="request">New Request</a></li>
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
            <h2>Welcome, <span id="username-display">${user.username}</span></h2>
            
            <div class="stats-row">
                <div class="stat-card">
                    <span class="stat-num" id="total-weight">${totalWeight != null ? totalWeight : '0.00'} KG</span>
                    <span class="stat-label">Total Recycled Weight</span>
                </div>
                
                <div class="stat-card">
                    <span class="stat-num" id="bill-amount">RM ${totalPenalty != null ? totalPenalty : '0.00'}</span>
                    <span class="stat-label">Outstanding Penalty</span>
                </div>
            </div>
            
            <div class="box">
                <h3>My Recycling History</h3>
                <table>
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">Type</th>
                            <th class="text-center">Item</th>
                            <th class="text-center">Verified Weight</th>
                            <th class="text-center">Penalty Cost</th>
                            <th class="text-center">Status</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody id="user-table">
                        <c:choose>
                            <c:when test="${not empty history}">
                                <c:forEach var="record" items="${history}">
                                    <tr>
                                        <td class="text-center">${record.recycleId}</td>
                                        <td class="text-center">${record.type}</td>
                                        <td class="text-center">${record.item}</td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${record.weight > 0}">
                                                    <fmt:formatNumber value="${record.weight}"/> KG
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">Pending</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${record.penalty > 0}">
                                                    <span class="text-danger">RM <fmt:formatNumber value="${record.penalty}"/></span>
                                                </c:when>
                                                <c:otherwise>
                                                    -
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${record.status == 'pending'}">
                                                    <span style="color: var(--warning);">Pending</span>
                                                </c:when>
                                                <c:when test="${record.status == 'verified'}">
                                                    <span style="color: var(--success);">Verified</span>
                                                </c:when>
                                                <c:otherwise>
                                                    ${record.status}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${!record.penaltyStatus && record.penalty > 0}" >
                                                    <button onclick="payBill(${record.recycleId})" class="btn btn-red" style="padding:8px; font-size:0.8rem;">Pay Now</button>
                                                </c:when>
                                                <c:otherwise>
                                                    NA
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="6" class="text-center text-muted">No recycling history yet</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
    
    <script>
        function payBill(id) {         
            window.location.href = 'payment?id=' + id;
        }
    </script>
</body>
</html>