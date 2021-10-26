package com.dewan.faveshows.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dewan.faveshows.models.Rating;
import com.dewan.faveshows.models.Show;
import com.dewan.faveshows.models.User;
import com.dewan.faveshows.services.RatingService;
import com.dewan.faveshows.services.ShowService;
import com.dewan.faveshows.services.UserService;
import com.dewan.faveshows.validators.UserValidator;

@Controller
public class MainController {
    private final UserService userService;
    private final UserValidator userValidator;
    private final ShowService showService;
    private final RatingService ratingService;
    
    public MainController(UserService userService,RatingService ratingService, UserValidator userValidator, ShowService showService) {
        this.userService = userService;
        this.userValidator = userValidator;
        this.showService = showService;
        this.ratingService= ratingService;
    }
    
    //=================================================================
    // Registration and Login
    //=================================================================
	
    @RequestMapping("/")
	public String index(Model model) {
		model.addAttribute("user", new User());
		return "index.jsp";
	}
	
	@RequestMapping(value="/registration", method=RequestMethod.POST)
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result,
			HttpSession session) {
		userValidator.validate(user, result);
		if(result.hasErrors()) {
			return "index.jsp";
		}else {
			User u = userService.registerUser(user);
			session.setAttribute("userId", u.getId());
			return "redirect:/shows";
		}
	}
	
	 @RequestMapping(value="/login", method=RequestMethod.POST)
	    public String loginUser(@RequestParam("email") String email, 
	    		@RequestParam("password") String password, 
	    		RedirectAttributes redirect, 
	    		HttpSession session) {
		 	if(userService.authenticateUser(email, password)) {
		 		User u = userService.findByEmail(email);
		 		session.setAttribute("userId", u.getId());
		 		return "redirect:shows";
		 	}else {
		 		redirect.addFlashAttribute("error", "The email or password you have entered in invalid.");
		 		return "redirect:/";
		 	}
	    }
	 
	 //=================================================================
	 // Dashboard
	 //=================================================================
	 
	 @RequestMapping("/shows")
	 public String dashboard(
			 Model model, 
			 HttpSession session,
			 RedirectAttributes redirect) {
		 Long userId = (Long) session.getAttribute("userId");
		 if(userId == null) {
			 redirect.addFlashAttribute("alert", "You must register or login successfully to enter the site");
			 return "redirect:/";
		 }
		 model.addAttribute("user", userService.findUserById(userId));
		 model.addAttribute("allShows", showService.allShows());
		 return "dashboard.jsp";
	 }
	 
	 //=================================================================
	 // Logout
	 //=================================================================
	 
	 @RequestMapping("/logout")
	 public String logout(HttpSession session) {
		 session.invalidate();
		 return "redirect:/";
	 }
	 
	 //=================================================================
	 // Create
	 //=================================================================
	 
	 @RequestMapping("/shows/new")
	 public String newShow(Model model,
			 HttpSession session,
			 RedirectAttributes redirect) {
		 Long userId = (Long) session.getAttribute("userId");
		 if(userId == null) {
			 redirect.addFlashAttribute("alert", "You must register or login successfully to enter the site");
			 return "redirect:/";
		 }
		 model.addAttribute("show", new Show());
		 return "createShow.jsp";
	 }
	 
	 @RequestMapping(value="/shows/new", method=RequestMethod.POST)
	 public String createShow(@Valid @ModelAttribute("show") Show show, BindingResult result) {
		 if(result.hasErrors()) {
			 return "createShow.jsp";
		 }else {
			 showService.saveShow(show);
			 return "redirect:/shows";
		 }
		 
	 }
	 
	 @RequestMapping(value="/shows/add_rating", method=RequestMethod.POST)
	 public String createRating(@Valid @ModelAttribute("rating") Rating rating, BindingResult result,
			 Model model) {
		 if(result.hasErrors()) {
			 model.addAttribute("allRatings", ratingService.allRatings());
			 return "showDetails.jsp";
		 }else {
			 ratingService.saveRating(rating);
			 return "redirect:/shows";
		 }
		 
	 }
	 
	 //=================================================================
	 // Read
	 //=================================================================
	 
	 @RequestMapping("/shows/{id}")
	 public String showDetails(Model model,
			 @PathVariable("id") Long id,
			 HttpSession session,
			 RedirectAttributes redirect) {
		 Long userId = (Long) session.getAttribute("userId");
		 if(userId == null) {
			 redirect.addFlashAttribute("alert", "You must register or login successfully to enter the site");
			 return "redirect:/";
		 }
		 model.addAttribute("rating", new Rating());
		 model.addAttribute("show", showService.findShowById(id));
		 model.addAttribute("allRatings", ratingService.allRatings());
		 model.addAttribute("allShows", showService.allShows());
		 model.addAttribute("user", userService.findUserById(userId));
		 return "showDetails.jsp";
	}
	 
	 //=================================================================
	 // Update
	 //=================================================================
	 
	 @RequestMapping("/shows/{id}/edit")
	 public String editShow(Model model,
			 @PathVariable("id") Long id,
			 HttpSession session,
			 RedirectAttributes redirect) {
		 Long userId = (Long) session.getAttribute("userId");
		 if(userId == null) {
			 redirect.addFlashAttribute("alert", "You must register or login successfully to enter the site");
			 return "redirect:/";
		 }
		 model.addAttribute("show", showService.findShowById(id));
		 return "editShow.jsp";
	}
	 
	 @RequestMapping(value="/shows/{id}/edit", method=RequestMethod.PUT)
	 public String updateShow(@Valid @ModelAttribute("show") Show show, BindingResult result) {
		 if(result.hasErrors()) {
			 return "editShow.jsp";
		 }else {
			 showService.saveShow(show);
			 return "redirect:/shows";
		 }
	 }
	 
	 //=================================================================
	 // Delete
	 //=================================================================

	 @RequestMapping(value="/shows/{id}/delete", method=RequestMethod.DELETE)
	 public String deleteShow(@PathVariable("id") Long id) {
		showService.deleteShow(id);
		return "redirect:/shows";
	 }
}
