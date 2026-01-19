<%@page import="kitaran.bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            ${totalSystemWeight != null ? totalSystemWeight : '0'} kg
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
                        <a href="dashboard?filter=all" class="filter-btn ${param.filter == 'all' || param.filter == null ? 'active' : ''}">All</a>
                        <a href="dashboard?filter=pending" class="filter-btn ${param.filter == 'pending' ? 'active' : ''}">Pending</a>
                        <a href="dashboard?filter=verified" class="filter-btn ${param.filter == 'verified' ? 'active' : ''}">Verified</a>
                        <a href="dashboard?filter=penalty" class="filter-btn ${param.filter == 'penalty' ? 'active' : ''}">Penalty Issues</a>
                    </div>

                    <%
                        String filter = request.getParameter("filter");
                        if (filter == null) filter = "all";

                        String message = (String) request.getAttribute("message");
                        if (message != null) {
                    %>
                        <div class="alert alert-success">
                            <%= message %>
                        </div>
                    <%
                        }
                    %>

                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>User</th>
                                <th>Type</th>
                                <th>Item</th>
                                <th>Weight</th>
                                <th>Penalty</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <!-- Todo: populate data with java -->
                                <td colspan="8" class="text-center text-muted">
                                    No data yet
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
        </main>
    </div>

    <!-- Penalty Modal -->
    <div id="penaltyModal" class="modal">
        <div class="modal-content">
            <h3>Penalty Calculation</h3>
            <p class="text-sm mb-3 text-muted">Item category does not match.</p>

            <form id="penaltyForm" action="adminAction.jsp" method="POST">
                <input type="hidden" id="requestId" name="requestId">
                <input type="hidden" name="action" value="applyPenalty">

                <label class="text-left d-block text-sm font-semibold mb-1">
                    Weight of Miss-Categorized Item (kg)
                </label>
                <input type="number" id="wrong-weight" name="wrongWeight" placeholder="e.g. 5" step="0.1" min="0" required>

                <p class="text-sm text-muted mb-3">Rate: RM 0.50 per kg.</p>

                <button type="submit" class="btn btn-red w-full">Confirm Penalty</button>
                <button type="button" onclick="closePenaltyModal()" class="btn btn-secondary w-full mt-2">Cancel</button>
            </form>
        </div>
    </div>

    <script>
        function closePenaltyModal() {
            document.getElementById('penaltyModal').style.display = 'none';
        }
        
        function openPenaltyModal(requestId) {
            document.getElementById('requestId').value = requestId;
            document.getElementById('penaltyModal').style.display = 'flex';
        }
        
        // Close modal on outside click
        window.onclick = function(event) {
            const modal = document.getElementById('penaltyModal');
            if (event.target == modal) {
                closePenaltyModal();
            }
        }
    </script>
</body>
</html>