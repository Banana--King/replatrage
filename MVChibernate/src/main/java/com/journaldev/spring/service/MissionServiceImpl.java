package com.journaldev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.MissionDAO;
import com.journaldev.spring.model.Mission;

@Service("missionService")
public class MissionServiceImpl implements MissionService {
	
	private MissionDAO missionDAO;

	@Autowired
	public void setMissionDAO(MissionDAO missionDAO) {
		this.missionDAO = missionDAO;
	}

	@Override
	@Transactional
	public void addMission(Mission m) {
		this.missionDAO.addMission(m);
	}

	@Override
	@Transactional
	public void updateMission(Mission m) {
		this.missionDAO.updateMission(m);
	}

	@Override
	@Transactional
	public List<Mission> listMissions() {
		return this.missionDAO.listMissions();
	}

	@Override
	@Transactional
	public Mission getMissionById(int id) {
		return this.missionDAO.getMissionById(id);
	}

	@Override
	@Transactional
	public void removeMission(int id) {
		this.missionDAO.removeMission(id);
	}

}
