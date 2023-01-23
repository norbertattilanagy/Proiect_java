package net.codejava.test.controler;

import jakarta.servlet.http.HttpServletRequest;
import net.codejava.test.VarStore;
import net.codejava.test.model.User;
import net.codejava.test.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
    public String sign_in_submit(HttpServletRequest request) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        VarStore.allUsers = userS.getAll();
        for (int i = 0; i < VarStore.allUsers.size(); i++) {
            if (email.equals(VarStore.allUsers.get(i).getEmail()) && password.equals(VarStore.allUsers.get(i).getPassword())) {
                VarStore.userId = VarStore.allUsers.get(i).getId();
                //userServices.updateAdmin(VarStore.userId,true);
                VarStore.userAdmin = VarStore.allUsers.get(i).getAdmin();
                VarStore.myUserIndex = i;
                return "redirect:/";
            }
        }
        VarStore.incorectSignIn = false;
        return "redirect:/sign_in";
    }

    @GetMapping("/create_account")
    public String create_account() {
        return "Create_account";
    }

    @PostMapping("/create_account_submit")
    public String create_account_submit(HttpServletRequest request) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password1");

        VarStore.userId = userS.save(new User(name, email, password,false));
        VarStore.userAdmin = false;

        return "redirect:/";
    }

    @PostMapping("/search_users")
    public String search_users(HttpServletRequest request){
        if (VarStore.userId == -1)
            return "redirect:sign_in";

        VarStore.userSearch = request.getParameter("search");
        return "redirect:/users";
    }

    @GetMapping("/my_account")
    public String my_account() {
        if (VarStore.userId == -1)
            return "redirect:sign_in";

        return "My_account";
    }

    @PostMapping("/edit_user_data")
    public String edit_user_data(HttpServletRequest request) {
        if (VarStore.userId == -1)
            return "redirect:sign_in";

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        userS.updateDate(VarStore.userId,name,email);
        VarStore.allUsers = userS.getAll();

        return "redirect:/my_account";
    }

    @PostMapping("/edit_user_password")
    public String edit_user_password(HttpServletRequest request) {
        if (VarStore.userId == -1)
            return "redirect:sign_in";

        String password = request.getParameter("new_password1");
        userS.updatePassword(VarStore.userId,password);
        VarStore.allUsers = userS.getAll();

        return "redirect:/my_account";
    }

    @GetMapping("/delete_account")
    public String delete_account(){
        userS.deleteUser(VarStore.userId);
        return "redirect:sign_in";
    }

    @GetMapping("/log_out")
    public String log_out(){
        VarStore.userId= Long.valueOf(-1);
        VarStore.userAdmin = false;
        VarStore.allUsers.clear();
        return "redirect:sign_in";
    }
}
