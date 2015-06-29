package com.journaldev.spring.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public interface ExportDAO
{
	public boolean exportMission(String adresse) throws FileNotFoundException, UnsupportedEncodingException, IOException;
}
