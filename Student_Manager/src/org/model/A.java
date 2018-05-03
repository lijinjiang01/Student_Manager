package org.model;

/**
 * A entity. @author MyEclipse Persistence Tools
 */

public class A implements java.io.Serializable {

	// Fields

	private String id;
	private String password;

	// Constructors

	/** default constructor */
	public A() {
	}

	/** full constructor */
	public A(String id, String password) {
		this.id = id;
		this.password = password;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}