package com.TTSS03.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.AppliedTrainingsFromTrainee;
import com.TTSS03.Service.AppliedTrainingsFromTraineeService;

@RestController
@RequestMapping("/api")
public class AppliedTrainingsFromTraineeController {
	
	@Autowired
	AppliedTrainingsFromTraineeService appliedTrainingsFromTraineeService;
	
	
	@PostMapping("/savetrainings")
	public ResponseEntity<AppliedTrainingsFromTrainee> saveOneTraining(@RequestBody AppliedTrainingsFromTrainee appliedTrainingsFromTrainee){
		AppliedTrainingsFromTrainee saveEmployeeTrainings = appliedTrainingsFromTraineeService.saveEmployeeTrainings(appliedTrainingsFromTrainee);
		
		return ResponseEntity.ok(saveEmployeeTrainings);
	}
	
	
	@PutMapping("/updateCols")
    public ResponseEntity<String> updateCols(@RequestParam String treasuryid) {
        try {
        	appliedTrainingsFromTraineeService.updateColsByMaxSlno(treasuryid);
            return new ResponseEntity<>("Columns updated successfully", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Error updating columns: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
