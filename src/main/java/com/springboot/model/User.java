package com.springboot.model;


import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="users")
public class User {

	@Id
	@Column(name="username")
	private String userName;
	
	@Column(name="password")
	private String password;
	
	@Column(name="name")
	private String fullName;
	
	@Column(name="address")
	private String address;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="email")
	private String email;
	
	@Column(name="image")
	private byte[] image;
	
	@Column(name="enabled")
	private int enabled;
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,mappedBy = "user")
    private List<Authorities> authorities = new ArrayList<>();
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(String userName, String password, String fullName, String address, String phone, String email,
			byte[] image, int enabled) {
		this.userName = userName;
		this.password = password;
		this.fullName = fullName;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.image = image;
		this.enabled = enabled;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getImage() {
		if(image == null) return null;
		return Base64.getEncoder().encodeToString(image);
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public List<Authorities> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<Authorities> authorities) {
		this.authorities = authorities;
	}
	
	public byte[] getImageByte() {
		return image;
	}
	
}
