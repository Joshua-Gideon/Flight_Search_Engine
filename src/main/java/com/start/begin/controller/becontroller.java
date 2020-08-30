package com.start.begin.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class becontroller {
	@GetMapping("/begin")
 public String sayhello() {
	 return "begin";
 }
}
