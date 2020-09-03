package com.start.begin.dao;

import org.springframework.data.repository.CrudRepository;

import com.start.begin.model.Flights;

public interface FlightsDao extends CrudRepository<Flights, String>{

}
