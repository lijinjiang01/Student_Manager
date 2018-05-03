package org.model;

/**
 * OId entity. @author MyEclipse Persistence Tools
 */

public class OId implements java.io.Serializable {

	// Fields

	private C c;
	private T t;

	// Constructors

	/** default constructor */
	public OId() {
	}

	/** full constructor */
	public OId(C c, T t) {
		this.c = c;
		this.t = t;
	}

	// Property accessors

	public C getC() {
		return this.c;
	}

	public void setC(C c) {
		this.c = c;
	}

	public T getT() {
		return this.t;
	}

	public void setT(T t) {
		this.t = t;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof OId))
			return false;
		OId castOther = (OId) other;

		return ((this.getC() == castOther.getC()) || (this.getC() != null
				&& castOther.getC() != null && this.getC().equals(
				castOther.getC())))
				&& ((this.getT() == castOther.getT()) || (this.getT() != null
						&& castOther.getT() != null && this.getT().equals(
						castOther.getT())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getC() == null ? 0 : this.getC().hashCode());
		result = 37 * result + (getT() == null ? 0 : this.getT().hashCode());
		return result;
	}

}