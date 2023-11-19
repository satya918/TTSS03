package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
    public ResponseEntity<String> processData(@RequestParam String treasuryId) {
		viewMyTrainingsService.getdata(treasuryId);
        return new ResponseEntity<>("Data processed successfully", HttpStatus.OK);
    }
	
	@GetMapping("/mytrainings")
	public ResponseEntity<List<ViewMyTrainings>> allMyTrainings(@RequestParam String treasuryId){
		List<ViewMyTrainings> mytrainings = viewMyTrainingsService.findByTreasuryId(treasuryId);
		return ResponseEntity.ok(mytrainings);
	}

}
