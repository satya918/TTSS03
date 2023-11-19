package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.ViewMyTrainings;

public interface ViewMyTrainingsService {
	
	public void getdata(String treasuryid);
	
	List<ViewMyTrainings>findByTreasuryId(String treasuryid );

}
