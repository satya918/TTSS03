package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.AppliedTrainingsFromTrainee;

public interface AppliedTrainingsFromTraineeService {
	
	
	AppliedTrainingsFromTrainee saveEmployeeTrainings(AppliedTrainingsFromTrainee appliedTrainingsFromTrainee);
	
    public void saveDataToSpecificColumns(String treasuryid, String schoolcomplexid, String participantname,String mobileofparticipant,String emailofparticipant ) ;

    void updateColsByMaxSlno(String treasuryid);
}
