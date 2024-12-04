package com.tapkart.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="user")
public class User {
	@Id
	@Column(name="userId")
    private int userId;
	@Column(name="name")
    private String name;
	@Column(name="email")
    private String email;
	@Column(name="phoneNo")
    private String phoneNo;
	@Column(name="address")
    private String address;
	@Column(name="userName")
    private String userName;
	@Column(name="password")
    private String password;
	@Column(name="role")
    private String role;
	@Column(name="createdDate")
    private LocalDateTime createdDate;
	@Column(name="lastLogin")
    private LocalDateTime lastLogin;

    public User(int userId, String name, String email, String phoneNo, String address, String userName, String password,
                String role, LocalDateTime createdDate, LocalDateTime lastLogin) {
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.phoneNo = phoneNo;
        this.address = address;
        this.userName = userName;
        this.password = password;
        this.role = role;
        this.createdDate = createdDate;
        this.lastLogin = lastLogin;
    }
    
    public User(String name, String email, String phoneNo, String address, String userName, String password,
			String role) {
		super();
		this.name = name;
		this.email = email;
		this.phoneNo = phoneNo;
		this.address = address;
		this.userName = userName;
		this.password = password;
		this.role = role;
	}

	public User() {
        // Default constructor
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public LocalDateTime getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(LocalDateTime lastLogin) {
        this.lastLogin = lastLogin;
    }
    
}
