package com.journaldev.spring.dao;

import java.util.List;

import com.journaldev.spring.model.Mission;
 
public interface MissionDAO {
 
    public void addMission(Mission m);
    public void updateMission(Mission m);
    public List<Mission> listMissions();
    public Mission getMissionById(int id);
    public void removeMission(int id);
}