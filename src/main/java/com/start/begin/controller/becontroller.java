package com.start.begin.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
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
import com.start.begin.dao.UserRepo;
import com.start.begin.model.Flights;
import com.start.begin.model.Manifest;
import com.start.begin.model.User;

@Controller
public class becontroller {
	Boolean logedin = false, ascending = true;
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
		ArrayList<Flights> flightList = new ArrayList<>();
		flightList.clear();
		List<Manifest> manifestList = manifestDao.findFilghtsWithOriginAndDest(origin, destination);

		for (int i = 0; i < manifestList.size(); i++) {
			System.out.println(manifestList.get(i));
			Flights flight = (Flights) dao.findById(manifestList.get(i).getFlight_no()).get();
			System.out.println(flight);
			if (flight == null)
				flightList.add(new Flights());
			else
				flightList.add(i, flight);
		}

		ascending = true;

		Collections.sort(manifestList, durationAcd);

//		request.getAttribute("sort_price");
		model.addAttribute("sort_duration","true");
		model.addAttribute("stops", null);
		model.addAttribute("min", null);
		model.addAttribute("max", null);
		model.addAttribute("manifest", manifestList);
		model.addAttribute("origin", origin);
		model.addAttribute("destination", destination);
		model.addAttribute("flightsList", flightList);

		return "searchResult";
	}

	public static Comparator<Manifest> durationAcd = new Comparator<Manifest>() {

		public int compare(Manifest s1, Manifest s2) {

			int a = s1.getId();
			int b = s2.getId();

			return b - a;

		}
	};
	public static Comparator<Manifest> durationDesc = new Comparator<Manifest>() {

		public int compare(Manifest s1, Manifest s2) {

			int a = s1.getId();
			int b = s2.getId();

			return a - b;

		}
	};

	@RequestMapping(value = "/filters", method = RequestMethod.GET)
	public String addFilters(ModelMap model, @RequestParam("stops") String stops,
			@RequestParam("min_price") String min_price, @RequestParam("max_price") String max_price) {

		ArrayList<Flights> flightList = new ArrayList<>();
		flightList.clear();
		List<Manifest> manifestList = null;
		System.out.println(stops);
		if (stops.compareTo("null") == 0) {
			System.out.println(stops);
			manifestList = manifestDao.findFilghts(search_origin, search_destination, Integer.parseInt(min_price),
					Integer.parseInt(max_price));
		} else {
			manifestList = manifestDao.findFilghtsWithStops(search_origin, search_destination, stops, min_price,
					max_price);
		}
		for (int i = 0; i < manifestList.size(); i++) {
			System.out.println(manifestList.get(i));
			Flights flight = (Flights) dao.findById(manifestList.get(i).getFlight_no()).get();
			System.out.println(flight);
			if (flight == null)
				flightList.add(new Flights());
			else
				flightList.add(i, flight);
		}

		Collections.sort(manifestList, durationDesc);

		model.addAttribute("stops", stops);
		model.addAttribute("min", min_price);
		model.addAttribute("max", max_price);
		model.addAttribute("manifest", manifestList);
		model.addAttribute("flightsList", flightList);
		model.addAttribute("origin", search_origin);
		model.addAttribute("destination", search_destination);
		return "searchResult";
	}

	@RequestMapping(value = "/clear", method = RequestMethod.GET)
	public String clearFilters(ModelMap model) {

		ArrayList<Flights> flightList = new ArrayList<>();
		flightList.clear();
		List<Manifest> manifestList = null;
		manifestList = manifestDao.findFilghtsWithOriginAndDest(search_origin, search_destination);

		for (int i = 0; i < manifestList.size(); i++) {
			System.out.println(manifestList.get(i));
			Flights flight = (Flights) dao.findById(manifestList.get(i).getFlight_no()).get();
			System.out.println(flight);
			if (flight == null)
				flightList.add(new Flights());
			else
				flightList.add(i, flight);
		}

		model.addAttribute("stops", null);
		model.addAttribute("min", null);
		model.addAttribute("max", null);
		model.addAttribute("manifest", manifestList);
		model.addAttribute("flightsList", flightList);
		model.addAttribute("origin", search_origin);
		model.addAttribute("destination", search_destination);
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
						data[7],data[8]);
				manifestEntry = manifestDao.save(manifestEntry);
			}
		} else {
			System.out.println("manifest.csv not found/empty");
		}
	}

}
