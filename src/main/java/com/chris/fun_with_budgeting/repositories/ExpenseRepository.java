package com.chris.fun_with_budgeting.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.chris.fun_with_budgeting.models.Expense;

public interface ExpenseRepository extends CrudRepository<Expense, Long>{
    List<Expense> findAll();
    @Query("SELECT SUM(e.amount) FROM Expense e")
    double calculateTotalAmount();
    List<Expense> findAllByOrderByDateAsc();
    
    List<Expense> findByUserId(Long userId);
    
}
