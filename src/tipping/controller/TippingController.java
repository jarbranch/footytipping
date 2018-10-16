package tipping.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tipping.entity.Game;
import tipping.entity.Round;
import tipping.entity.Tip;
import tipping.entity.TippingMain;
import tipping.entity.User;
import tipping.service.TippingService;
import tipping.service.UserService;

@Controller
@RequestMapping("/tipping")
public class TippingController {
	
	private static final HashMap<Integer, String> roundMapTest;
	static {
		
		roundMapTest = new HashMap<Integer, String>();
		//HashMap<Integer, String> aMap = new HashMap<Integer, String>();
		roundMapTest.put(1,"Round 1"); roundMapTest.put(2,"Round 2");
		roundMapTest.put(3,"Round 3"); roundMapTest.put(4,"Round 4");
		roundMapTest.put(5,"Round 5"); roundMapTest.put(6,"Round 6");
		roundMapTest.put(7,"Round 7"); roundMapTest.put(8,"Round 8");
		roundMapTest.put(9,"Round 9"); roundMapTest.put(10,"Round 10");
		roundMapTest.put(11,"Round 11"); roundMapTest.put(12,"Round 12");
		roundMapTest.put(13,"Round 13"); roundMapTest.put(14,"Round 14");
		roundMapTest.put(15,"Round 15"); roundMapTest.put(16,"Round 16");
		roundMapTest.put(17,"Round 17"); roundMapTest.put(18,"Round 18");
		roundMapTest.put(19,"Round 19"); roundMapTest.put(20,"Round 20");
		roundMapTest.put(21,"Round 21"); roundMapTest.put(22,"Round 22");
		roundMapTest.put(23,"Round 23"); roundMapTest.put(24,"Finals Week 1");
		roundMapTest.put(25,"Semi Finals"); roundMapTest.put(26,"Preliminary Finals");
		roundMapTest.put(27,"Grand Final");
	}
	
	@Autowired
	private TippingService tippingService;
	
	@Autowired
	private UserService userService;
	
	
	@GetMapping("/list")
	public String getRounds(Model theModel, HttpServletRequest request) {
				
		Round theRound = new Round();
		
		theModel.addAttribute("roundMap", roundMapTest);
		theModel.addAttribute("currentRound", theRound);
		
		HttpSession session = request.getSession(false);
		
		User currentUser = (User)session.getAttribute("user");
				
		Round round = tippingService.getCurrentRound(currentUser.getId());
													
		theModel.addAttribute("selectedRound", round);
		
		//return "tips-entry";
		return "main-page-v2";
	}
	
	@GetMapping("/getRound")
	public String getRound(@RequestParam("id") int roundId, 
							HttpServletRequest request, Model theModel) {
		
		HttpSession session = request.getSession(false);
		
		User currentUser = (User)session.getAttribute("user");
				
		Round round = tippingService.getRound(roundId, currentUser.getId());
													
		theModel.addAttribute("selectedRound", round);
		theModel.addAttribute("roundMap", roundMapTest);

		//return "tips-entry";
		return "main-page-v2";
	}
	
	@PostMapping("/saveTips")
	public String saveTips(@ModelAttribute("selectedRound") Round theTips, HttpServletRequest request,
							RedirectAttributes savedAttributes) {
				
		HttpSession session = request.getSession(false);
		
		User currentUser = (User)session.getAttribute("user");
		
		for (Game i : theTips.getGames()) {	
			for (Tip j : i.getTipSelection()) {
				if (j.getTipSelected() == null) {
					j.setTipSelected("A");					
				}
				j.setGame(i);
				j.setUser(currentUser);
			}
		}			
		tippingService.saveTips(theTips);
		
		savedAttributes.addFlashAttribute("saved", "Tips saved successfully.");
		
		return "redirect:/tipping/getRound?id=" + theTips.getId();
	}
	
	@GetMapping("/main")
	public String showMainMenu() {
		return "redirect:/tipping/list";
	}
	
	@GetMapping("/ladder")
	public String showUserLadder(Model theModel) {
		
		List<User> userLadder = userService.getUsers();
		
		theModel.addAttribute("ladder", userLadder);
		
		//return "user-ladder";
		return "main-page-v3";
	}
	
	
}
