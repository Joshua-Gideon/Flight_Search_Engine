package com.start.begin.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.start.begin.dao.FlightsDao;
import com.start.begin.dao.ManifestDao;
import com.start.begin.model.Flights;
import com.start.begin.model.Manifest;
import com.start.begin.model.User;
import com.start.begin.model.UserRepo;

@Controller
public class becontroller {
	Boolean logedin = false;
	@Autowired
	UserRepo userRepo;

	@RequestMapping("/login")
	public String PrefPage(@RequestParam("userName") String userName, @RequestParam("password") String password,
			Model model) {
		User u = null;
		try {
			u = userRepo.findByName(userName);
		} catch (Exception e) {
			System.out.println("User not found");
			return "index";
		}
		if (u != null) {
			logedin = true;
			model.addAttribute("UserName", u);
			return "index";
		}
		return "index";
	}

	@GetMapping("/")
	public String sayhello() {
		for (Flights f : dao.findAll())
			System.out.println(f.getId().toString());
		return "index";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/logout")
	public String logout() {
		logedin = false;
		return "index";
	}

	@Autowired
	private FlightsDao dao;
	@Autowired
	private ManifestDao manifestDao;

	String search_origin, search_destination;

	@RequestMapping(value = "/flights", method = RequestMethod.GET)
	public String getFlights(ModelMap model, @RequestParam("origin") String origin,
			@RequestParam("destination") String destination) {

		search_origin = origin;
		search_destination = destination;

		List<Manifest> result = manifestDao.findFilghtsWithOriginAndDest(origin, destination);
		for (int i = 0; i < result.size(); i++) {
			System.out.println(result.get(i));
		}
		model.addAttribute("flights", result);

		return "searchResult";
	}

	@RequestMapping(value = "/filters", method = RequestMethod.GET)
	public String addFilters(ModelMap model, @RequestParam("stops") String stops, 
			@RequestParam("min_price") String min_price,
			@RequestParam("max_price") String max_price) {
		
		System.out.println(min_price+' ' +max_price);
		List<Manifest> result = null;
		if (stops == "null") {
			result = manifestDao.findFilghts(search_origin, search_destination,Integer.parseInt(min_price),Integer.parseInt(max_price));
		} else {
			result = manifestDao.findFilghtsWithStops(search_origin, search_destination, stops,min_price,max_price);
		}

		model.addAttribute("flights", result);
		return "searchResult";
	}
}

@Component
class FlightsComponent implements CommandLineRunner {

	@Autowired
	private FlightsDao flightsDao;
	@Autowired
	private ManifestDao manifestDao;

	@Override
	public void run(String... args) throws Exception {
		readManifest();
		readFlights();

	}

	private void readFlights() throws Exception {
		FileReader file = null;
		try {
			file = new FileReader(ResourceUtils.getFile("classpath:flightList.csv").getPath());
		} catch (Exception e) {
			System.out.println("flightList.csv not found/empty: " + e.getMessage());
		}
		if (file != null) {
			BufferedReader reader = new BufferedReader(file);
			String line = "";
			while ((line = reader.readLine()) != null) {
				String[] data = line.split(",");

				Flights flightEntry = new Flights(data[0], data[1], data[2], data[3]);
				flightEntry = flightsDao.save(flightEntry);
			}
		} else {
			System.out.println("flightList.csv not found/empty");
		}
	}

	private void readManifest() throws Exception {
		FileReader file = null;
		try {
			file = new FileReader(ResourceUtils.getFile("classpath:manifest.csv").getPath());
		} catch (Exception e) {

			System.out.println("manifest.csv not found/empty: " + e.getMessage());
		}
		if (file != null) {
			BufferedReader reader = new BufferedReader(file);
			String line = "";
			while ((line = reader.readLine()) != null) {
				String[] data = line.split(",");

				System.out.println(Integer.parseInt(data[0]));
				Manifest manifestEntry = new Manifest(data[0], data[1], data[2], data[3], data[4], data[5], data[6],
						data[7]);
				manifestEntry = manifestDao.save(manifestEntry);
			}
		} else {
			System.out.println("manifest.csv not found/empty");
		}
	}

}
