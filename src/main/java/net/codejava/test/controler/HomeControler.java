package net.codejava.test.controler;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
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
    public String redirect(){
        return "redirect:sign_in";
    }

    @GetMapping("/home")
    public String home(HttpServletRequest request) {
        if (!VarStore.verifySessionExist(request))
            return "redirect:/sign_in";
        VarStore.allNote = noteS.getAll();
            return "Home";
    }

    @GetMapping("/users")
    public String admin(HttpServletRequest request) {
       if (!VarStore.verifySessionExist(request))
           return "redirect:/sign_in";
        return "Admin_users";
    }

}
