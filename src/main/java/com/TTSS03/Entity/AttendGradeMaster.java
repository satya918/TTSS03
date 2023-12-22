package com.TTSS03.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="tgrademaster")
public class AttendGradeMaster {
	
	@Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long slno;
	private String attendgrade;
	public long getSlno() {
		return slno;
	}
	public void setSlno(long slno) {
		this.slno = slno;
	}
	public String getAttendgrade() {
		return attendgrade;
	}
	public void setAttendgrade(String attendgrade) {
		this.attendgrade = attendgrade;
	}
	
	 
	

}
