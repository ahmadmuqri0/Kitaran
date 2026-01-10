package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <link href=\"globals.css\" rel=\"stylesheet\">\r\n");
      out.write("    <title>Admin - Kitaran</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    ");

        if (session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    
      out.write("\r\n");
      out.write("    <div class=\"app-container\">\r\n");
      out.write("        <div class=\"sidebar\">\r\n");
      out.write("            <div class=\"logo\">Ki<span>TARAN</span></div>\r\n");
      out.write("            <div class=\"nav-links\">\r\n");
      out.write("                <a href=\"dashboard.jsp\" class=\"active\"> Dashboard</a>\r\n");
      out.write("                <a href=\"input.jsp\"> New Request</a>\r\n");
      out.write("                <a href=\"logout\" class=\"logout\"> Logout</a>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"main-content\">\r\n");
      out.write("            <h2 style=\"margin-bottom:20px;\">Welcome, <span id=\"username-display\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.username != null ? sessionScope.username : 'User'}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span></h2>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"stats-row\">\r\n");
      out.write("                <div class=\"stat-card\">\r\n");
      out.write("                    <span class=\"stat-num\" id=\"total-weight\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${totalWeight != null ? totalWeight : '0'}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(" kg</span>\r\n");
      out.write("                    <span class=\"stat-label\">Total Recycled Weight</span>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"stat-card\">\r\n");
      out.write("                    <span class=\"stat-num\" id=\"bill-amount\">RM ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${outstandingPenalty != null ? outstandingPenalty : '0.00'}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span>\r\n");
      out.write("                    <span class=\"stat-label\">Outstanding Penalty</span>\r\n");
      out.write("                    \r\n");
      out.write("                    <c:if test=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${outstandingPenalty > 0}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("                        <div id=\"pay-section\" style=\"width:100%; margin-top:10px;\">\r\n");
      out.write("                            <button onclick=\"payBill()\" class=\"btn btn-red\" style=\"padding:8px; font-size:0.8rem;\">Pay Now</button>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </c:if>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"box\">\r\n");
      out.write("                <h3>My Recycling History</h3>\r\n");
      out.write("                <table>\r\n");
      out.write("                    <thead>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <th>Type</th>\r\n");
      out.write("                            <th>Item</th>\r\n");
      out.write("                            <th>Verified Weight</th>\r\n");
      out.write("                            <th>Penalty Cost</th>\r\n");
      out.write("                            <th>Status</th>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </thead>\r\n");
      out.write("                    <tbody id=\"user-table\">\r\n");
      out.write("                        <!-- You can use JSTL to loop through recycling history -->\r\n");
      out.write("                        ");
      out.write("\r\n");
      out.write("                    </tbody>\r\n");
      out.write("                </table>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <script src=\"script.js\"></script>\r\n");
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
