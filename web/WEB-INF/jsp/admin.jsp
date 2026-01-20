<%@page import="kitaran.bean.User"%>
<%@page import="kitaran.bean.AdminDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/globals.css" rel="stylesheet">
    <title>Admin Panel - Kitaran</title>
</head>
<body>
    <div class="app-container">
        <aside class="sidebar">
            <div class="logo">Ki<span>TARAN</span></div>
            <nav class="nav-links">
                <ul>
                    <li><a href="dashboard" class="active">Admin Panel</a></li>
                    <li class="spacer"></li>
                    <li>
                        <form action="logout" method="post">
                            <button type="submit" class="logout">Logout</button>
                        </form>
                    </li>
                </ul>
            </nav>
        </aside>

        <main class="container">
            <section>
                <h2>Admin Dashboard</h2>

                <div class="stats-row">
                    <div class="stat-card">
                        <span class="stat-num">
                            ${totalSystemWeight != null ? totalSystemWeight : '0.00'} kg
                        </span>
                        <span class="stat-label">System Total Weight</span>
                    </div>
                    <div class="stat-card">
                        <span class="stat-num">
                            ${totalRequests != null ? totalRequests : '0'}
                        </span>
                        <span class="stat-label">Total Requests</span>
                    </div>
                    <div class="stat-card">
                        <span class="stat-num">
                            ${pendingRequests != null ? pendingRequests : '0'}
                        </span>
                        <span class="stat-label">Pending Requests</span>
                    </div>
                </div>

                <div class="box">
                    <h3>Manage Requests</h3>

                    <div class="mb-3">
                        <a href="dashboard?filter=all" 
                           class="filter-btn ${currentFilter == 'all' || currentFilter == null ? 'active' : ''}">
                            All
                        </a>
                        <a href="dashboard?filter=pending" 
                           class="filter-btn ${currentFilter == 'pending' ? 'active' : ''}">
                            Pending
                        </a>
                        <a href="dashboard?filter=verified" 
                           class="filter-btn ${currentFilter == 'verified' ? 'active' : ''}">
                            Verified
                        </a>
                        <a href="dashboard?filter=penalty" 
                           class="filter-btn ${currentFilter == 'penalty' ? 'active' : ''}">
                            Penalty Issues
                        </a>
                    </div>

                    <c:if test="${not empty message}">
                        <div class="alert alert-success">
                            ${message}
                        </div>
                    </c:if>

                    <table>
                        <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">User</th>
                                <th class="text-center">Type</th>
                                <th class="text-center">Item</th>
                                <th class="text-center">Weight (kg)</th>
                                <th class="text-center">Penalty (RM)</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty data}">
                                    <c:forEach var="record" items="${data}">
                                        <tr>
                                            <td class="text-center">${record.recycleId}</td>
                                            <td class="text-center">${record.username}</td>
                                            <td class="text-center">${record.type}</td>
                                            <td class="text-center">${record.item}</td>
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${record.weight > 0}">
                                                        <fmt:formatNumber value="${record.weight}"/> KG
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button onclick="openWeightModal(${record.recycleId})" 
                                                                class="action-btn btn-blue text-white">
                                                            Weight
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${record.penaltyAmount > 0}">
                                                        <fmt:formatNumber value="${record.penaltyAmount}"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button onclick="openPenaltyModal(${record.userId}, ${record.recycleId})" 
                                                            class="action-btn btn-red text-white">
                                                            Penalty
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${record.recycleStatus == 'pending'}">
                                                        <span style="color: var(--warning);">Pending</span>
                                                    </c:when>
                                                    <c:when test="${record.recycleStatus == 'verified'}">
                                                        <span style="color: var(--success);">Verified</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${record.recycleStatus}
                                                    </c:otherwise>
                                                </c:choose>
                                                
                                                <c:if test="${record.penaltyAmount > 0}">
                                                    <br>
                                                    <small style="color: var(--danger);">
                                                        Payment: ${record.paymentStatus ? 'paid' : 'unpaid'}
                                                    </small>
                                                </c:if>
                                            </td>
                                            <td class="text-center">
                                                <c:choose>
                                                    <c:when test="${record.recycleStatus == 'pending'}">
                                                        <form action="dashboard" method="POST" style="display: inline;">
                                                            <input type="hidden" name="action" value="verify">
                                                            <input type="hidden" name="recycleId" value="${record.recycleId}">
                                                            <button type="submit"
                                                                    class="action-btn btn-green text-white"
                                                                    onclick="return confirm('Verify this recycling request?')">
                                                                Verify
                                                            </button>
                                                        </form>
                                                    </c:when>
                                                    <c:when test="${record.recycleStatus == 'verified'}">
                                                        <span class="text-muted">Completed</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        -
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="8" class="text-center text-muted">
                                            No records found for the selected filter
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </section>
        </main>
    </div>

    <div id="penaltyModal" class="modal">
        <div class="modal-content">
            <h3>Penalty Calculation</h3>
            <p class="text-sm mb-3 text-muted">Item category does not match.</p>

            <form action="dashboard" method="POST">
                <input type="hidden" name="action" value="penalty">
                <input type="hidden" id="userId" name="userId">
                <input type="hidden" id="recycleId" name="recycleId">
                <label class="text-left d-block text-sm font-semibold mb-1">
                    Weight of Miss-Categorized Item (kg)
                </label>
                <input type="decimal" id="wrong-weight" name="wrongWeight" 
                       placeholder="e.g. 5" step="0.1" min="0" required>

                <p class="text-sm text-muted mb-3">Rate: RM 0.50 per kg.</p>

                <button type="submit" class="btn btn-red w-full">Confirm Penalty</button>
                <button type="button" onclick="closePenaltyModal()" 
                        class="btn btn-blue w-full mt-2">Cancel</button>
            </form>
        </div>
    </div>

    <div id="weightModal" class="modal">
        <div class="modal-content">
            <h3>Weight Input</h3>
            <p class="text-sm mb-3 text-muted">Please enter the weight of the recycle item.</p>

            <form action="dashboard" method="POST">
                <input type="hidden" name="action" value="weight">
                <input type="hidden" id="recycleId2" name="requestId">
                <label class="text-left d-block text-sm font-semibold mb-1">
                    Weight of Item (kg)
                </label>
                <input type="decimal" id="weight" name="weight" 
                       placeholder="e.g. 5" step="0.1" min="0" required>

                <button type="submit" class="btn btn-green w-full">Confirm</button>
                <button type="button" onclick="closeWeightModal()" 
                        class="btn btn-blue w-full mt-2">Cancel</button>
            </form>
        </div>
    </div>

    <script>
        function closePenaltyModal() {
            document.getElementById('penaltyModal').style.display = 'none';
        }
        
        function openPenaltyModal(userId, recycleId) {
            document.getElementById('userId').value = userId;
            document.getElementById('recycleId').value = recycleId;
            document.getElementById('penaltyModal').style.display = 'flex';
        }
        
        function closeWeightModal() {
            document.getElementById('weightModal').style.display = 'none';
        }
        
        function openWeightModal(recycleId) {
            document.getElementById('recycleId2').value = recycleId;
            document.getElementById('weightModal').style.display = 'flex';
        }
        
        // Close modal on outside click
        window.onclick = function(event) {
            const modal = document.getElementById('penaltyModal');
            if (event.target === modal) {
                closePenaltyModal();
            }
        }
    </script>
</body>
</html>