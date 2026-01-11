package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/globals.css\" rel=\"stylesheet\">\r\n");
      out.write("        <title>Login - Kitaran</title>\r\n");
      out.write("        <style>\r\n");
      out.write("            .login-container {\r\n");
      out.write("                display: flex;\r\n");
      out.write("                justify-content: center;\r\n");
      out.write("                align-items: center;\r\n");
      out.write("                min-height: 100vh;\r\n");
      out.write("                padding: 1rem;\r\n");
      out.write("            }\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <main>\r\n");
      out.write("            <section class=\"container login-container\">\r\n");
      out.write("                <div class=\"card text-center\">\r\n");
      out.write("                    <div class=\"logo\">Ki<span>TARAN</span></div>\r\n");
      out.write("                    <p class=\"subtitle\">Login to 3R Management System</p>\r\n");
      out.write("                    \r\n");
      out.write("                    ");
      out.write("\r\n");
      out.write("                    <form method=\"post\" action=\"login\" id=\"loginForm\" class=\"form-group\">\r\n");
      out.write("                        <div class=\"input-wrapper\">\r\n");
      out.write("                            <label for=\"username\">Username</label>\r\n");
      out.write("                            <input \r\n");
      out.write("                                type=\"text\" \r\n");
      out.write("                                id=\"username\" \r\n");
      out.write("                                name=\"username\" \r\n");
      out.write("                                placeholder=\"Enter your username\" \r\n");
      out.write("                                required\r\n");
      out.write("                                minlength=\"3\"\r\n");
      out.write("                            >\r\n");
      out.write("                        </div>\r\n");
      out.write("                        \r\n");
      out.write("                        <div class=\"input-wrapper\">\r\n");
      out.write("                            <label for=\"password\">Password</label>\r\n");
      out.write("                            <input \r\n");
      out.write("                                type=\"password\" \r\n");
      out.write("                                id=\"password\" \r\n");
      out.write("                                name=\"password\" \r\n");
      out.write("                                placeholder=\"Enter your password\" \r\n");
      out.write("                                required\r\n");
      out.write("                                minlength=\"6\"\r\n");
      out.write("                            >\r\n");
      out.write("                        </div>\r\n");
      out.write("                        \r\n");
      out.write("                        <button type=\"submit\" class=\"btn w-full mt-1\">Login</button>\r\n");
      out.write("                         <p class=\"text-center mt-3 text-sm text-muted\">\r\n");
      out.write("                        Don't have account yet?\r\n");
      out.write("                        <a href=\"register.jsp\" class=\"text-accent font-semibold\" style=\"text-decoration: none;\">Sign Up here</a>\r\n");
      out.write("                    </p>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("            </section>\r\n");
      out.write("        </main>\r\n");
      out.write("        \r\n");
      out.write("        <script src=\"toast.js\"></script>\r\n");
      out.write("        <script>\r\n");
      out.write("            document.addEventListener('DOMContentLoaded', function() {\r\n");
      out.write("                // Tunjuk mesej dari servlet pakai notification\r\n");
      out.write("                ");

                    String errorMessage = (String) request.getAttribute("errorMessage");
                    String successMessage = (String) request.getAttribute("successMessage");
                    
                    if (errorMessage != null) {
                
      out.write("\r\n");
      out.write("                    showError('");
      out.print( errorMessage.replace("'", "\\'") );
      out.write("');\r\n");
      out.write("                ");

                    }
                    
                    if (successMessage != null) {
                
      out.write("\r\n");
      out.write("                    showSuccess('");
      out.print( successMessage.replace("'", "\\'") );
      out.write("');\r\n");
      out.write("                ");

                    }
                
      out.write("\r\n");
      out.write("                \r\n");
      out.write("                // buat form validation pakai notification\r\n");
      out.write("                const form = document.getElementById('loginForm');\r\n");
      out.write("                \r\n");
      out.write("                form.addEventListener('submit', function(event) {\r\n");
      out.write("                    const username = document.getElementById('username').value.trim();\r\n");
      out.write("                    const password = document.getElementById('password').value;\r\n");
      out.write("                    \r\n");
      out.write("                    if (username.length < 3) {\r\n");
      out.write("                        showError('Username must be at least 3 characters long');\r\n");
      out.write("                        event.preventDefault();\r\n");
      out.write("                        return;\r\n");
      out.write("                    }\r\n");
      out.write("                    \r\n");
      out.write("                    if (password.length < 6) {\r\n");
      out.write("                        showError('Password must be at least 6 characters long');\r\n");
      out.write("                        event.preventDefault();\r\n");
      out.write("                        return;\r\n");
      out.write("                    }\r\n");
      out.write("                });\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("    </body>\r\n");
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
