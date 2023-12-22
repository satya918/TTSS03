package com.TTSS03.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.TrainingCategoryMaster;
import com.TTSS03.Repository.TrainingCategoryMasterRepository;

@Service
public class TrainingCategoryMasterServiceimpl implements TrainingCategoryMasterService {
	
	@Autowired
	TrainingCategoryMasterRepository TrainingCategoryMasterRepo;

	@Override
	public List<TrainingCategoryMaster> getAllcategory() {
		// TODO Auto-generated method stub
		return TrainingCategoryMasterRepo.findAll();
	}

}
