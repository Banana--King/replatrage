package com.journaldev.spring.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public interface ExportService
{
	public boolean exportMission(String adresse) throws FileNotFoundException, UnsupportedEncodingException, IOException;
}
