package org.model;

/**
 * G entity. @author MyEclipse Persistence Tools
 */

public class G implements java.io.Serializable {

	// Fields

	private GId id;
	private Integer psGrade;
	private Integer ksGrade;
	private Integer totalScore;

	// Constructors

	/** default constructor */
	public G() {
	}

	/** minimal constructor */
	public G(GId id) {
		this.id = id;
	}

	/** full constructor */
	public G(GId id, Integer psGrade, Integer ksGrade, Integer totalScore) {
		this.id = id;
		this.psGrade = psGrade;
		this.ksGrade = ksGrade;
		this.totalScore = totalScore;
	}

	// Property accessors

	public GId getId() {
		return this.id;
	}

	public void setId(GId id) {
		this.id = id;
	}

	public Integer getPsGrade() {
		return this.psGrade;
	}

	public void setPsGrade(Integer psGrade) {
		this.psGrade = psGrade;
	}

	public Integer getKsGrade() {
		return this.ksGrade;
	}

	public void setKsGrade(Integer ksGrade) {
		this.ksGrade = ksGrade;
	}

	public Integer getTotalScore() {
		return this.totalScore;
	}

	public void setTotalScore(Integer totalScore) {
		this.totalScore = totalScore;
	}

}