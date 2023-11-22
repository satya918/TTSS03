package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.ViewMyTrainings;

public interface ViewMyTrainingsRepository extends JpaRepository<ViewMyTrainings, Integer> {
	
	
	@Query("SELECT sv FROM ViewMyTrainings sv WHERE sv.treasuryid = :treasuryid")
	List<ViewMyTrainings> findByTreasuryId(@Param("treasuryid") String treasuryid);

	@Query("SELECT COUNT(v) > 0 FROM ViewMyTrainings v " +
	           "WHERE v.treasuryid = :treasuryid " +
	           "AND v.tname = :tname " +
	           "AND v.startdate = :startdate")
	    boolean existsByTreasuryidAndTnameAndStartDate(
	        @Param("treasuryid") String treasuryid,
	        @Param("tname") String tname,
	        @Param("startdate") String startdate
	    );
}
