package com.TTSS03.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="tappliedtrainingsfromparticipants")
public class AppliedTrainingsFromTrainee {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int slno;
	private String tname;
	private String tmode;
	private String description;
	private String Apply_start_to_end_date;
	private String maplocation;
	private String coordinator_details;
	private String treasuryid;
	private String schoolcomplexid;
	private String participantname;
	private String mobileofparticipant;
	private String emailofparticipant;
	public int getSlno() {
		return slno;
	}
	public void setSlno(int slno) {
		this.slno = slno;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTmode() {
		return tmode;
	}
	public void setTmode(String tmode) {
		this.tmode = tmode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getApply_start_to_end_date() {
		return Apply_start_to_end_date;
	}
	public void setApply_start_to_end_date(String apply_start_to_end_date) {
		Apply_start_to_end_date = apply_start_to_end_date;
	}
	public String getMaplocation() {
		return maplocation;
	}
	public void setMaplocation(String maplocation) {
		this.maplocation = maplocation;
	}
	public String getCoordinator_details() {
		return coordinator_details;
	}
	public void setCoordinator_details(String coordinator_details) {
		this.coordinator_details = coordinator_details;
	}
	public String getTreasuryid() {
		return treasuryid;
	}
	public void setTreasuryid(String treasuryid) {
		this.treasuryid = treasuryid;
	}
	public String getSchoolcomplexid() {
		return schoolcomplexid;
	}
	public void setSchoolcomplexid(String schoolcomplexid) {
		this.schoolcomplexid = schoolcomplexid;
	}
	public String getParticipantname() {
		return participantname;
	}
	public void setParticipantname(String participantname) {
		this.participantname = participantname;
	}
	public String getMobileofparticipant() {
		return mobileofparticipant;
	}
	public void setMobileofparticipant(String mobileofparticipant) {
		this.mobileofparticipant = mobileofparticipant;
	}
	public String getEmailofparticipant() {
		return emailofparticipant;
	}
	public void setEmailofparticipant(String emailofparticipant) {
		this.emailofparticipant = emailofparticipant;
	}
	

}
