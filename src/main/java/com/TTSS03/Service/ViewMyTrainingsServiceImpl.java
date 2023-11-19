package com.TTSS03.Service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.AppliedTrainingsFromTrainee;
import com.TTSS03.Entity.ScheduleTrainings;
import com.TTSS03.Entity.SearchVenue;
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
    public void getdata(String treasuryid) {
        // Step 2: Use treasuryId to get referenceId from tmapping table
        List<AppliedTrainingsFromTrainee> appliedTrainingsList = appliedTrainingsFromTraineeRepo.findByTreasuryId(treasuryid);

        for (AppliedTrainingsFromTrainee tMapping : appliedTrainingsList) {
            String ref_planner_id = tMapping.getRef_planner_id();

            // Step 3: Use referenceId to retrieve data from table1
            List<ScheduleTrainings> scheduleTrainingsList = ScheduleTrainingsRepo.findByRefId(ref_planner_id);

            for (ScheduleTrainings table1 : scheduleTrainingsList) {
                String venue_id = table1.getVenue_id();

                // Step 4: Use venueId to retrieve data from venueMaster
                List<SearchVenue> searchVenueList = SearchVenueRepo.findByVId1(venue_id);

                for (SearchVenue venueMaster : searchVenueList) {
                    // Step 5: Combine data and make a POST request to another table
                    ViewMyTrainings mytraining = new ViewMyTrainings();

                    // Set data from table1, venueMaster, or any other sources
                    mytraining.setTreasuryid(treasuryid);

                    mytraining.setTname(table1.getTname());
                    mytraining.setDescription(table1.getTdescription());
                    mytraining.setStartdate(table1.getTraining_start_dt());
                    mytraining.setEnddate(table1.getTraining_end_dt());
                    mytraining.setAgency(table1.getTagency());
                    mytraining.setTrainername(table1.getCoordinatorname());
                    mytraining.setTmode(table1.getTmode());
                    mytraining.setVname(venueMaster.getVname());
                    mytraining.setVaddress(venueMaster.getVaddress());
                    mytraining.setVcontact(venueMaster.getVcontact_no() + " " + venueMaster.getVcontactmailid());
                    // Set other fields

                    // Step 6: Save data to another table
                    ViewMyTrainingsRepo.save(mytraining);
                }
            }
        }
    }

	@Override
	public List<ViewMyTrainings> findByTreasuryId(String treasuryid) {
		return ViewMyTrainingsRepo.findByTreasuryId(treasuryid)	;	 
	}
}


