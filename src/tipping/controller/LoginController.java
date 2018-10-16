package tipping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@GetMapping("/login")
	public String login() {
	
		return "login-page";
		
	}
	
	// add request mapping for /access-denied
	
	@RequestMapping("/access-denied")
	public String showAccessDenied() {
		
		return "access-denied";
		
	}
	
}









