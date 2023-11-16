package com.TTSS03.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.AppliedTrainingsFromTrainee;
import com.TTSS03.Repository.AppliedTrainingsFromTraineeRepository;

@Service
public class AppliedTrainingsFromTraineeServiceImpl implements AppliedTrainingsFromTraineeService {
	
	
	@Autowired
	AppliedTrainingsFromTraineeRepository appliedTrainingsFromTraineeRepository;

	@Override
	public AppliedTrainingsFromTrainee saveEmployeeTrainings(AppliedTrainingsFromTrainee appliedTrainingsFromTrainee) {
		// TODO Auto-generated method stub
		return appliedTrainingsFromTraineeRepository.save(appliedTrainingsFromTrainee);
	}

	@Override
	public void saveDataToSpecificColumns(String treasuryid, String schoolcomplexid, String participantname,
			String mobileofparticipant, String emailofparticipant) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateColsByMaxSlno(String treasuryid) {
		// TODO Auto-generated method stub
		appliedTrainingsFromTraineeRepository.updateColsByMaxSlno(treasuryid);
		
	}

//	@Override
//	public void saveDataToSpecificColumns(String treasuryid, String schoolcomplexid, String participantname,
//			String mobileofparticipant, String emailofparticipant) {
//		
//		AppliedTrainingsFromTrainee entity =new AppliedTrainingsFromTrainee();
//		
//		entity.setTreasuryid(treasuryid);
//		entity.setSchoolcomplexid(schoolcomplexid);
//		entity.setParticipantname(participantname);
//		entity.setMobileofparticipant(mobileofparticipant);
//		entity.setEmailofparticipant(emailofparticipant);
//		
//		appliedTrainingsFromTraineeRepository.save(entity);
//		
//	}

	

}
