package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.SearchVenue;

public interface SearchVenueService {
	
	List<SearchVenue>findByVenueid(int vid);

}
