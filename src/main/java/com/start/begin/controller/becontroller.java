package com.start.begin.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import com.start.begin.dao.FlightsDao;
import com.start.begin.dao.ManifestDao;
import com.start.begin.model.Flights;
import com.start.begin.model.Manifest;
@Controller
public class becontroller {
	@GetMapping("/")
 public String sayhello() {
		for (Flights f: dao.findAll())
		System.out.println(f.getId().toString());
	 return "index";
 }
	@Autowired
	private FlightsDao dao;
	
	@GetMapping(value="/flights",produces = MediaType.TEXT_PLAIN_VALUE)
	public String getFlights(ModelMap model) {
		List<Flights> result = new ArrayList<Flights>();
		dao.findAll().forEach(result::add);;
		model.addAttribute("flights",result);
		
		return  "flights";
	}
	
//@RequestMapping("/error")
//public String error() {
//	return "error.jsp";
//}
}

@Component
class FlightsComponent implements CommandLineRunner{

	@Autowired
	private FlightsDao flightsDao;
	@Autowired
	private ManifestDao manifestDao ;
	
	@Override
	public void run(String... args) throws Exception {
		readManifest();
		readFlights();
		
	}
	

	private void readFlights() throws Exception {
		FileReader file = null ;
		try{
			file = new FileReader(Resource.class.getResource("flights.csv").getPath());
		}catch (Exception e) {
			System.out.println("flights.csv not found/empty: " + e.getMessage());	}
		if(file!=null) {
			BufferedReader reader = new BufferedReader(file);
			String line ="";
			while((line = reader.readLine()) !=null) {
				String[] data = line.split(",");
				
				Flights flightEntry
				= new Flights(
						data[0],
						data[1],
						data[2],
						data[3]
						);
				flightEntry = flightsDao.save(flightEntry);
			}
		}
		else {
		System.out.println("flights.csv not found/empty");
		}
	}
	
	private void readManifest() throws Exception {
		FileReader file = null ;
		try{
			file = new FileReader(getClass().getResource("manifest.csv").getPath());
		}catch (Exception e) {

			System.out.println("manifest.csv not found/empty: " + e.getMessage());	}
		if(file!=null) {
			BufferedReader reader = new BufferedReader(file);
			String line ="";
			while((line = reader.readLine()) !=null) {
				String[] data = line.split(",");
				
				System.out.println(Integer.parseInt(data[0]));
				Manifest manifestEntry
				= new Manifest(
						data[0],
						data[1],
						data[2],
						data[3],
						data[4],
						data[5],
						data[6]
						);
				manifestEntry = manifestDao.save(manifestEntry);
			}
		}
		else {
		System.out.println("manifest.csv not found/empty");
		}
	}
	
}
