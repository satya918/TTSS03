package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.SpellMaster;
import com.TTSS03.Service.SpellMasterService;

@RestController
@RequestMapping("/api")
public class SpellMasterController {
	
	@Autowired
	SpellMasterService spellMasterService;
	
	@GetMapping("/spell")
	public ResponseEntity<List<SpellMaster>>findAllSpell(){
		
		List<SpellMaster> allSpell = spellMasterService.getAllSpell();
		
		return ResponseEntity.ok(allSpell);
		
	}

}
