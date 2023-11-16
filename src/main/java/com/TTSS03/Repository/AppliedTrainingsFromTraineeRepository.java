package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.AppliedTrainingsFromTrainee;

public interface AppliedTrainingsFromTraineeRepository extends JpaRepository<AppliedTrainingsFromTrainee, Integer> {
	
	
    List<AppliedTrainingsFromTrainee> findAllByOrderBySlnoDesc();
    
    
    @Modifying
    @Query("UPDATE AppliedTrainingsFromTrainee a SET a.treasuryid = :treasuryid WHERE a.slno = (SELECT MAX(b.slno) FROM AppliedTrainingsFromTrainee b)")
    void updateColsByMaxSlno(@Param("treasuryid") String treasuryid);
}
