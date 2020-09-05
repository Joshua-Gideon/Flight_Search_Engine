package com.start.begin.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.start.begin.model.Manifest;

@Repository
public interface ManifestDao extends JpaRepository<Manifest, Long> {

	@Query(value="SELECT * FROM manifest WHERE origin=?1 and destination=?2", nativeQuery = true)
	public List<Manifest> findFilghts(String origin, String destination);
	
}
