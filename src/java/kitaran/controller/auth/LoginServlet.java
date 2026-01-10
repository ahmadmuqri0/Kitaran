package kitaran.controller.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        

            if ("admin".equals(username) && "admin123".equals(password)) {
                session.setAttribute("username", username);
                response.sendRedirect("admin.jsp");
            }
            else if ("user".equals(username) && "user123".equals(password)) {
                session.setAttribute("username", username);
                response.sendRedirect("dashboard.jsp");
            }
            else {
                request.setAttribute("errorMessage", "Username or password is incorrect");
                response.sendRedirect("login.jsp");
            }
        }
}