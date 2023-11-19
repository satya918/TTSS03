package com.TTSS03.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="mytrainings")
public class ViewMyTrainings {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int slno;
	private String treasuryid;
	private String tname;
	private String tdescription;
	private String tmode;
	private String startdate;
	private String enddate;
	private String tagency;
	private String trainername;
	private String vname;
	private String vaddress;
	private String vcontact;
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
	
	public String getDescription() {
		return tdescription;
	}
	public void setDescription(String description) {
		this.tdescription = description;
	}
	public String getTmode() {
		return tmode;
	}
	public void setTmode(String tmode) {
		this.tmode = tmode;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getAgency() {
		return tagency;
	}
	public void setAgency(String agency) {
		this.tagency = agency;
	}
	public String getTrainername() {
		return trainername;
	}
	public void setTrainername(String trainername) {
		this.trainername = trainername;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVaddress() {
		return vaddress;
	}
	public void setVaddress(String vaddress) {
		this.vaddress = vaddress;
	}
	public String getVcontact() {
		return vcontact;
	}
	public void setVcontact(String vcontact) {
		this.vcontact = vcontact;
	}
	public String getTreasuryid() {
		return treasuryid;
	}
	public void setTreasuryid(String treasuryid) {
		this.treasuryid = treasuryid;
	}
	public String getTdescription() {
		return tdescription;
	}
	public void setTdescription(String tdescription) {
		this.tdescription = tdescription;
	}
	public String getTagency() {
		return tagency;
	}
	public void setTagency(String tagency) {
		this.tagency = tagency;
	}
	
	
	

}
