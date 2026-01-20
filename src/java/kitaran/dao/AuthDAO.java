package kitaran.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import kitaran.bean.User;
import kitaran.utils.DBConnection;

public class AuthDAO {
    
    public String register(String username, String password, String noPhone, String address) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;
        try {
            conn = DBConnection.connect();
            
            String checkQuery = "SELECT COUNT(*) FROM users WHERE username = ?";
            pstmt = conn.prepareStatement(checkQuery);
            pstmt.setString(1, username);
            result = pstmt.executeQuery();

            if (result.next() && result.getInt(1) > 0) {
                return "USER_EXISTS";
            }
            
            result.close();
            pstmt.close();
            
            String insertQuery = "INSERT INTO users (username, password, no_phone, address, is_admin) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertQuery);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, noPhone);
            pstmt.setString(4, address);
            pstmt.setBoolean(5, false);
            
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                return "SUCCESS";
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            return "DATABASE_ERROR";
        } finally {
            try {
                if(result != null) result.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "INSERT_FAILED";
    }
    
    public User authenticate(String username, String password) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;
        User user = null;
        
        try {
            conn = DBConnection.connect();

            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            result = pstmt.executeQuery();

            if(result.next()) {
                user = new User();
                user.setId(result.getInt("id"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setNoPhone(result.getString("no_phone"));
                user.setAddress(result.getString("address"));
                user.setIsAdmin(result.getBoolean("is_admin"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(result != null) result.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    
        return user;
    }
}
