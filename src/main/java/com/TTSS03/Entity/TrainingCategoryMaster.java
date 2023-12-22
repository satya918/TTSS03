package com.TTSS03.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="tcategorymaster")
public class TrainingCategoryMaster {
	
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 
	 private long slno;
	 private String trainingcategory;
	public long getSlno() {
		return slno;
	}
	public void setSlno(long slno) {
		this.slno = slno;
	}
	public String getTrainingcategory() {
		return trainingcategory;
	}
	public void setTrainingcategory(String trainingcategory) {
		this.trainingcategory = trainingcategory;
	}
	 
	 

}
