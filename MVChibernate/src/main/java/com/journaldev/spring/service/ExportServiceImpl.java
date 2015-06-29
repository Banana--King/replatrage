package com.journaldev.spring.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.journaldev.spring.dao.EtatDAO;
import com.journaldev.spring.dao.ExportDAO;

@Service("exportService")
public class ExportServiceImpl implements ExportService {

	private ExportDAO exportDAO;

	@Autowired
	public void setExportDAO(ExportDAO exportDAO) {
		this.exportDAO = exportDAO;
	}
	
	
	@Override
	@Transactional
	public boolean exportMission(String adresse) throws IOException {
		return this.exportDAO.exportMission(adresse);
	}

}
