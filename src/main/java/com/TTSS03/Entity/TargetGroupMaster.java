package com.TTSS03.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="ttargetgroupmaster")
public class TargetGroupMaster {
	
	
	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long slno;
	private String targetgroup;
	public long getSlno() {
		return slno;
	}
	public void setSlno(long slno) {
		this.slno = slno;
	}
	public String getTargetgroup() {
		return targetgroup;
	}
	public void setTargetgroup(String targetgroup) {
		this.targetgroup = targetgroup;
	}
	
	

}
