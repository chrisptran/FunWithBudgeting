package com.chris.fun_with_budgeting.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.chris.fun_with_budgeting.models.User;

public interface UserRepository extends CrudRepository<User, Long> {
    Optional<User>findByEmail (String email);
    List<User> findAll();

}