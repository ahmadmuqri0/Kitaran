package org.apache.jsp.WEB_002dINF;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kitaran.bean.User;

public final class payment_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>FPX Payment Gateway - Kitaran</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/globals.css\">\n");
      out.write("    <style>\n");
      out.write("        .fpx-container {\n");
      out.write("            max-width: 500px;\n");
      out.write("            margin: 50px auto;\n");
      out.write("            background: white;\n");
      out.write("            padding: 40px;\n");
      out.write("            border-radius: 10px;\n");
      out.write("            box-shadow: 0 10px 30px rgba(0,0,0,0.1);\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("        .fpx-header {\n");
      out.write("            border-bottom: 2px solid #f3f4f6;\n");
      out.write("            padding-bottom: 20px;\n");
      out.write("            margin-bottom: 30px;\n");
      out.write("        }\n");
      out.write("        .bank-logo-grid {\n");
      out.write("            display: grid;\n");
      out.write("            grid-template-columns: 1fr 1fr 1fr;\n");
      out.write("            gap: 10px;\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("        }\n");
      out.write("        .bank-option {\n");
      out.write("            border: 1px solid #ddd;\n");
      out.write("            padding: 10px;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            font-size: 0.8rem;\n");
      out.write("            font-weight: 600;\n");
      out.write("            color: #555;\n");
      out.write("            transition: 0.2s;\n");
      out.write("        }\n");
      out.write("        .bank-option:hover {\n");
      out.write("            border-color: #4CAF50;\n");
      out.write("            background: #f0f9f0;\n");
      out.write("        }\n");
      out.write("        .bank-option.selected {\n");
      out.write("            border-color: #4CAF50;\n");
      out.write("            background: #e8f5e9;\n");
      out.write("            color: #2e7d32;\n");
      out.write("        }\n");
      out.write("        .amount-box {\n");
      out.write("            background: #fef3c7;\n");
      out.write("            color: #d97706;\n");
      out.write("            padding: 15px;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            font-size: 1.5rem;\n");
      out.write("            font-weight: 700;\n");
      out.write("            margin-bottom: 30px;\n");
      out.write("        }\n");
      out.write("        .error-msg {\n");
      out.write("            background: #fee2e2;\n");
      out.write("            color: #dc2626;\n");
      out.write("            padding: 10px;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("        }\n");
      out.write("        .success-msg {\n");
      out.write("            background: #d1fae5;\n");
      out.write("            color: #065f46;\n");
      out.write("            padding: 10px;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    ");

        // Check authentication
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        // Get error/success messages
        String error = (String) session.getAttribute("error");
        String success = (String) session.getAttribute("success");
        
        // Get amount from parameter
        String amountParam = request.getParameter("amount");
        double amount = 0.00;
        if (amountParam != null && !amountParam.trim().isEmpty()) {
            try {
                amount = Double.parseDouble(amountParam);
            } catch (NumberFormatException e) {
                error = "Invalid amount specified";
            }
        }
        
        // Clear messages after displaying
        session.removeAttribute("error");
        session.removeAttribute("success");
    
      out.write("\n");
      out.write("    \n");
      out.write("    <div class=\"fpx-container\">\n");
      out.write("        <div class=\"fpx-header\">\n");
      out.write("            <h2 style=\"color:#4CAF50\">FPX Secure Gateway</h2>\n");
      out.write("            <p style=\"color:#888; font-size:0.9rem;\">Kitaran System Payment</p>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        ");
 if (error != null) { 
      out.write("\n");
      out.write("            <div class=\"error-msg\">");
      out.print( error );
      out.write("</div>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("        \n");
      out.write("        ");
 if (success != null) { 
      out.write("\n");
      out.write("            <div class=\"success-msg\">");
      out.print( success );
      out.write("</div>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("        \n");
      out.write("        <form action=\"PaymentServlet\" method=\"post\" id=\"paymentForm\">\n");
      out.write("            <input type=\"hidden\" name=\"action\" value=\"processPayment\">\n");
      out.write("            <input type=\"hidden\" name=\"amount\" id=\"amountInput\" value=\"");
      out.print( amount );
      out.write("\">\n");
      out.write("            <input type=\"hidden\" name=\"bankName\" id=\"selectedBank\" value=\"\">\n");
      out.write("            \n");
      out.write("            <div style=\"text-align:left; margin-bottom:10px; font-weight:600; color:#555;\">\n");
      out.write("                Total Amount Payable:\n");
      out.write("            </div>\n");
      out.write("            <div class=\"amount-box\" id=\"pay-display\">\n");
      out.write("                RM ");
      out.print( String.format("%.2f", amount) );
      out.write("\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div style=\"text-align:left; margin-bottom:10px; font-weight:600; color:#555;\">\n");
      out.write("                Select Bank:\n");
      out.write("            </div>\n");
      out.write("            <div class=\"bank-logo-grid\">\n");
      out.write("                <div class=\"bank-option\" onclick=\"selectBank(this, 'Maybank2u')\">Maybank2u</div>\n");
      out.write("                <div class=\"bank-option\" onclick=\"selectBank(this, 'CIMB Clicks')\">CIMB Clicks</div>\n");
      out.write("                <div class=\"bank-option\" onclick=\"selectBank(this, 'Public Bank')\">Public Bank</div>\n");
      out.write("                <div class=\"bank-option\" onclick=\"selectBank(this, 'RHB Now')\">RHB Now</div>\n");
      out.write("                <div class=\"bank-option\" onclick=\"selectBank(this, 'AmBank')\">AmBank</div>\n");
      out.write("                <div class=\"bank-option\" onclick=\"selectBank(this, 'Bank Islam')\">Bank Islam</div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <button type=\"submit\" class=\"btn w-full mb-2\">Proceed to Pay</button>\n");
      out.write("        </form>\n");
      out.write("        <a href=\"dashboard\" class=\"btn btn-secondary w-full\" style=\"text-decoration: none; display:block;\">\n");
      out.write("            Cancel\n");
      out.write("        </a>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <script>\n");
      out.write("        let selectedBankName = \"\";\n");
      out.write("        \n");
      out.write("        function selectBank(element, bankName) {\n");
      out.write("            // Remove selection from all banks\n");
      out.write("            const allBanks = document.querySelectorAll('.bank-option');\n");
      out.write("            allBanks.forEach(bank => bank.classList.remove('selected'));\n");
      out.write("            \n");
      out.write("            // Add selection to clicked bank\n");
      out.write("            element.classList.add('selected');\n");
      out.write("            selectedBankName = bankName;\n");
      out.write("            \n");
      out.write("            // Update hidden input\n");
      out.write("            document.getElementById('selectedBank').value = bankName;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        // Form validation\n");
      out.write("        document.getElementById('paymentForm').addEventListener('submit', function(e) {\n");
      out.write("            const amount = parseFloat(document.getElementById('amountInput').value);\n");
      out.write("            const bank = document.getElementById('selectedBank').value;\n");
      out.write("            \n");
      out.write("            if (!bank || bank.trim() === '') {\n");
      out.write("                e.preventDefault();\n");
      out.write("                alert('Please select a bank before proceeding.');\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            if (amount <= 0 || isNaN(amount)) {\n");
      out.write("                e.preventDefault();\n");
      out.write("                alert('Invalid payment amount.');\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            return true;\n");
      out.write("        });\n");
      out.write("    </script>\n");
      out.write("</body>\n");
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
