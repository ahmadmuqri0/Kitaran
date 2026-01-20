package kitaran.bean;

public class UserDTO {
    private int recycleId;
    private String type;
    private String item;
    private double weight;
    private double penalty;
    private String status;
    private boolean penaltyStatus;
    
    public int getRecycleId() {
        return recycleId;
    }
    
    public void setRecycleId(int recycleId) {
        this.recycleId = recycleId;
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
    
    public double getWeight() {
        return weight;
    }
    
    public void setWeight(double weight) {
        this.weight = weight;
    }
    
    public double getPenalty() {
        return penalty;
    }
    
    public void setPenalty(double penalty) {
        this.penalty = penalty;
    }
    
    public boolean getPenaltyStatus() {
        return penaltyStatus;
    }
    
    public void setPenaltyStatus(boolean penaltyStatus) {
        this.penaltyStatus = penaltyStatus;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
}
