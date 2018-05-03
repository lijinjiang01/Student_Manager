package org.model;

/**
 * O entity. @author MyEclipse Persistence Tools
 */

public class O implements java.io.Serializable {

	// Fields

	private OId id;
	private String time;
	private String addr;

	// Constructors

	/** default constructor */
	public O() {
	}

	/** full constructor */
	public O(OId id, String time, String addr) {
		this.id = id;
		this.time = time;
		this.addr = addr;
	}

	// Property accessors

	public OId getId() {
		return this.id;
	}

	public void setId(OId id) {
		this.id = id;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

}