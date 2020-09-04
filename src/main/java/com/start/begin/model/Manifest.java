package com.start.begin.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.sun.istack.NotNull;

@Entity
public class Manifest {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@NotNull
	@Column(name = "id")
	int id;
	@Column(name = "flight_no")
	@NotNull
	String flight_no;
	@Column(name = "origin")
	@NotNull
	String origin;
	@Column(name = "destination")
	@NotNull
	String destination;
	@Column(name = "stops")
	@NotNull
	int stops;
	@Column(name = "departure")
	@NotNull
	String departure;
	@Column(name = "arrival")
	@NotNull
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="HH:mm:ss")
	String arrival;
	
	//getters $ setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFlight_no() {
		return flight_no;
	}
	public void setFlight_no(String flight_no) {
		this.flight_no = flight_no;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public int getStops() {
		return stops;
	}
	public void setStops(int stops) {
		this.stops = stops;
	}
	public String getDeparture() {
		return departure;
	}
	public void setDeparture(String departure) {
		
		this.departure = departure;
	}
	public String getArrival() {
		return arrival;
	}
	public void setArrival(String arrival) {
		this.arrival = arrival;
	}
	
	public Manifest(String id, String flight_no, String origin, String destination, String stops,String departure, String arrival) {
		super();
		this.id = Integer.parseInt(id);
		this.flight_no = flight_no;
		this.origin = origin;
		this.destination = destination;
		this.stops = Integer.parseInt(stops);;
		this.departure =  departure;
		this.arrival = arrival;
	}
	
	public Manifest() {
		
	}
		
}
