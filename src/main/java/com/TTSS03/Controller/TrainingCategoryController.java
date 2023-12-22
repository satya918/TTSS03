package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.TrainingCategoryMaster;
import com.TTSS03.Service.TrainingCategoryMasterService;

@RestController
@RequestMapping("/api")
public class TrainingCategoryController {
	
	@Autowired
	TrainingCategoryMasterService trainingCategoryMasterService;
	
	
	@GetMapping("/category")
	public ResponseEntity<List<TrainingCategoryMaster>>findAllCategory(){
		List<TrainingCategoryMaster> allcategory = trainingCategoryMasterService.getAllcategory();
		return ResponseEntity.ok(allcategory);
	}

}
