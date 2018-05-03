package org.model;

/**
 * XId entity. @author MyEclipse Persistence Tools
 */

public class XId implements java.io.Serializable {

	// Fields

	private C c;
	private T t;
	private S s;

	// Constructors

	/** default constructor */
	public XId() {
	}

	/** full constructor */
	public XId(C c, T t, S s) {
		this.c = c;
		this.t = t;
		this.s = s;
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

	public S getS() {
		return this.s;
	}

	public void setS(S s) {
		this.s = s;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof XId))
			return false;
		XId castOther = (XId) other;

		return ((this.getC() == castOther.getC()) || (this.getC() != null
				&& castOther.getC() != null && this.getC().equals(
				castOther.getC())))
				&& ((this.getT() == castOther.getT()) || (this.getT() != null
						&& castOther.getT() != null && this.getT().equals(
						castOther.getT())))
				&& ((this.getS() == castOther.getS()) || (this.getS() != null
						&& castOther.getS() != null && this.getS().equals(
						castOther.getS())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getC() == null ? 0 : this.getC().hashCode());
		result = 37 * result + (getT() == null ? 0 : this.getT().hashCode());
		result = 37 * result + (getS() == null ? 0 : this.getS().hashCode());
		return result;
	}

}