package kitaran.controller;

import kitaran.dao.PaymentDAO;
import kitaran.bean.Payment;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    
    private PaymentDAO paymentDAO = new PaymentDAO();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("processPayment".equals(action)) {
            processPayment(request, response);
        } else if ("updateStatus".equals(action)) {
            updatePaymentStatus(request, response);
        }
    }
    
    private void processPayment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        try {
            double amount = Double.parseDouble(request.getParameter("amount"));
            String bankName = request.getParameter("bankName");
            
            if (bankName == null || bankName.trim().isEmpty()) {
                session.setAttribute("error", "Please select a bank");
                response.sendRedirect("payment.jsp?amount=" + amount);
                return;
            }
            
            // Create payment object with PENDING status
            Payment payment = new Payment(userId, amount, bankName, "PENDING");
            
            // Insert into database
            boolean success = paymentDAO.insertPayment(payment);
            
            if (success) {
                // Simulate successful payment
                session.setAttribute("success", "Payment of RM " + String.format("%.2f", amount) + 
                                              " via " + bankName + " was successful!");
                response.sendRedirect("dashboard.jsp");
            } else {
                session.setAttribute("error", "Payment processing failed. Please try again.");
                response.sendRedirect("payment.jsp?amount=" + amount);
            }
            
        } catch (NumberFormatException e) {
            session.setAttribute("error", "Invalid amount");
            response.sendRedirect("payment.jsp");
        }
    }
    
    private void updatePaymentStatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int paymentId = Integer.parseInt(request.getParameter("paymentId"));
            String status = request.getParameter("status");
            
            boolean success = paymentDAO.updatePaymentStatus(paymentId, status);
            
            if (success) {
                request.setAttribute("message", "Payment status updated successfully");
            } else {
                request.setAttribute("error", "Failed to update payment status");
            }
            
            response.sendRedirect("dashboard.jsp");
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid payment ID");
            response.sendRedirect("dashboard.jsp");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("viewHistory".equals(action)) {
            viewPaymentHistory(request, response);
        }
    }
    
    private void viewPaymentHistory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        request.setAttribute("payments", paymentDAO.getPaymentsByUserId(userId));
        request.getRequestDispatcher("payment-history.jsp").forward(request, response);
    }
}