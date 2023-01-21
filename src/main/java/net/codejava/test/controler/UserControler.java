package net.codejava.test.controler;

import net.codejava.test.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserControler {
    @GetMapping("/")
    public String sign_in(){
        return  "Sign_in";
    }

    @PostMapping("/sign_in_submit")
    public String sign_in_submit(){
        return "redirect:/home";
    }

    @GetMapping("/create_account")
    public String create_account(){
        return "Create_account";
    }

    @PostMapping("/create_account_submit")
    public String create_account_submit(@ModelAttribute User user){
        return "redirect:/home";
    }
}
