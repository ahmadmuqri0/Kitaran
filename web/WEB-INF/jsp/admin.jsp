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
    <title>Admin Command Center | Kitaran</title>
    <style>
        :root {
            --primary: #6bb282;
            --primary-dark: #5a9e71;
            --accent: #2d3748;
            --danger: #e53e3e;
            --glass-border: rgba(0,0,0,0.1);
        }

        /* Stats Banner */
        .horizontal-stats-banner {
            display: flex; align-items: center; background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(15px); border: 1px solid var(--glass-border);
            padding: 25px 40px; border-radius: 30px; margin-bottom: 35px;
            box-shadow: 0 10px 30px -10px rgba(0,0,0,0.05);
        }
        .h-stat-item { display: flex; align-items: center; gap: 15px; flex: 1; }
        .h-icon { width: 50px; height: 50px; border-radius: 15px; display: flex; align-items: center; justify-content: center; font-size: 1.4rem; }
        .h-details { display: flex; flex-direction: column; }
        .h-label { font-size: 0.75rem; font-weight: 700; color: #718096; text-transform: uppercase; letter-spacing: 0.5px; }
        .h-value { font-size: 1.5rem; font-weight: 800; color: var(--primary); line-height: 1.2; }
        .h-divider { width: 1px; height: 40px; background: rgba(0,0,0,0.1); margin: 0 30px; }

        /* Table UI */
        table { width: 100%; border-collapse: separate; border-spacing: 0 10px; }
        th { color: #718096; font-weight: 700; font-size: 0.8rem; text-transform: uppercase; padding: 15px; }
        td { background: rgba(255, 255, 255, 0.5); padding: 18px 15px; border-top: 1px solid var(--glass-border); border-bottom: 1px solid var(--glass-border); }
        td:first-child { border-left: 1px solid var(--glass-border); border-radius: 15px 0 0 15px; }
        td:last-child { border-right: 1px solid var(--glass-border); border-radius: 0 15px 15px 0; }
        
        /* Status Badges */
        .status-badge { padding: 6px 12px; border-radius: 20px; font-size: 0.7rem; font-weight: 800; text-transform: uppercase; }
        .status-pending { background: #fef3c7; color: #92400e; }
        .status-verified { background: #d1fae5; color: #065f46; }

        /* Buttons */
        .btn-verify-active { background: var(--primary); color: white; border: none; padding: 8px 16px; border-radius: 12px; font-weight: 700; cursor: pointer; transition: 0.2s; }
        .btn-verify-active:hover { background: var(--primary-dark); transform: translateY(-1px); }
        
        .btn-disabled { 
            background: #cbd5e0 !important; 
            color: #718096 !important; 
            cursor: not-allowed !important; 
            border: none; 
            padding: 8px 16px; 
            border-radius: 12px; 
            font-weight: 700;
            opacity: 0.6;
        }

        .action-completed { color: #059669; font-weight: 800; font-size: 0.85rem; display: flex; align-items: center; justify-content: center; gap: 5px; }

        /* Modals */
        .modal { background: rgba(15, 23, 42, 0.6); backdrop-filter: blur(8px); display: none; position: fixed; inset: 0; z-index: 9999; justify-content: center; align-items: center; }
        .modal-content { background: white; padding: 40px; border-radius: 30px; width: 100%; max-width: 400px; box-shadow: 0 25px 50px rgba(0,0,0,0.2); }
    </style>
</head>
<body>
    <div class="app-container">
        <aside class="sidebar">
            <div class="logo">Ki<span>TARAN</span></div>
            <nav class="nav-links">
                <ul><li><a href="dashboard" class="active"><span>📊</span> Admin Panel</a></li></ul>
            </nav>
            <div style="margin-top: auto;">
                <form action="logout" method="post">
                    <button type="submit" class="logout-btn-wow"><span class="icon">🚪</span> Logout</button>
                </form>
            </div>
        </aside>

        <main class="main-content">
            <header class="welcome-section">
                <p style="color: var(--primary); font-weight: 700; text-transform: uppercase;">System Management</p>
                <h2 style="font-size: 2.2rem; font-weight: 800;">Command Center</h2>
            </header>

            <div class="horizontal-stats-banner">
                <div class="h-stat-item">
                    <div class="h-icon" style="background: rgba(107, 178, 130, 0.1); color: var(--primary);">⚖️</div>
                    <div class="h-details">
                        <span class="h-label">Total Weight</span>
                        <span class="h-value">${totalSystemWeight != null ? totalSystemWeight : '0.00'} <small>kg</small></span>
                    </div>
                </div>
                <div class="h-divider"></div>
                <div class="h-stat-item">
                    <div class="h-icon" style="background: rgba(59, 130, 246, 0.1); color: #3b82f6;">📁</div>
                    <div class="h-details"><span class="h-label">Requests</span><span class="h-value">${totalRequests != null ? totalRequests : '0'}</span></div>
                </div>
                <div class="h-divider"></div>
                <div class="h-stat-item">
                    <div class="h-icon" style="background: rgba(245, 158, 11, 0.1); color: #f59e0b;">⏳</div>
                    <div class="h-details"><span class="h-label">Pending</span><span class="h-value">${pendingRequests != null ? pendingRequests : '0'}</span></div>
                </div>
            </div>

            <div class="box">
                <table>
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th>Contributor</th>
                            <th class="text-center">Weight</th>
                            <th class="text-center">Penalty</th>
                            <th class="text-center">Status</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="record" items="${data}">
                            <tr>
                                <td class="text-center" style="font-weight: 800; color: var(--primary);">#${record.recycleId}</td>
                                <td>
                                    <div style="font-weight: 700;">${record.username}</div>
                                    <div style="font-size: 0.7rem; color: #a0aec0;">UID: ${record.userId}</div>
                                </td>
                                
                                <td class="text-center">
                                    <c:choose>
                                        <c:when test="${record.weight > 0}">
                                            <span style="font-weight: 800;"><fmt:formatNumber value="${record.weight}"/> kg</span>
                                        </c:when>
                                        <c:otherwise>
                                            <button onclick="openWeightModal(${record.recycleId})" class="btn-verify-active" style="padding: 6px 12px; font-size: 0.75rem;">Input Weight</button>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                
                                <td class="text-center">
                                    <c:choose>
                                        <c:when test="${record.penaltyAmount > 0}">
                                            <span style="color: var(--danger); font-weight: 800;">RM <fmt:formatNumber value="${record.penaltyAmount}" minFractionDigits="2"/></span>
                                        </c:when>
                                        <c:when test="${record.recycleStatus == 'verified'}">
                                            <span style="color: #cbd5e0;">—</span>
                                        </c:when>
                                        <c:when test="${record.weight <= 0}">
                                            <span style="font-size: 0.7rem; color: #a0aec0;" title="Input weight first">🔒 Locked</span>
                                        </c:when>
                                        <c:otherwise>
                                            <button onclick="openPenaltyModal(${record.userId}, ${record.recycleId})" style="border: none; background: #fee2e2; color: #991b1b; padding: 6px 12px; border-radius: 10px; cursor: pointer; font-weight: 700; font-size: 0.75rem;">+ Penalty</button>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td class="text-center">
                                    <span class="status-badge ${record.recycleStatus == 'pending' ? 'status-pending' : 'status-verified'}">${record.recycleStatus}</span>
                                </td>

                                <td class="text-center">
                                    <c:choose>
                                        <c:when test="${record.recycleStatus == 'verified'}">
                                            <div class="action-completed"><span>✓</span> Completed</div>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${record.weight > 0}">
                                                    <form action="dashboard" method="POST">
                                                        <input type="hidden" name="action" value="verify">
                                                        <input type="hidden" name="recycleId" value="${record.recycleId}">
                                                        <button type="submit" class="btn-verify-active" onclick="return confirm('Verify this request?')">Verify</button>
                                                    </form>
                                                </c:when>
                                                <c:otherwise>
                                                    <button class="btn-disabled" title="You must input weight before verifying" disabled>Verify</button>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>

    <div id="penaltyModal" class="modal">
        <div class="modal-content">
            <h3>Apply Penalty</h3>
            <p style="font-size: 0.8rem; color: #718096; margin-bottom: 20px;">Rate: RM 0.50 per kg for incorrect items.</p>
            <form action="dashboard" method="POST">
                <input type="hidden" name="action" value="penalty"><input type="hidden" id="userId" name="userId"><input type="hidden" id="recycleId" name="recycleId">
                <input type="number" name="wrongWeight" placeholder="Wrong Weight (kg)" step="0.1" required style="width: 100%; padding: 12px; border: 1px solid var(--glass-border); border-radius: 12px; margin-bottom: 20px;">
                <button type="submit" class="btn-verify-active" style="width: 100%; background: var(--danger); margin-bottom: 10px;">Apply Penalty</button>
                <button type="button" onclick="closePenaltyModal()" style="width: 100%; border: none; background: transparent; color: #718096; cursor: pointer;">Cancel</button>
            </form>
        </div>
    </div>

    <div id="weightModal" class="modal">
        <div class="modal-content">
            <h3>Input Weight</h3>
            <form action="dashboard" method="POST">
                <input type="hidden" name="action" value="weight"><input type="hidden" id="recycleId2" name="requestId">
                <input type="number" name="weight" placeholder="Actual Weight (kg)" step="0.1" required style="width: 100%; padding: 12px; border: 1px solid var(--glass-border); border-radius: 12px; margin-bottom: 20px;">
                <button type="submit" class="btn-verify-active" style="width: 100%; margin-bottom: 10px;">Save Weight</button>
                <button type="button" onclick="closeWeightModal()" style="width: 100%; border: none; background: transparent; color: #718096; cursor: pointer;">Cancel</button>
            </form>
        </div>
    </div>

    <script>
        function closePenaltyModal() { document.getElementById('penaltyModal').style.display = 'none'; }
        function openPenaltyModal(userId, recycleId) {
            document.getElementById('userId').value = userId;
            document.getElementById('recycleId').value = recycleId;
            document.getElementById('penaltyModal').style.display = 'flex';
        }
        function closeWeightModal() { document.getElementById('weightModal').style.display = 'none'; }
        function openWeightModal(recycleId) {
            document.getElementById('recycleId2').value = recycleId;
            document.getElementById('weightModal').style.display = 'flex';
        }
    </script>
</body>
</html>