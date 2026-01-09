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
        if ("user".equals(session.getAttribute("username"))) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>

    <aside class="sidebar">
        <div class="logo">Ki<span>taran</span></div>
        <div class="nav-links">
            <a href="admin.jsp"> Admin Panel</a>

            <div class="spacer"></div>

            <a href="logout"> Logout</a>
        </div>
    </aside>
    <main class="container">
        <section>
            <h2>Admin Dashboard</h2>

            <div>
                <div>
                    <span>
                        ${totalSystemWeight != null ? totalSystemWeight : '0'} kg
                    </span>
                    <span>System Total Weight</span>
                </div>
                <div>
                    <span>
                        ${totalRequests != null ? totalRequests : '0'}
                    </span>
                    <span>Total Requests</span>
                </div>
                <div>
                    <span>
                        ${pendingRequests != null ? pendingRequests : '0'}
                    </span>
                    <span>Pending Requests</span>
                </div>
            </div>

            <div>
                <h3>Manage Requests</h3>

                <div>
                    <a href="admin.jsp?filter=all" class="filter-btn ${param.filter == 'all' || param.filter == null ? 'active' : ''}">All</a>
                    <a href="admin.jsp?filter=pending" class="filter-btn ${param.filter == 'pending' ? 'active' : ''}">Pending</a>
                    <a href="admin.jsp?filter=verified" class="filter-btn ${param.filter == 'verified' ? 'active' : ''}">Verified</a>
                    <a href="admin.jsp?filter=penalty" class="filter-btn ${param.filter == 'penalty' ? 'active' : ''}">Penalty Issues</a>
                </div>

                <!--Need to be change into toast-->
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
                    <tbody>
                        <tr>
                            <!-- 
                                Todo: populate data with java
                            -->
                            <td colspan="8">
                                No data yet
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </main>

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
</body>
</html>