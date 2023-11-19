package com.TTSS03.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="ttrainingmaping")
public class AppliedTrainingsFromTrainee {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int slno;
	private String ref_planner_id;
	private String treasuryid;
	public int getSlno() {
		return slno;
	}
	public void setSlno(int slno) {
		this.slno = slno;
	}
	public String getRef_planner_id() {
		return ref_planner_id;
	}
	public void setRef_planner_id(String ref_planner_id) {
		this.ref_planner_id = ref_planner_id;
	}
	public String getTreasuryid() {
		return treasuryid;
	}
	public void setTreasuryid(String treasuryid) {
		this.treasuryid = treasuryid;
	}
	
	
	
	
}
