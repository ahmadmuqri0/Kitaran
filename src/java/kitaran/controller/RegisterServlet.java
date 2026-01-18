package kitaran.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kitaran.bean.User;
import kitaran.dao.AuthDAO;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect("dashboard");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        AuthDAO auth = new AuthDAO();
        
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String noPhone = request.getParameter("no_phone").trim();
        
        String registered = auth.register(username, password, noPhone);
        
        if (registered.equals("USER_EXISTS")) {
            request.setAttribute("errorMessage", "This username already exists.");
            request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
        } 
        
        else if (registered.equals("SUCCESS")) {
            User user = auth.authenticate(username, password);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("login");
        } 
        
        else {
            request.setAttribute("errorMessage", "Registration failed. Please try again later.");
            request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
        }
    }
}
