package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.ViewMyTrainings;


public interface ViewMyTrainingsRepository extends JpaRepository<ViewMyTrainings,Integer> {
	
	
	@Query("SELECT sv FROM ViewMyTrainings sv WHERE sv.treasuryid = :treasuryid")
	List<ViewMyTrainings> findByTreasuryId(@Param("treasuryid") String treasuryid);
	
	
	 @Query("SELECT  mt.treasuryid,tm.tname, vm.vname, tm.tmode, tm.tdescription, tm.training_start_dt, tm.training_end_dt, vm.vaddress, vm.vcontactno, vm.vcontactmailid, vm.maplocation " +
	            "FROM AppliedTrainingsFromTrainee mt " +
	            "JOIN ScheduleTrainings tm ON mt.ref_planner_id = tm.ref_planner_id " +
	            "JOIN SearchVenue vm ON mt.venueid = vm.vid " +
	            "WHERE mt.treasuryid = :treasuryid")
	    List<Object[]> findTrainingDetailsByTreasuryId(@Param("treasuryid") String treasuryid);
	    
	    @Query(value = "SELECT mt.tname, mt.tmode, mt.treasuryid, mt.tdescription,mt.vaddress,tm.mobilenumberteacher,tm.designation,tm.dob,tm.username, tm.surname,tm.schcd,tm.districtnamewrk " +
	    		"FROM mytrainings mt " +
	            "JOIN ttreasurymaster tm ON mt.treasuryid = tm.treasuryid " +
	            "WHERE mt.status = 'waiting for approval'", nativeQuery = true)
	    List<Object[]> findCustomData();

	
}
