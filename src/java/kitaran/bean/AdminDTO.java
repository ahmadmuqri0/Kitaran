package kitaran.bean;

public class AdminDTO {
    private int userId;
    private int recycleId;
    private String username;
    private String type;
    private String item;
    private String address;
    private double weight;
    private String recycleStatus;
    private int paymentId;
    private double penaltyAmount;
    private String paymentStatus;
    private String bankName;
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public int getRecycleId() {
        return recycleId;
    }
    
    public void setRecycleId(int recycleId) {
        this.recycleId = recycleId;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getType() {
        return type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    public String getItem() {
        return item;
    }
    
    public void setItem(String item) {
        this.item = item;
    }
    
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public double getWeight() {
        return weight;
    }
    
    public void setWeight(double weight) {
        this.weight = weight;
    }
    
    public String getRecycleStatus() {
        return recycleStatus;
    }
    
    public void setRecycleStatus(String recycleStatus) {
        this.recycleStatus = recycleStatus;
    }
    
    public int getPaymentId() {
        return paymentId;
    }
    
    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }
    
    public double getPenaltyAmount() {
        return penaltyAmount;
    }
    
    public void setPenaltyAmount(double penaltyAmount) {
        this.penaltyAmount = penaltyAmount;
    }
    
    public String getPaymentStatus() {
        return paymentStatus;
    }
    
    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
    
    public String getBankName() {
        return bankName;
    }
    
    public void setBankName(String bankName) {
        this.bankName = bankName;
    }
}
