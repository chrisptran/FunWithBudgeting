package com.chris.fun_with_budgeting.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.chris.fun_with_budgeting.models.User;
import com.chris.fun_with_budgeting.services.ExpenseService;
import com.chris.fun_with_budgeting.services.UserService;

@Controller
public class MainController {

    public final ExpenseService expenseServ;
    public final UserService userServ;

    public MainController(ExpenseService expenseServ, UserService userServ) {
        this.expenseServ = expenseServ;
        this.userServ = userServ;
    }

    @GetMapping("/home")
	public String main(HttpSession session, Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:";
		}
		Long user_id = (Long) session.getAttribute("user_id");
		User user = userServ.getOne(user_id);
		
		model.addAttribute("user", user);
		model.addAttribute("expense", expenseServ.getOne(user_id));
        model.addAttribute("expenses", expenseServ.getAll());
		model.addAttribute("loggedInUser", userServ.getOne((Long) session.getAttribute("user_id")));
		

		model.addAttribute("formattedAmount", expenseServ.calculateTotalAmount(user_id));

		return "main/dashboard.jsp";
    
}




}

