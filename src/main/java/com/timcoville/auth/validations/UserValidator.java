package com.timcoville.auth.validations;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.timcoville.auth.models.User;
import com.timcoville.auth.services.UserService;

@Component
public class UserValidator implements Validator {
    private final UserService userService;
    public UserValidator (UserService userService) {
    	this.userService = userService;
    }
    
	
	
	
    //    1
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }
    
    // 2
    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;
        
      
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            // 3
            errors.rejectValue("passwordConfirmation", "Match");
        }
        
        if (userService.findByUsername(user.getUsername()) != null) {
        	errors.rejectValue("username", "Exist");
        }
        
        if (userService.findByEmail(user.getEmail()) != null) {
        	errors.rejectValue("email", "Exist");
        }
        
        
        
        
    }
}
