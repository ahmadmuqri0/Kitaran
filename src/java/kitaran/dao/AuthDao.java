package kitaran.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import kitaran.bean.User;
import kitaran.utils.DBConnection;

public class AuthDao {
    
    public static String register(String username, String password, String noPhone) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        try {
            conn = DBConnection.connect();
            
            String checkQuery = "SELECT COUNT(*) FROM users WHERE username = ?";
            stmt = conn.prepareStatement(checkQuery);
            stmt.setString(1, username);
            result = stmt.executeQuery();

            if (result.next() && result.getInt(1) > 0) {
                return "USER_EXISTS";
            }
            
            result.close();
            stmt.close();
            
            String insertQuery = "INSERT INTO users (username, password, no_phone, is_admin) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, noPhone);
            stmt.setBoolean(4, false);
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                return "SUCCESS";
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            return "DATABASE_ERROR";
        } finally {
            try {
                if(result != null) result.close();
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "INSERT_FAILED";
    }
    
    public static User authenticate(String username, String password) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet result = null;
        User user = null;
        
        try {
            conn = DBConnection.connect();

            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);

            result = stmt.executeQuery();

            if(result.next()) {
                user = new User();
                user.setId(result.getInt("id"));
                user.setUsername(result.getString("username"));
                user.setPassword(result.getString("password"));
                user.setNoPhone(result.getString("no_phone"));
                user.setIsAdmin(result.getBoolean("is_admin"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(result != null) result.close();
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    
        return user;
    }
}
