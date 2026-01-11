package org.apache.jsp.WEB_002dINF;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kitaran.bean.User;

public final class admin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/globals.css\" rel=\"stylesheet\">\r\n");
      out.write("    <title>Admin Panel - Kitaran</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <!--Check user authenticate ke tidak-->\r\n");
      out.write("    ");

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div class=\"app-container\">\r\n");
      out.write("        <aside class=\"sidebar\">\r\n");
      out.write("            <div class=\"logo\">Ki<span>TARAN</span></div>\r\n");
      out.write("            <nav class=\"nav-links\">\r\n");
      out.write("                <ul>\r\n");
      out.write("                    <li><a href=\"dashboard\" class=\"active\">Admin Panel</a></li>\r\n");
      out.write("                    <li class=\"spacer\"></li>\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <form action=\"logout\" method=\"post\">\r\n");
      out.write("                            <button type=\"submit\" class=\"logout\">Logout</button>\r\n");
      out.write("                        </form>\r\n");
      out.write("                    </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </nav>\r\n");
      out.write("        </aside>\r\n");
      out.write("        \r\n");
      out.write("\r\n");
      out.write("        <main class=\"container\">\r\n");
      out.write("            <section>\r\n");
      out.write("                <h2>Admin Dashboard</h2>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"stats-row\">\r\n");
      out.write("                    <div class=\"stat-card\">\r\n");
      out.write("                        <span class=\"stat-num\">\r\n");
      out.write("                            ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${totalSystemWeight != null ? totalSystemWeight : '0'}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(" kg\r\n");
      out.write("                        </span>\r\n");
      out.write("                        <span class=\"stat-label\">System Total Weight</span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"stat-card\">\r\n");
      out.write("                        <span class=\"stat-num\">\r\n");
      out.write("                            ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${totalRequests != null ? totalRequests : '0'}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\r\n");
      out.write("                        </span>\r\n");
      out.write("                        <span class=\"stat-label\">Total Requests</span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"stat-card\">\r\n");
      out.write("                        <span class=\"stat-num\">\r\n");
      out.write("                            ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pendingRequests != null ? pendingRequests : '0'}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\r\n");
      out.write("                        </span>\r\n");
      out.write("                        <span class=\"stat-label\">Pending Requests</span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"box\">\r\n");
      out.write("                    <h3>Manage Requests</h3>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"mb-3\">\r\n");
      out.write("                        <a href=\"admin.jsp?filter=all\" class=\"filter-btn ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.filter == 'all' || param.filter == null ? 'active' : ''}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">All</a>\r\n");
      out.write("                        <a href=\"admin.jsp?filter=pending\" class=\"filter-btn ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.filter == 'pending' ? 'active' : ''}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">Pending</a>\r\n");
      out.write("                        <a href=\"admin.jsp?filter=verified\" class=\"filter-btn ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.filter == 'verified' ? 'active' : ''}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">Verified</a>\r\n");
      out.write("                        <a href=\"admin.jsp?filter=penalty\" class=\"filter-btn ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.filter == 'penalty' ? 'active' : ''}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">Penalty Issues</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    ");

                        String filter = request.getParameter("filter");
                        if (filter == null) filter = "all";

                        String message = (String) request.getAttribute("message");
                        if (message != null) {
                    
      out.write("\r\n");
      out.write("                        <div class=\"alert alert-success\">\r\n");
      out.write("                            ");
      out.print( message );
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    <table>\r\n");
      out.write("                        <thead>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <th>ID</th>\r\n");
      out.write("                                <th>User</th>\r\n");
      out.write("                                <th>Type</th>\r\n");
      out.write("                                <th>Item</th>\r\n");
      out.write("                                <th>Weight</th>\r\n");
      out.write("                                <th>Penalty</th>\r\n");
      out.write("                                <th>Status</th>\r\n");
      out.write("                                <th>Action</th>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                        </thead>\r\n");
      out.write("                        <tbody>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <!-- Todo: populate data with java -->\r\n");
      out.write("                                <td colspan=\"8\" class=\"text-center text-muted\">\r\n");
      out.write("                                    No data yet\r\n");
      out.write("                                </td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                        </tbody>\r\n");
      out.write("                    </table>\r\n");
      out.write("                </div>\r\n");
      out.write("            </section>\r\n");
      out.write("        </main>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <!-- Penalty Modal -->\r\n");
      out.write("    <div id=\"penaltyModal\" class=\"modal\">\r\n");
      out.write("        <div class=\"modal-content\">\r\n");
      out.write("            <h3>Penalty Calculation</h3>\r\n");
      out.write("            <p class=\"text-sm mb-3 text-muted\">Item category does not match.</p>\r\n");
      out.write("\r\n");
      out.write("            <form id=\"penaltyForm\" action=\"adminAction.jsp\" method=\"POST\">\r\n");
      out.write("                <input type=\"hidden\" id=\"requestId\" name=\"requestId\">\r\n");
      out.write("                <input type=\"hidden\" name=\"action\" value=\"applyPenalty\">\r\n");
      out.write("\r\n");
      out.write("                <label class=\"text-left d-block text-sm font-semibold mb-1\">\r\n");
      out.write("                    Weight of Miss-Categorized Item (kg)\r\n");
      out.write("                </label>\r\n");
      out.write("                <input type=\"number\" id=\"wrong-weight\" name=\"wrongWeight\" placeholder=\"e.g. 5\" step=\"0.1\" min=\"0\" required>\r\n");
      out.write("\r\n");
      out.write("                <p class=\"text-sm text-muted mb-3\">Rate: RM 0.50 per kg.</p>\r\n");
      out.write("\r\n");
      out.write("                <button type=\"submit\" class=\"btn btn-red w-full\">Confirm Penalty</button>\r\n");
      out.write("                <button type=\"button\" onclick=\"closePenaltyModal()\" class=\"btn btn-secondary w-full mt-2\">Cancel</button>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <script>\r\n");
      out.write("        function closePenaltyModal() {\r\n");
      out.write("            document.getElementById('penaltyModal').style.display = 'none';\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        function openPenaltyModal(requestId) {\r\n");
      out.write("            document.getElementById('requestId').value = requestId;\r\n");
      out.write("            document.getElementById('penaltyModal').style.display = 'flex';\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        // Close modal on outside click\r\n");
      out.write("        window.onclick = function(event) {\r\n");
      out.write("            const modal = document.getElementById('penaltyModal');\r\n");
      out.write("            if (event.target == modal) {\r\n");
      out.write("                closePenaltyModal();\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
