package com.timcoville.auth.services;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.timcoville.auth.models.Role;
import com.timcoville.auth.models.User;
import com.timcoville.auth.repositories.RoleRepo;
import com.timcoville.auth.repositories.UserRepo;

@Service
public class UserService {
	private UserRepo userRepo;
	private RoleRepo roleRepo;
	private BCryptPasswordEncoder bCrypt;
	public UserService(UserRepo userRepo, RoleRepo roleRepo, BCryptPasswordEncoder bCrypt) {
		this.userRepo = userRepo;
		this.roleRepo = roleRepo;
		this.bCrypt = bCrypt;
	}
	
	public User findById(Long id) {
		Optional<User> record = userRepo.findById(id);
		if (record.isPresent()) {
			return record.get();
		} else {
			return null;
		}
	}
	public void saveUser(User user) {
		user.setPassword(bCrypt.encode(user.getPassword()));
		userRepo.save(user);
	}
	
	public void approveUser(User user) {
		user.setRoles(roleRepo.findByName("ROLE_USER"));
		userRepo.save(user);
	}
	
	public void banUser(User user) {
		List<Role> roles = user.getRoles();
		roles.remove(0);
		userRepo.save(user);
	}
	
	public void updateActivity(User user) {
		Date date = new Date();
		user.setActiveAt(date);
		userRepo.save(user);
	}
	
	public void saveWithUserRole(User user) {
		user.setPassword(bCrypt.encode(user.getPassword()));
		user.setRoles(roleRepo.findByName("ROLE_USER"));
		userRepo.save(user);
	}
	
	public void saveWithAdminRole(User user) {
		user.setPassword(bCrypt.encode(user.getPassword()));
		user.setRoles(roleRepo.findByName("ROLE_ADMIN"));
		userRepo.save(user);
	}
	
	public User findByUsername(String username) {
		return userRepo.findByUsername(username);
	}
	
	public User findByEmail(String email) {
		return userRepo.findByEmail(email);
	}
	
	public List<User> findAllUsers(){
		return userRepo.findAll();
	}
	
	
	
}
