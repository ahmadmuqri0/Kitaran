package kitaran.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kitaran.bean.User;
import kitaran.bean.Recycle;
import kitaran.bean.Payment;
import kitaran.dao.RecycleDAO;
import kitaran.dao.PaymentDAO;
import java.util.ArrayList;

public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        RecycleDAO recycleDAO = new RecycleDAO();
        PaymentDAO paymentDAO = new PaymentDAO();
        ArrayList<Recycle> recycles = null;
        ArrayList<Payment> payments = null;
        
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        
        if (user.getIsAdmin()) {
            
            recycles = recycleDAO.getAllRecycles();
            payments = paymentDAO.getAllPayments();
            
            session.setAttribute("recycles", recycles);
            session.setAttribute("payments", payments);
            
            request.getRequestDispatcher("/WEB-INF/jsp/admin.jsp").forward(request, response);
        }
        
        request.getRequestDispatcher("/WEB-INF/jsp/dashboard.jsp").forward(request, response);
    }
}
