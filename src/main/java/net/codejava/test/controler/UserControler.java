package net.codejava.test.controler;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import net.codejava.test.VarStore;
import net.codejava.test.model.User;
import net.codejava.test.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserControler {

    @Autowired
    UserServices userS;
        @GetMapping("/sign_in")
    public String sign_in() {
        return "Sign_in";
    }

    @PostMapping("/sign_in_submit")
    public String sign_in_submit(HttpServletRequest request, HttpSession session) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        VarStore.allUsers = userS.getAll();
        for (int i = 0; i < VarStore.allUsers.size(); i++) {
            if (email.equals(VarStore.allUsers.get(i).getEmail()) && password.equals(VarStore.allUsers.get(i).getPassword())) {
                session.setAttribute("userId",VarStore.allUsers.get(i).getId());
                Long a = (Long) session.getAttribute("userId");
                session.setAttribute("userAdmin",VarStore.allUsers.get(i).getAdmin());
                session.setAttribute("myUserIndex",i);
                System.out.println(session.getAttribute("myUserIndex"));
                session.setAttribute("userSearch","");
                return "redirect:/home";
            }
        }
        session.setAttribute("incorectSignIn",true);
        return "redirect:/sign_in";
    }

    @GetMapping("/create_account")
    public String create_account() {
        return "Create_account";
    }

    @PostMapping("/create_account_submit")
    public String create_account_submit(HttpServletRequest request,HttpSession session) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password1");

        session.setAttribute("userId",userS.save(new User(name, email, password,false)));
        session.setAttribute("userAdmin",false);

        return "redirect:/home";
    }

    @PostMapping("/search_users")
    public String search_users(HttpServletRequest request,HttpSession session){
       if (!VarStore.verifySessionExist(request))
           return "redirect:/sign_in";
        session.setAttribute("userSearch",request.getParameter("search"));
        return "redirect:/users";
    }

    @GetMapping("/my_account")
    public String my_account(HttpServletRequest request) {
       if (!VarStore.verifySessionExist(request))
           return "redirect:/sign_in";

        return "My_account";
    }

    @PostMapping("/edit_user_data")
    public String edit_user_data(HttpServletRequest request,HttpSession session) {
       if (!VarStore.verifySessionExist(request))
           return "redirect:/sign_in";

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        userS.updateDate((Long) session.getAttribute("userId"),name,email);
        VarStore.allUsers = userS.getAll();

        return "redirect:/my_account";
    }

    @PostMapping("/edit_user_password")
    public String edit_user_password(HttpServletRequest request,HttpSession session) {
       if (!VarStore.verifySessionExist(request))
           return "redirect:/sign_in";

        String password = request.getParameter("new_password1");
        userS.updatePassword((Long) session.getAttribute("userId"),password);
        VarStore.allUsers = userS.getAll();

        return "redirect:/my_account";
    }

    @GetMapping("/delete_account")
    public String delete_account(HttpSession session){
        userS.deleteUser((Long) session.getAttribute("userId"));
       return "redirect:/sign_in";
    }

    @GetMapping("/log_out")
    public String log_out(HttpServletRequest request){
       if (!VarStore.verifySessionExist(request))
           return "redirect:/sign_in";
        request.getSession().invalidate();
        VarStore.allUsers.clear();
       return "redirect:/sign_in";
    }

    @GetMapping("/admin_user/{id}")
    public String note_id(@PathVariable("id") int index,HttpServletRequest request) {
       if (!VarStore.verifySessionExist(request))
           return "redirect:/sign_in";

        Long userId = VarStore.allUsers.get(index).getId();
        if(VarStore.allUsers.get(index).getAdmin())
            userS.updateAdmin(userId,false);
        else
            userS.updateAdmin(userId,true);

        VarStore.allUsers = userS.getAll();
        return "redirect:/users";
    }
}
