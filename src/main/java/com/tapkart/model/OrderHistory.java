package com.tapkart.model;

import java.time.LocalDateTime;

public class OrderHistory {
    private int historyId;
    private int orderId;
    private LocalDateTime statusChangeDate;
    private String status;  // Single status field

    public OrderHistory(int historyId, int orderId, LocalDateTime statusChangeDate, String status) {
        this.historyId = historyId;
        this.orderId = orderId;
        this.statusChangeDate = statusChangeDate;
        this.status = status;  // Updated constructor
    }
    
    public OrderHistory(int historyId, int orderId, String status) {
		super();
		this.historyId = historyId;
		this.orderId = orderId;
		this.status = status;
	}

	public OrderHistory() {
        // Default constructor
    }

    // Getters and Setters
    public int getHistoryId() {
        return historyId;
    }

    public void setHistoryId(int historyId) {
        this.historyId = historyId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public LocalDateTime getStatusChangeDate() {
        return statusChangeDate;
    }

    public void setStatusChangeDate(LocalDateTime statusChangeDate) {
        this.statusChangeDate = statusChangeDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
