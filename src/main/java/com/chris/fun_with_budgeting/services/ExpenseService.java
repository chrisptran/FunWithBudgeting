package com.chris.fun_with_budgeting.services;


import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.chris.fun_with_budgeting.models.Expense;
import com.chris.fun_with_budgeting.repositories.ExpenseRepository;

@Service
public class ExpenseService {

    private final ExpenseRepository expenseRepo;

    public ExpenseService(ExpenseRepository expenseRepo) {
		this.expenseRepo = expenseRepo;
	}
	public Expense getOne(Long id) {
		Optional<Expense> expense = expenseRepo.findById(id);
		return expense.isPresent() ? expense.get() : null;
	}

	public List<Expense> getAll() {
		return (List<Expense>) expenseRepo.findAllByOrderByDateAsc();
	}
	
	public Expense create(Expense expense) {
		return expenseRepo.save(expense);
	}
	
	public Expense update(Expense expense) {
		return expenseRepo.save(expense);
	}
	
	public void delete(Long id) {
		expenseRepo.deleteById(id);
	}
	public double getFormattedTotalAmount(Long id) {
		Optional<Expense> expenseOptional = expenseRepo.findById(id);
		if(expenseOptional.isPresent()) {
			Expense expense = expenseOptional.get();
			return expense.getAmount();
		} else {
	        throw new RuntimeException("Expense not found for ID: " + id);
	    }
}
	
	public double calculateTotalAmount(Long userId) {
//	    double totalAmount = expenseRepo.calculateTotalAmount(); // Assuming you have a custom method to calculate the total amount
//	    BigDecimal roundedAmount = BigDecimal.valueOf(totalAmount).setScale(2, RoundingMode.HALF_UP);
//	    return roundedAmount.doubleValue();
		
		List<Expense> expenses = expenseRepo.findByUserId(userId);
		double totalAmount = 0.0;
		for (Expense expense : expenses) {
			totalAmount += expense.getAmount();
		}
		BigDecimal roundedAmount = BigDecimal.valueOf(totalAmount).setScale(2, RoundingMode.HALF_UP);
		return roundedAmount.doubleValue();
	}


}
