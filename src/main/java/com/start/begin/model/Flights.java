package com.start.begin.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Flights {
@Id
@Column(name="flight_no")
String id;
@Column(name="capacity")
int capacity;
@Column(name="airline")
String airline;
@Column(name="type")
String type;


public String getId() {
return id;
}
public void setId(String id) {
this.id = id;
}
public int getCapacity() {
return capacity;
}
public void setCapacity(int capacity) {
this.capacity = capacity;
}
public String getAirline() {
return airline;
}
public void setAirline(String airline) {
this.airline = airline;
}
public String getType() {
return type;
}
public void setType(String type) {
this.type = type;
}
public Flights(String id, String capacity, String airline, String type) {
	super();
	this.id = id;
	this.capacity = Integer.parseInt(capacity);
	this.airline = airline;
	this.type = type;
}
public Flights() {
	
}


}
