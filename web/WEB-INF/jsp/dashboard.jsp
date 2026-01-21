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
</head>
<body>
    <div class="app-container">
        <!-- Sidebar Navigation -->
        <aside class="sidebar">
            <div class="logo">Ki<span>TARAN</span></div>
            <nav class="nav-links">
                <ul>
                    <li>
                        <a href="dashboard" class="active">
                            <i class="fas fa-chart-line"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="request">
                            <i class="fas fa-plus-circle"></i>
                            <span>New Request</span>
                        </a>
                    </li>
                    <li class="spacer"></li>
                    <li>
                        <form action="logout" method="post">
                            <button type="submit" class="logout">
                                <i class="fas fa-sign-out-alt"></i>
                                <span>Logout</span>
                            </button>
                        </form>
                    </li>
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Welcome Section -->
            <div class="welcome-section">
                <h2>Welcome back, <span id="username-display">${user.username}</span>!</h2>
                <p>Here's your recycling activity overview</p>
            </div>
            
            <!-- Statistics Cards -->
            <div class="stats-row">
                <div class="stat-card">
                    <span class="stat-label">
                        <i class="fas fa-weight"></i> Total Recycled Weight
                    </span>
                    <span class="stat-num" id="total-weight">
                        ${totalWeight != null ? totalWeight : '0.00'} <small style="font-size: 18px; font-weight: 600; color: var(--neutral-500);">KG</small>
                    </span>
                </div>
                
                <div class="stat-card">
                    <span class="stat-label">
                        <i class="fas fa-exclamation-triangle"></i> Outstanding Penalty
                    </span>
                    <span class="stat-num" id="bill-amount" style="color: ${totalPenalty > 0.0 ? 'var(--danger)' : 'var(--success)'};">
                        RM <fmt:formatNumber value="${totalPenalty != 0.0 ? totalPenalty : 0.0}" pattern="#,##0.00" />
                    </span>
                </div>
            </div>
            
            <!-- Recycling History Table -->
            <div class="box">
                <h3><i class="fas fa-history"></i> My Recycling History</h3>
                <table>
                    <thead>
                        <tr>
                            <th class="text-center"><i class="fas fa-hashtag"></i> ID</th>
                            <th><i class="fas fa-tag"></i> Type</th>
                            <th><i class="fas fa-box"></i> Item</th>
                            <th class="text-center"><i class="fas fa-weight-hanging"></i> Weight</th>
                            <th class="text-center"><i class="fas fa-dollar-sign"></i> Penalty</th>
                            <th class="text-center"><i class="fas fa-info-circle"></i> Status</th>
                            <th class="text-center"><i class="fas fa-cog"></i> Action</th>
                        </tr>
                    </thead>
                    <tbody id="user-table">
                        <c:choose>
                            <c:when test="${not empty history}">
                                <c:forEach var="record" items="${history}">
                                    <tr>
                                        <td class="text-center" style="font-weight: 700; color: var(--primary);">
                                            #${record.recycleId}
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${record.type == 'Plastic'}">
                                                    <i class="fas fa-bottle-droplet" style="color: #2196F3; margin-right: 8px;"></i>
                                                </c:when>
                                                <c:when test="${record.type == 'Paper'}">
                                                    <i class="fas fa-file-alt" style="color: #8D6E63; margin-right: 8px;"></i>
                                                </c:when>
                                                <c:when test="${record.type == 'Metal'}">
                                                    <i class="fas fa-circle" style="color: #607D8B; margin-right: 8px;"></i>
                                                </c:when>
                                                <c:when test="${record.type == 'Glass'}">
                                                    <i class="fas fa-wine-bottle" style="color: #00BCD4; margin-right: 8px;"></i>
                                                </c:when>
                                            </c:choose>
                                            <span style="font-weight: 600;">${record.type}</span>
                                        </td>
                                        <td>${record.item}</td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${record.weight > 0}">
                                                    <span style="font-weight: 700; color: var(--primary);">
                                                        <fmt:formatNumber value="${record.weight}" maxFractionDigits="2"/> kg
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">
                                                        <i class="fas fa-clock"></i> Pending
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${record.penalty > 0}">
                                                    <span style="color: var(--danger); font-weight: 700;">
                                                        <i class="fas fa-exclamation-circle"></i>
                                                        RM <fmt:formatNumber value="${record.penalty}" maxFractionDigits="2"/>
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span style="color: var(--success);">
                                                        <i class="fas fa-check-circle"></i> None
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${record.status == 'pending'}">
                                                    <span class="status-badge status-pending">
                                                        <i class="fas fa-hourglass-half"></i> Pending
                                                    </span>
                                                </c:when>
                                                <c:when test="${record.status == 'verified'}">
                                                    <span class="status-badge status-verified">
                                                        <i class="fas fa-check-circle"></i> Verified
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-badge">${record.status}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${!record.penaltyStatus && record.penalty > 0}">
                                                    <button onclick="payBill(${record.recycleId})" class="btn btn-red btn-small">
                                                        <i class="fas fa-credit-card"></i> Pay Now
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">—</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="7" class="text-center text-muted" style="padding: 60px 20px;">
                                        <i class="fas fa-inbox" style="font-size: 48px; color: var(--neutral-300); display: block; margin-bottom: 16px;"></i>
                                        <p style="font-size: 16px;">No recycling history yet</p>
                                        <p style="font-size: 14px; margin-top: 8px;">Submit your first recycling request to get started!</p>
                                    </td>
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