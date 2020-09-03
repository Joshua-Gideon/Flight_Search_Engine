package com.start.begin.dao;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.start.begin.model.Manifest;

@Repository
public interface ManifestDao extends CrudRepository<Manifest, Long> {

}
