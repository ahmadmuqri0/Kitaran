package kitaran.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kitaran.bean.User;
import kitaran.dao.LoginDao;

public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        
        User user = LoginDao.authenticateUser(username, password);
        
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("dashboard");
        } else {
            request.setAttribute("errorMessage", "Username or password is incorrect");
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect("dashboard");
            return;
        }
        
        String logout = request.getParameter("logout");
        if ("success".equals(logout)) {
            request.setAttribute("successMessage", "You have logged out successfully");
        }
        
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }
}