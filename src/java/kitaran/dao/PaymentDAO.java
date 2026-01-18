package kitaran.dao;

import kitaran.bean.Payment;
import kitaran.utils.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO {
    
    public boolean create(Payment payment) {
        String query = "insert into payments (user_id, amount) values (?, ?)";
        
        try {
            Connection conn = DBConnection.connect();
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1, payment.getUserId());
            pstmt.setDouble(2, payment.getAmount());
            
            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            System.err.println("Error creating payment record: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Insert new payment
    public boolean update(Payment payment) {
        String query = "update payments set bank_name=?, status=?, paydate=?, reference=? where id=?";
        
        try {
            Connection conn = DBConnection.connect();
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, payment.getBankName());
            pstmt.setString(2, payment.getPaymentStatus());
            pstmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            pstmt.setString(4, payment.getTransactionRef());
            pstmt.setInt(5, payment.getPaymentId());
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error inserting payment: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Get payment by ID
    public Payment getPaymentById(int paymentId) {
        String query = "select * from payments where id=?";
        Payment payment = null;
        
        try {
            Connection conn = DBConnection.connect();
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1, paymentId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                payment = getPayment(rs);
            }
            
        } catch (SQLException e) {
            System.err.println("Error getting payment: " + e.getMessage());
            e.printStackTrace();
        }
        
        return payment;
    }
    
    // Get all payments by user ID
    public List<Payment> getPaymentsByUserId(int userId) {
        String query = "select * from payments where user_id=? order by paydate DESC";
        List<Payment> payments = new ArrayList<>();
        
        try {
            Connection conn = DBConnection.connect();
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                payments.add(getPayment(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Error getting user payments: " + e.getMessage());
            e.printStackTrace();
        }
        
        return payments;
    }
    
    // Get all payments (for admin)
    public List<Payment> getAllPayments() {
        String query = "select * from payments order by paydate DESC";
        List<Payment> payments = new ArrayList<>();
        
        try {
            Connection conn = DBConnection.connect();
            PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery(query);
            
            while (rs.next()) {
                payments.add(getPayment(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Error getting all payments: " + e.getMessage());
            e.printStackTrace();
        }
        
        return payments;
    }
    
    // Helper method to extract Payment object from ResultSet
    private Payment getPayment(ResultSet rs) throws SQLException {
        Payment payment = new Payment();
        payment.setPaymentId(rs.getInt("id"));
        payment.setUserId(rs.getInt("user_id"));
        payment.setAmount(rs.getDouble("amount"));
        payment.setBankName(rs.getString("bank_name"));
        payment.setPaymentStatus(rs.getString("status"));
        payment.setPaymentDate(rs.getTimestamp("paydate"));
        payment.setTransactionRef(rs.getString("reference"));
        return payment;
    }
}