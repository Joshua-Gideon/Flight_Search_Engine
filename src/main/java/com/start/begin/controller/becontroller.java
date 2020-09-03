package com.start.begin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.start.begin.dao.FlightsDao;
import com.start.begin.model.Flights;
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

//@Component
//class FlightsComponent implements CommandLineRunner{
//
//	@Autowired
//	private FlightsDao dao;
//	
//	@Override
//	public void run(String... args) throws Exception {
//		for(Flight f: this.dao.findAll())
//			System.out.println(f.toString());
//	}
//	
//}
