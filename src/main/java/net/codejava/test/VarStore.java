package net.codejava.test;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import net.codejava.test.model.CheckOption;
import net.codejava.test.model.Note;
import net.codejava.test.model.User;

import java.util.List;

public class VarStore {

    public static List<User> allUsers;
    public static List<Note> allNote;
    public static List<CheckOption> checkOptions;

    public static Boolean verifySessionExist(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if (session == null) {
            session.setAttribute("incorectSignIn",false);
            return false;
        }
        Boolean b = (Boolean) session.getAttribute("incorectSignIn");
        if (b==null)
            session.setAttribute("incorectSignIn",false);
        return true;
    }

}
