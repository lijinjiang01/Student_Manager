package org.model;

/**
 * X entity. @author MyEclipse Persistence Tools
 */

public class X implements java.io.Serializable {

	// Fields

	private XId id;

	// Constructors

	/** default constructor */
	public X() {
	}

	/** full constructor */
	public X(XId id) {
		this.id = id;
	}

	// Property accessors

	public XId getId() {
		return this.id;
	}

	public void setId(XId id) {
		this.id = id;
	}

}