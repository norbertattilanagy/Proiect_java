package net.codejava.test.controler;

import net.codejava.test.VarStore;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeControler {

    @GetMapping("/")
    public String home() {
        if (VarStore.userId == -1)
            return "redirect:sign_in";
        return "Home";
    }

    @GetMapping("/users")
    public String admin() {
        if (VarStore.userId == -1)
            return "redirect:sign_in";
        return "Admin_users";
    }

    @GetMapping("/add_note")
    public String add_note() {
        return "Add_note";
    }
}
