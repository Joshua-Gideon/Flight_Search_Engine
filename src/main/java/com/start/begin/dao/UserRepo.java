package com.start.begin.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.start.begin.model.User;

public interface UserRepo extends JpaRepository<User, Integer>{

	User findByName(String userName);

}
