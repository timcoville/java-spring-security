package com.timcoville.auth.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.timcoville.auth.models.User;
import com.timcoville.auth.services.UserService;
import com.timcoville.auth.validations.UserValidator;

@Controller
public class Users {
	private final UserService userService;
	private UserValidator userValidator;
	public Users(UserService userService, UserValidator userValidator) {
		this.userService = userService;
		this.userValidator = userValidator;
	}
	
	
	@GetMapping("/registration")
	public String regForm(@Valid @ModelAttribute("user")User user) {
		return "registrationPage.jsp";
	}
	
	@PostMapping("/registration")
	public String reg(@Valid @ModelAttribute("user")User user, BindingResult result, Model model, HttpSession session, RedirectAttributes redirect) {
		userValidator.validate(user, result);
		if (result.hasErrors()) {
			model.addAttribute("err", true);
			return "registrationPage.jsp";
		} else {
			userService.saveUser(user);
			redirect.addFlashAttribute("regMessage", "Thanks for registering, an admin will review ASAP");
			return "redirect:/login";
		}
	}
	
    @GetMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "loginPage.jsp";
    }
	
	@GetMapping("/")
	public String dash(Principal principal, Model model, RedirectAttributes redirect) {
		String username = principal.getName();
		User user = userService.findByUsername(username);
		System.out.println(user.getRoles());
		System.out.println(user.getRoles().size());
		if (user.getRoles().size() == 0) {
			redirect.addFlashAttribute("regMessage", "Your account is under review.");
			return "redirect:/login";
		} else {
			userService.updateActivity(user);
			model.addAttribute("currentUser", user);
			return "homePage.jsp";
		}
	}
	
	@GetMapping("/admin")
	public String admin(Principal principal, Model model) {
		String username = principal.getName();
		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		model.addAttribute("currentUser", userService.findByUsername(username));
		return "adminPage.jsp";
	}
	
	@GetMapping("/accessDenied")
	public String denied() {
		return "accessDenied.jsp";
	}
	
	@GetMapping("/admin/approve/{id}")
	public String approved(@PathVariable("id")Long id) {
		User user = userService.findById(id);
		userService.approveUser(user);
		return "redirect:/admin";
	}
	
	@GetMapping("/admin/ban/{id}")
	public String banned(@PathVariable("id")Long id) {
		User user = userService.findById(id);
		userService.banUser(user);
		return "redirect:/admin";
	}

}
