package kitaran.bean;

import java.sql.Timestamp;
import java.util.UUID;

public class Payment {
    private int id;
    private int userId;
    private int recycleId;
    private double amount;
    private String bankName;
    private boolean status;
    private Timestamp date;
    private String ref;
    
   
    // Getters and Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public int getRecyleId() {
        return recycleId;
    }
    
    public void setRecycleId(int recycleId) {
        this.recycleId = recycleId;
    }
    
    public double getAmount() {
        return amount;
    }
    
    public void setAmount(double amount) {
        this.amount = amount;
    }
    
    public String getBankName() {
        return bankName;
    }
    
    public void setBankName(String bankName) {
        this.bankName = bankName;
    }
    
    public boolean getStatus() {
        return status;
    }
    
    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public Timestamp getDate() {
        return date;
    }
    
    public void setDate(Timestamp date) {
        this.date = date;
    }
    
    public String getRef() {
        return ref;
    }
    
    public void setRef(String ref) {
        this.ref = ref;
    }
    
    public void generateRef() {
        this.ref = "TXN" + System.currentTimeMillis() + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
    
    @Override
    public String toString() {
        return "Payment{" +
                "paymentId=" + id +
                ", userId=" + userId +
                ", amount=" + amount +
                ", bankName='" + bankName + '\'' +
                ", paymentStatus='" + status + '\'' +
                ", paymentDate=" + date +
                ", transactionRef='" + ref + '\'' +
                '}';
    }
}