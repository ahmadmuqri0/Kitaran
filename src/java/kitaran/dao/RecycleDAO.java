package kitaran.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import kitaran.bean.Recycle;
import kitaran.utils.DBConnection;

public class RecycleDAO {
    
    public Recycle getRecycleById(int id) {
        String query = "select * from recycles where id=?";
        Recycle request = null;
        
        try {
            Connection conn = DBConnection.connect();
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next()) {
                request = getRecycle(rs);
            }
            
            rs.close();
            pstmt.close();
            conn.close();
            
        } catch(SQLException e) {
            System.err.println("Error getting request: " + e.getMessage());
            e.printStackTrace();
        }
        
        return request;
    }
    
    public ArrayList<Recycle> getRecycleByUserId(int userId) {
        String query = "select * from recycles where user_id=?";
        ArrayList<Recycle> requests = new ArrayList<>();
        
        try {
            Connection conn = DBConnection.connect();
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                requests.add(getRecycle(rs));
            }
            
            rs.close();
            pstmt.close();
            conn.close();
            
        } catch(SQLException e) {
            System.err.println("Error getting requests: " + e.getMessage());
            e.printStackTrace();
        }
        
        return requests;
    }
    
    public ArrayList<Recycle> getAllRecycles() {
        String query = "select * from recycles";
        ArrayList<Recycle> requests = new ArrayList<>();
        
        try {
            Connection conn = DBConnection.connect();
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                requests.add(getRecycle(rs));
            }
            
            rs.close();
            pstmt.close();
            conn.close();
            
        } catch(SQLException e) {
            System.err.println("Error getting requests: " + e.getMessage());
            e.printStackTrace();
        }
        
        return requests;
    }
    
    public boolean create(Recycle recycle) {
        String query = "insert into recycles (user_id, bin_type, item, address) values (?, ?, ?, ?)";
        
        try {
            Connection conn = DBConnection.connect();
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setInt(1, recycle.getUserId());
            pstmt.setString(2, recycle.getType());
            pstmt.setString(3, recycle.getItem());
            pstmt.setString(4, recycle.getAddress());
            
            int rowsInserted = pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            return rowsInserted > 0;
        } catch(SQLException e) {
            System.err.println("Error creating recycle record: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean update(Recycle recycle) {
        String query = "update recycles set weight=? where id=?";
        
        try {
            Connection conn = DBConnection.connect();
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setDouble(1, recycle.getWeight());
            pstmt.setInt(2, recycle.getId());
               
            int rowsAffected = pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            return rowsAffected > 0;
           
        } catch(SQLException e) {
            System.out.println("Error updating recycle: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
        private Recycle getRecycle(ResultSet rs) throws SQLException {
        Recycle recycle = new Recycle();
        recycle.setId(rs.getInt("id"));
        recycle.setUserId(rs.getInt("user_id"));
        recycle.setType(rs.getString("bin_type"));
        recycle.setItem(rs.getString("item"));
        recycle.setAddress(rs.getString("address"));
        recycle.setStatus(rs.getString("status"));
        recycle.setWeight(rs.getDouble("weight"));
        return recycle;
    }
}
