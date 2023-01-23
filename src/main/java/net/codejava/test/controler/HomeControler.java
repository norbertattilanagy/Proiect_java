package net.codejava.test.controler;

import jakarta.servlet.http.HttpServletRequest;
import net.codejava.test.VarStore;
import net.codejava.test.model.Note;
import net.codejava.test.model.User;
import net.codejava.test.services.NoteServices;
import net.codejava.test.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeControler {

    @Autowired
    NoteServices noteS;

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

    @PostMapping("/add_note_submit")
    public String add_note_submit(HttpServletRequest request) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String option = request.getParameter("option[]");

        VarStore.noteId = noteS.save(new Note(VarStore.userId,title,content));
        return "redirect:/";
    }
}
