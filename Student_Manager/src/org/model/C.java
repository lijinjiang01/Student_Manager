package org.model;

import java.util.HashSet;
import java.util.Set;

/**
 * C entity. @author MyEclipse Persistence Tools
 */

public class C implements java.io.Serializable {

	// Fields

	private String cno;
	private D d;
	private String cname;
	private Integer rate;
	private Integer credit;
	private Set xes = new HashSet(0);
	private Set gs = new HashSet(0);
	private Set os = new HashSet(0);

	// Constructors

	/** default constructor */
	public C() {
	}

	/** minimal constructor */
	public C(String cno, D d, String cname, Integer rate, Integer credit) {
		this.cno = cno;
		this.d = d;
		this.cname = cname;
		this.rate = rate;
		this.credit = credit;
	}

	/** full constructor */
	public C(String cno, D d, String cname, Integer rate, Integer credit,
			Set xes, Set gs, Set os) {
		this.cno = cno;
		this.d = d;
		this.cname = cname;
		this.rate = rate;
		this.credit = credit;
		this.xes = xes;
		this.gs = gs;
		this.os = os;
	}

	// Property accessors

	public String getCno() {
		return this.cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public D getD() {
		return this.d;
	}

	public void setD(D d) {
		this.d = d;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Integer getRate() {
		return this.rate;
	}

	public void setRate(Integer rate) {
		this.rate = rate;
	}

	public Integer getCredit() {
		return this.credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	public Set getXes() {
		return this.xes;
	}

	public void setXes(Set xes) {
		this.xes = xes;
	}

	public Set getGs() {
		return this.gs;
	}

	public void setGs(Set gs) {
		this.gs = gs;
	}

	public Set getOs() {
		return this.os;
	}

	public void setOs(Set os) {
		this.os = os;
	}

}