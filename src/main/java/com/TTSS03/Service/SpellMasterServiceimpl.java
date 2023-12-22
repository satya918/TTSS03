package com.TTSS03.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.SpellMaster;
import com.TTSS03.Repository.SpellMasterRepository;

@Service
public class SpellMasterServiceimpl implements SpellMasterService {
	
	@Autowired
	SpellMasterRepository SpellMasterRepo;

	@Override
	public List<SpellMaster> getAllSpell() {
		// TODO Auto-generated method stub
		return SpellMasterRepo.findAll();
	}
	

}
