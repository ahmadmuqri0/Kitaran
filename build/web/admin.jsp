<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Kitaran</title>
    <link rel="stylesheet" href="style.css">
</head>
<body onload="loadAdminPanel()">
    <%
        // Admin authentication check
        if (session.getAttribute("admin") == null || !"true".equals(session.getAttribute("admin"))) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>
    
    <div class="app-container">
        <div class="sidebar">
            <div class="logo">Kitaran<span>Admin</span></div>
            <div class="nav-links">
                <a href="admin.jsp" class="active"> Admin Panel</a>
                
                <div class="spacer"></div>
                
                <a href="#" onclick="resetSystem()" class="reset"> Reset Demo</a>
                <a href="logout.jsp" onclick="return confirm('Are you sure you want to logout?')" class="logout"> Logout</a>
            </div>
        </div>

        <div class="main-content">
            <h2 style="margin-bottom:20px;">Admin Dashboard</h2>
            
            <div class="stats-row">
                <div class="stat-card">
                    <span class="stat-num" id="total-weight-all">
                        ${totalSystemWeight != null ? totalSystemWeight : '0'} kg
                    </span>
                    <span class="stat-label">System Total Weight</span>
                </div>
                <div class="stat-card">
                    <span class="stat-num" id="total-requests">
                        ${totalRequests != null ? totalRequests : '0'}
                    </span>
                    <span class="stat-label">Total Requests</span>
                </div>
                <div class="stat-card">
                    <span class="stat-num" id="pending-requests">
                        ${pendingRequests != null ? pendingRequests : '0'}
                    </span>
                    <span class="stat-label">Pending Requests</span>
                </div>
            </div>

            <div class="box">
                <h3>Manage Requests</h3>
                
                <div class="filter-bar">
                    <a href="admin.jsp?filter=all" class="filter-btn ${param.filter == 'all' || param.filter == null ? 'active' : ''}">All</a>
                    <a href="admin.jsp?filter=pending" class="filter-btn ${param.filter == 'pending' ? 'active' : ''}">Pending</a>
                    <a href="admin.jsp?filter=verified" class="filter-btn ${param.filter == 'verified' ? 'active' : ''}">Verified</a>
                    <a href="admin.jsp?filter=penalty" class="filter-btn ${param.filter == 'penalty' ? 'active' : ''}">Penalty Issues</a>
                </div>

                <%
                    String filter = request.getParameter("filter");
                    if (filter == null) filter = "all";
                    
                    String message = (String) request.getAttribute("message");
                    if (message != null) {
                %>
                    <div class="alert alert-info" style="margin: 10px 0; padding: 10px; background: #d4edda; color: #155724; border-radius: 5px;">
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
                    <tbody id="admin-table-body">
                        <!-- 
                            This section will be populated by JavaScript initially.
                            Later, you can replace with server-side code when you have database.
                        -->
                        <tr>
                            <td colspan="8" style="text-align:center; padding:20px; color:#666;">
                                Loading requests... (JavaScript will populate this)
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Penalty Modal -->
    <div id="penaltyModal" class="modal" style="display:none;">
        <div class="modal-content">
            <h3 > Penalty Calculation</h3>
            <p style="font-size:0.9rem; margin-bottom:15px; color:#666;">Item category does not match.</p>
            
            <form id="penaltyForm" action="adminAction.jsp" method="POST">
                <input type="hidden" id="requestId" name="requestId">
                <input type="hidden" name="action" value="applyPenalty">
                
                <label style="text-align:left; display:block; font-size:0.8rem; font-weight:600;">
                    Weight of Miss-Categorized Item (kg)
                </label>
                <input type="number" id="wrong-weight" name="wrongWeight" placeholder="e.g. 5" step="0.1" min="0" required>
                
                <p style="font-size:0.8rem; color:#666; margin-bottom:15px;">Rate: RM 0.50 per kg.</p>

                <button type="submit" class="btn btn-red">Confirm Penalty</button>
                <button type="button" onclick="closePenaltyModal()" class="btn" style="background:#e5e7eb; color:#333; margin-top:10px;">Cancel</button>
            </form>
        </div>
    </div>

    <script src="script.js"></script>
    <script>
        function openPenaltyModal(requestId) {
            document.getElementById('requestId').value = requestId;
            document.getElementById('penaltyModal').style.display = 'flex';
        }
        
        function closePenaltyModal() {
            document.getElementById('penaltyModal').style.display = 'none';
            document.getElementById('wrong-weight').value = '';
        }
        
        // Close modal when clicking outside
        window.onclick = function(event) {
            var modal = document.getElementById('penaltyModal');
            if (event.target == modal) {
                closePenaltyModal();
            }
        }
        
        // JavaScript function to load admin panel data
        function loadAdminPanel(filter) {
            // This function should be in your script.js file
            // It will populate the table with data
            console.log('Loading admin panel with filter:', filter);
            
            // For now, keep the existing JavaScript functionality
            // You'll need to update your script.js to work with JSP
        }
    </script>
</body>
</html>