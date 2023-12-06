package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.ViewMyTrainings;

public interface ViewMyTrainingsRepository extends JpaRepository<ViewMyTrainings, Integer> {

	@Query("SELECT sv FROM ViewMyTrainings sv WHERE sv.treasuryid = :treasuryid")
	List<ViewMyTrainings> findByTreasuryId(@Param("treasuryid") String treasuryid);

	@Query("SELECT  mt.treasuryid,tm.tname, vm.vname, tm.tmode, tm.tdescription, tm.training_start_dt, tm.training_end_dt, vm.vaddress, vm.vcontactno, vm.vcontactmailid, vm.maplocation,tm.resourcetype "
			+ "FROM AppliedTrainingsFromTrainee mt "
			+ "JOIN ScheduleTrainings tm ON mt.ref_planner_id = tm.ref_planner_id "
			+ "JOIN SearchVenue vm ON mt.venueid = vm.vid " + "WHERE mt.treasuryid = :treasuryid and mt.ref_planner_id = tm.ref_planner_id and mt.venueid = vm.vid")
	List<Object[]> findTrainingDetailsByTreasuryId(@Param("treasuryid") String treasuryid );

	@Query(value = "SELECT mt.tname, mt.tmode, mt.treasuryid, mt.tdescription,mt.vaddress,tm.mobilenumberteacher,tm.designation,tm.dob,tm.username, tm.surname,tm.schcd,tm.districtnamewrk,mt.applydateandtime,mt.resourcetype "
			+ "FROM mytrainings mt " + "JOIN ttreasurymaster tm ON mt.treasuryid = tm.treasuryid "
			+ "WHERE mt.status = 'waiting for approval'", nativeQuery = true)
	List<Object[]> findCustomData();

	@Query(value = "SELECT mt.tname, mt.tmode, mt.treasuryid, mt.tdescription,mt.vaddress,tm.mobilenumberteacher,tm.designation,tm.dob,tm.username, tm.surname,tm.schcd,tm.districtnamewrk ,mt.applydateandtime,mt.resourcetype "
			+ "FROM mytrainings mt " + "JOIN ttreasurymaster tm ON mt.treasuryid = tm.treasuryid "
			+ "WHERE mt.status = 'approved'", nativeQuery = true)
	List<Object[]> findApprovedData();

	@Modifying
	@Query("UPDATE ViewMyTrainings v SET v.status = 'approved' WHERE v.treasuryid = :treasuryId  AND v.tname = :trainingName")
	void updateStatusByTreasuryId(@Param("treasuryId") String treasuryId, @Param("trainingName") String trainingName);

	@Query("SELECT a FROM ViewMyTrainings a WHERE a.treasuryid = :treasuryid AND a.tname = :tname")
	List<ViewMyTrainings> findByTreasuryIdAndTname(@Param("treasuryid") String treasuryid,
			@Param("tname") String tname);

	@Modifying
	@Query("UPDATE ViewMyTrainings v SET v.status = 'rejected' WHERE v.treasuryid = :treasuryId  AND v.tname = :trainingName")
	void rejectStatusByTreasuryId(@Param("treasuryId") String treasuryId, @Param("trainingName") String trainingName);

}
