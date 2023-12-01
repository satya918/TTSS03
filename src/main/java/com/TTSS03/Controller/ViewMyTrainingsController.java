package com.TTSS03.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.ViewMyTrainings;
import com.TTSS03.Service.ViewMyTrainingsService;

@RestController
@RequestMapping("/api")
public class ViewMyTrainingsController {
	
	@Autowired
	ViewMyTrainingsService viewMyTrainingsService;
	
	
	@PostMapping("/processData")
    public ResponseEntity<List<ViewMyTrainings>> processData(@RequestParam String treasuryId) {
		
		List<ViewMyTrainings> savemyTrainings = viewMyTrainingsService.savemyTrainings(treasuryId);
		
        return ResponseEntity.ok(savemyTrainings);
    }
	
	@GetMapping("/mytrainings")
	public ResponseEntity<List<ViewMyTrainings>> allMyTrainings(@RequestParam String treasuryId){
		List<ViewMyTrainings> mytrainings = viewMyTrainingsService.findByTreasuryId(treasuryId);
		return ResponseEntity.ok(mytrainings);
	}
	
	@GetMapping("/waiting-for-approval")
	 public ResponseEntity<List<Map<String, Object>>> getCustomData() {
	        List<Map<String, Object>> customData = viewMyTrainingsService.getCustomData();
	        return ResponseEntity.ok(customData);
	    }
	
	@GetMapping("/approved")
	public ResponseEntity<List<Map<String, Object>>> getApprovedDataList() {
		List<Map<String, Object>> approvedData = viewMyTrainingsService.getAppovedData();
		return ResponseEntity.ok(approvedData);
	}
	
	@PutMapping("/update-status")
    public ResponseEntity<String> updateStatusToApproved(@RequestParam String treasuryId,@RequestParam String trainingName) {
	 viewMyTrainingsService.updateStatusToApproved(treasuryId,trainingName);
        return new ResponseEntity<>("Status updated to 'approved' for treasuryId: " + treasuryId+','+trainingName, HttpStatus.OK);
    }
	@PutMapping("/reject-status")
	 public ResponseEntity<String> rejectStatusToApproved(@RequestParam String treasuryId,@RequestParam String trainingName) {
		 viewMyTrainingsService.rejectStatusToApproved(treasuryId,trainingName);
		 return new ResponseEntity<>("Status updated to 'reject' for treasuryId: " + treasuryId+','+trainingName, HttpStatus.OK);
	 }


}
