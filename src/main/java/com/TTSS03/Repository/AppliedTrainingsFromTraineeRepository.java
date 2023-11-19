package com.TTSS03.Repository;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.AppliedTrainingsFromTrainee;

public interface AppliedTrainingsFromTraineeRepository extends JpaRepository<AppliedTrainingsFromTrainee, Integer> {
	
	 @Query("SELECT a FROM AppliedTrainingsFromTrainee a WHERE a.treasuryid = :treasuryid")
	    List<AppliedTrainingsFromTrainee> findByTreasuryId(@Param("treasuryid") String treasuryid);
}
