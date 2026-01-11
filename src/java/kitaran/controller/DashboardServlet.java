package kitaran.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kitaran.bean.User;


public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        
        if (user.getIsAdmin()) {
            request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
            return;
        }
        
        request.getRequestDispatcher("/WEB-INF/dashboard.jsp").forward(request, response);
    }
}
