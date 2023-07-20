package com.chris.fun_with_budgeting.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chris.fun_with_budgeting.models.Expense;
import com.chris.fun_with_budgeting.services.ExpenseService;

@Controller
public class ExpenseController {

    private final ExpenseService expenseServ;

    public ExpenseController(ExpenseService expenseServ) {
        this.expenseServ = expenseServ;
    }

    @GetMapping("/expenses/new")
    public String createTransactions(@ModelAttribute("newExpense") Expense expense) {
        return "expense/createExpense.jsp";
    }

    @PostMapping("/expenses/process")
    public String processTransaction(@Valid @ModelAttribute("newExpense") Expense newTransaction, BindingResult result) {
        if(result.hasErrors()) {
            return "expense/createExpense.jsp";
        }
        expenseServ.create(newTransaction);
        return "redirect:/home";
    }

    @GetMapping("/expenses/{id}")
    public String displayTransaction(@PathVariable("id") Long id, Model model) {
        Expense oneExpense = expenseServ.getOne(id);
        model.addAttribute("oneExpense", oneExpense);
        return "expense/displayOne.jsp";
    }

    @GetMapping("/expenses/edit/{id}")
    public String editTransaction(@PathVariable("id") Long id, Model model) {
        model.addAttribute("expense", expenseServ.getOne(id));
        return "expense/editExpense.jsp";
    }

    @RequestMapping("/expenses/process/edit/{id}")
    public String processEditTransaction(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
        if(result.hasErrors()) {
            return "expense/editExpense.jsp";
        }
        expenseServ.update(expense);
        return "redirect:/home";
    }

    @DeleteMapping("/expenses/{id}")
    public String deleteExpense(@PathVariable("id") Long id) {
        expenseServ.delete(id);
        return "redirect:/home";
    }
    
}

