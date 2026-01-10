/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kitaran.bean;

public class User {
    private int id;
    private String username;
    private String password;
    private String noPhone;
    private boolean isAdmin;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getNoPhone() {
        return noPhone;
    }
    
    public void setNoPhone(String noPhone) {
        this.noPhone = noPhone;
    }
    
    public boolean getIsAdmin() {
        return isAdmin;
    }
    
    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
}
