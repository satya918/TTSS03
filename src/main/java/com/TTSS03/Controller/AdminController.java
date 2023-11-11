package com.TTSS03.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	

	@RequestMapping("/admin")
	public String traineeSide() {
		return "AdminMenu";
	}
	
	
	@RequestMapping("/schedule")
	public String scheduleTraining() {
		return "Schedule1";
	}
	
	@RequestMapping("/view")
	public String viewscheduleTrainings() {
		return "ViewSchedule";
	}
	

	@RequestMapping("/academic")
	public String viewsCalender() {
		return "AcademicCalender";
	}

}
