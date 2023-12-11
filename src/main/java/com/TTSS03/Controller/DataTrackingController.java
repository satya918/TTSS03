/**
 * 
 */
package com.TTSS03.Controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.TTSS03.Entity.DataTracking;
import com.TTSS03.Service.DataTrackingService;

/**
 * 
 */
@RestController
@RequestMapping("/api")
public class DataTrackingController {
	
	@Autowired
	DataTrackingService dataTrackingService;
	
	
	@PostMapping("/datatracking")
	public ResponseEntity<DataTracking> saveOneRecord(@ModelAttribute DataTracking dataTracking,
	                                                  @RequestParam("signedAttendanceSheetImage") MultipartFile signedAttendanceSheetImage,
	                                                  @RequestParam("complexClassroomImage") MultipartFile complexClassroomImage) {
	    // Save the DataTracking object
	    DataTracking savedDataTracking = dataTrackingService.saveOne(dataTracking);

	    // Process and save the signed attendance sheet image if provided
	    if (signedAttendanceSheetImage != null && !signedAttendanceSheetImage.isEmpty()) {
	        String fileName = "signed_" + System.currentTimeMillis() + ".jpg";
	        Path imagePath = Paths.get("/D/datracking/" + fileName);

	        try {
	            Files.copy(signedAttendanceSheetImage.getInputStream(), imagePath, StandardCopyOption.REPLACE_EXISTING);

	            // Assuming you have a property in your DataTracking class to store the image path
	            savedDataTracking.setSignedattendancesheetimg(imagePath.toString());
	        } catch (IOException e) {
	            // Handle the exception appropriately
	            e.printStackTrace();
	        }
	    }

	    // Process and save the complex classroom image if provided
	    if (complexClassroomImage != null && !complexClassroomImage.isEmpty()) {
	        String fileName = "complex_" + System.currentTimeMillis() + ".jpg";
	        Path imagePath = Paths.get("/D/datracking/"  + fileName);

	        try {
	            Files.copy(complexClassroomImage.getInputStream(), imagePath, StandardCopyOption.REPLACE_EXISTING);

	            // Assuming you have a property in your DataTracking class to store the image path
	            savedDataTracking.setComplexclassroomimg(imagePath.toString());
	        } catch (IOException e) {
	            // Handle the exception appropriately
	            e.printStackTrace();
	        }
	    }

	    return ResponseEntity.ok(savedDataTracking);
	}

}
