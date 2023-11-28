 package com.TTSS03.Service;


import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.ViewMyTrainings;
import com.TTSS03.Repository.AppliedTrainingsFromTraineeRepository;
import com.TTSS03.Repository.ScheduleTrainingsRepository;
import com.TTSS03.Repository.SearchVenueRepository;
import com.TTSS03.Repository.ViewMyTrainingsRepository;

@Service
public class ViewMyTrainingsServiceImpl implements ViewMyTrainingsService {

    @Autowired
    ViewMyTrainingsRepository ViewMyTrainingsRepo;

    @Autowired
    AppliedTrainingsFromTraineeRepository appliedTrainingsFromTraineeRepo;

    @Autowired
    ScheduleTrainingsRepository ScheduleTrainingsRepo;

    @Autowired
    SearchVenueRepository SearchVenueRepo;

    
	@Override
	public List<ViewMyTrainings> findByTreasuryId(String treasuryid) {
	   

	    return ViewMyTrainingsRepo.findByTreasuryId(treasuryid);
	}
	@Override
	public List<ViewMyTrainings> savemyTrainings(String treasuryid) {
	    List<Object[]> findTrainingDetailsByTreasuryId = ViewMyTrainingsRepo.findTrainingDetailsByTreasuryId(treasuryid);

	 // Process and save the results to your target table (ViewMyTrainings)
	    Set<ViewMyTrainings> uniqueTrainings = new HashSet<>();

	    for (Object[] result : findTrainingDetailsByTreasuryId) {
	        // Print the values at each index of the result array
	        for (int i = 0; i < result.length; i++) {
	            System.out.println("Index " + i + ": " + result[i]);
	        }

	        ViewMyTrainings viewMyTrainings = createViewMyTrainingsFromResultArray(result);

	        uniqueTrainings.add(viewMyTrainings);
	    }

	    return ViewMyTrainingsRepo.saveAll(uniqueTrainings);
	}

	private ViewMyTrainings createViewMyTrainingsFromResultArray(Object[] result) {
	    ViewMyTrainings viewMyTrainings = new ViewMyTrainings();
	    
	    viewMyTrainings.setTreasuryid(result[0].toString()); 
	    viewMyTrainings.setTname(result[1].toString());
	    viewMyTrainings.setVname(result[2].toString());
	    viewMyTrainings.setTmode(result[3].toString());
	    viewMyTrainings.setTdescription(result[4].toString());
	    viewMyTrainings.setStartdate(result[5].toString());
	    viewMyTrainings.setEnddate(result[6].toString());
	    viewMyTrainings.setVaddress(result[7].toString());
	    viewMyTrainings.setMaplocation(result[10].toString());
	    viewMyTrainings.setVcontact(result[8].toString()+" "+result[9].toString());

	    return viewMyTrainings;
	}
	
	public List<Map<String, Object>> getCustomData() {
		List<Object[]> result = ViewMyTrainingsRepo.findCustomData();
 
		return result.stream().map(row -> {
			Map<String, Object> rowData = new HashMap<>();
			rowData.put("TrainingName", row[0]);
			rowData.put("TrainingMode", row[1]);
			rowData.put("TreasuryId", row[2]);
			rowData.put("Description", row[3]);
			rowData.put("vaddress", row[4]);
			rowData.put("MobileNumber", row[5]);
			rowData.put("Designation", row[6]);
			rowData.put("DOB", row[7]);
			rowData.put("FullName", row[8] + " " + row[9]);
			rowData.put("SchoolUdiseCode", row[10]);
			rowData.put("District", row[11]);
			return rowData;
		}).collect(Collectors.toList());
	}
	
}


	


	






	
	

	



