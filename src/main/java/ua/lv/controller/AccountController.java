package ua.lv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.lv.entity.Account;
import ua.lv.entity.User;
import ua.lv.service.AccountService;
import ua.lv.service.UserService;

import java.security.Principal;
import java.util.List;

/**
 * Created by User on 20.10.2017.
 */
@Controller
public class AccountController {
    @Autowired
    AccountService accountService;
    @Autowired
    UserService userService;

    @GetMapping("/account")
    public String toWelcome(Model model,
                            Principal principal){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);
        model.addAttribute("currentUser", byUsername);
        model.addAttribute("emptyGoal",new Account());
        model.addAttribute("goalList", accountService.findAll());
        return "account";
    }

    @GetMapping("/goal")
    public String toGoal (Model model,
                Principal principal){
            model.addAttribute("emptyGoal", new Account());
            String principalName = principal.getName();
            User byUsername = userService.findByName(principalName);
            model.addAttribute("currentUser", byUsername);
          return "goal";
    }




    @RequestMapping(value = "/account" ,method = RequestMethod.POST)
    public String addGoal(Model model,Principal principal,@ModelAttribute("emptyGoal") Account account){
        String principalName = principal.getName();
        User byUsername = userService.findByName(principalName);
        model.addAttribute("currentUser", byUsername);
        account.setUser(byUsername);
        accountService.save(account);
        return "redirect:/account";
    }

    @RequestMapping(value = "/backToAccount" ,method = RequestMethod.GET)
    public String backAc(){
        return "redirect:/account";
    }

    @RequestMapping(value = "/changeGoal" ,method = RequestMethod.POST)
    public String changeProgress( @RequestParam int currentGoalCrNum,
                                 Principal principal){


        Account currentGoal = accountService.findByInterest(principal.getName());
        currentGoal.setCurrentGoalCrNum(currentGoalCrNum);
        accountService.save(currentGoal);
        return "redirect:/account";
    }
    
}
