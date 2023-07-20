package com.chris.fun_with_budgeting.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.chris.fun_with_budgeting.models.LoginUser;
import com.chris.fun_with_budgeting.models.User;
import com.chris.fun_with_budgeting.repositories.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepo;
    
    public UserService(UserRepository userRepo) {
		this.userRepo = userRepo;
	}

    public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		return userRepo.save(user);
	}
	
	public User getOne(Long id) {
		Optional<User> user = userRepo.findById(id);
		return user.isPresent() ? user.get() : null;
	}
	
	public User getOne(String email) {
		Optional<User> user = userRepo.findByEmail(email);
		return user.isPresent() ? user.get() : null;
	}

	public User login(LoginUser loginUser, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		User user = getOne(loginUser.getEmail());
		if(user == null) {
			result.rejectValue("email", "Unique", "invalid credentials");
		}
		if(!BCrypt.checkpw(loginUser.getPassword(), user.getPassword())) {
			result.rejectValue("email", "Match", "invalid credentials");
			return null;
		}
		return user;
	}


}

