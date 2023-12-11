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
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.TTSS03.Entity.ComplexMonitoring;
import com.TTSS03.Service.ComplexMonitoringService;

/**
 * 
 */

@RestController
@RequestMapping("/api")
public class ComplexMonitoringController {
	
	@Autowired
	ComplexMonitoringService complexMonitoringService;
	
	 @PostMapping("/complexmonitoring")
	    public ResponseEntity<ComplexMonitoring> saveOneRecord(@ModelAttribute ComplexMonitoring complexMonitoring,
	                                                           @RequestParam("imageFile") MultipartFile imageFile) throws IOException {
	        // Save the ComplexMonitoring object
	        ComplexMonitoring savedComplexMonitoring = complexMonitoringService.saveOne(complexMonitoring);

	        // Save the image file to the file system
	        if (imageFile != null && !imageFile.isEmpty()) {
	            String fileName = "your.jpg"; // You can generate a unique name or use some ID from savedComplexMonitoring
	            Path imagePath = Paths.get("/D/testImage" + fileName);

	            Files.copy(imageFile.getInputStream(), imagePath, StandardCopyOption.REPLACE_EXISTING);

	            // Assuming you have a property in your ComplexMonitoring class to store the image path
	            savedComplexMonitoring.setUploadimage(imagePath.toString());
	        }

	        return ResponseEntity.ok(savedComplexMonitoring);
	    }

	    @GetMapping("/complexmonitoring/image/{fileName}")
	    public ResponseEntity<ByteArrayResource> getImage(@PathVariable String fileName) throws IOException {
	        Path imagePath = Paths.get("path/to/your/image/directory/" + fileName);

	        byte[] imageBytes = Files.readAllBytes(imagePath);
	        ByteArrayResource resource = new ByteArrayResource(imageBytes);

	        return ResponseEntity.ok()
	                .header(HttpHeaders.CONTENT_TYPE, MediaType.IMAGE_JPEG_VALUE)
	                .body(resource);
	    }
	
	

}
