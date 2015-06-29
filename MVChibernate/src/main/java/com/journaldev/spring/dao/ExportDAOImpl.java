package com.journaldev.spring.dao;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.journaldev.spring.model.Mission;

@Repository("exportDAO")
public class ExportDAOImpl implements ExportDAO {

	private static final Logger logger = LoggerFactory.getLogger(EtatDAOImpl.class);
	 
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
    
	@SuppressWarnings("unchecked")
	@Override
	public boolean exportMission(String adresse) throws IOException {
		try {
			// récupère toutes les infos liées a cette mission
			Session session = this.sessionFactory.getCurrentSession();
	        List<Mission> MissionsList = session.createQuery("from Mission where adresse=:adresse").setParameter("adresse", adresse).list();
	        
			// génère le nom du fichier
			SimpleDateFormat sdfDate = new SimpleDateFormat("yyyyMMdd_HHmmss");
		    Date now = new Date();
		    String strDate = sdfDate.format(now);
		    String fileName = "export_"+ strDate +".csv";
			String filePath = "C:\\exports\\"+ fileName;
		    
			// créé le fichier texte
			File file = new File(filePath);
			file.getParentFile().mkdirs();
			file.createNewFile();
			System.out.println("EXPORT : fichier créé");
			
			// remplis le fichier, la base du fichier
			PrintWriter writer = new PrintWriter(filePath, "UTF-8");
			writer.println("********** RAPPORT DE MISSION **********");
			writer.println("adresse : "+ adresse);
			writer.println("");
			writer.println("ID;Titre;Description;Etat;Intervenant;Date");
			
			// remplis le fichier, le contenu des archives
			String user;
			for(Mission m : MissionsList){
				if(m.getUser() == null){user = "AUCUN";}
				else{user = m.getUser().getUsername();}
				String str = m.getId() +";"
						+ m.getTitre() +";"
						+ m.getDescription() +";"
						+ m.getEtat() +";"
						+ user +";"	
						+ m.getDateLastAction();
				writer.println(str);
	        }
			System.out.println("EXPORT : écriture dans le fichier");
			
			// ferme le fichier texte
			writer.close();
			System.out.println("EXPORT : fichier fermé");
			return true;
		}
		catch (Exception e) {return false;}
	}

}
