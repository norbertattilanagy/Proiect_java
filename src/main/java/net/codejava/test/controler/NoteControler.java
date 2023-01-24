package net.codejava.test.controler;

import jakarta.servlet.http.HttpServletRequest;
import net.codejava.test.VarStore;
import net.codejava.test.model.CheckOption;
import net.codejava.test.model.Note;
import net.codejava.test.services.CheckOptionServices;
import net.codejava.test.services.NoteServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

@Controller
public class NoteControler {

    @Autowired
    NoteServices noteS;
    @Autowired
    CheckOptionServices optionS;

    @GetMapping("/add_note")
    public String add_note() {
        if (VarStore.userId == -1)
            return "redirect:sign_in";
        return "Add_note";
    }

    @PostMapping("/add_note_submit")
    public String add_note_submit(HttpServletRequest request, @RequestParam("option[]") List<String> option) {
        if (VarStore.userId == -1)
            return "redirect:sign_in";

        String title = request.getParameter("title");
        String content = request.getParameter("content");

        VarStore.noteId = noteS.save(new Note(VarStore.userId,title,content));
        for(int i=0;i<option.size();i++){
            optionS.save(new CheckOption(VarStore.noteId,option.get(i),false));
        }
        return "redirect:/";
    }

    @GetMapping("/note/{id}")
    public String note_id(@PathVariable("id") int index) {
        if (VarStore.userId == -1)
            return "redirect:/sign_in";

        VarStore.noteIndex = index;
        VarStore.checkOptions = optionS.selectByNoteId(VarStore.allNote.get(VarStore.noteIndex).getId());

        return "redirect:/note";
    }

    @GetMapping("/note")
    public String note() {
        if (VarStore.userId == -1)
            return "redirect:/sign_in";

        return "View_note";
    }

    @PostMapping("/submit_note_checkbox")
    public String submit_checkbox(@RequestParam("option[]") List<String> option) {
        if (VarStore.userId == -1)
            return "redirect:sign_in";
        if (option.size()==1) {
            for (int j = 0; j < VarStore.checkOptions.size(); j++) {
                if (VarStore.checkOptions.get(j).getChecked())
                    optionS.updateCheckedById(VarStore.checkOptions.get(j).getId(), false);
            }
        }else {
            for (int i = 0; i < option.size(); i++) {
                for (int j = 0; j < VarStore.checkOptions.size(); j++) {
                    if(!option.get(i).isEmpty()) {
                        if (!VarStore.checkOptions.get(j).getId().equals(Long.valueOf(option.get(i))) && VarStore.checkOptions.get(j).getChecked())
                            optionS.updateCheckedById(Long.valueOf(option.get(i)), false);
                        else if (VarStore.checkOptions.get(j).getId().equals(Long.valueOf(option.get(i))) && !VarStore.checkOptions.get(j).getChecked()) {
                            optionS.updateCheckedById(Long.valueOf(option.get(i)), true);
                        }
                    }
                }
            }
        }
        return "redirect:/";
    }
}
