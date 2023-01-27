package net.codejava.test.controler;

import net.codejava.test.VarStore;
import net.codejava.test.services.NoteServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeControler {

    @Autowired
    NoteServices noteS;

    @GetMapping("/")
    public String home() {
        VarStore.incorectSignIn = true;
        if (VarStore.userId == -1)
            return "redirect:sign_in";

        VarStore.allNote = noteS.getAll();
        return "Home";
    }

    @GetMapping("/users")
    public String admin() {
        if (VarStore.userId == -1)
            return "redirect:sign_in";
        return "Admin_users";
    }

}
