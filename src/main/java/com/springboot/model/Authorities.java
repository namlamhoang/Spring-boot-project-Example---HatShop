package com.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="authorities")
public class Authorities {
	
	@Id
	@Column(name="username")
	private String userName;
	
	@Column(name="authority")
	private String authority;
	
	@ManyToOne
	@JoinColumn(name="username",insertable = false,updatable = false)
	private User user;	
	
	public Authorities() {
		// TODO Auto-generated constructor stub
	}
	
	public Authorities(String userName, String authority) {
		super();
		this.userName = userName;
		this.authority = authority;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
