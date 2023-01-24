package net.codejava.test;

import net.codejava.test.model.CheckOption;
import net.codejava.test.model.Note;
import net.codejava.test.model.User;

import java.util.List;

public class VarStore {

    public static Boolean incorectSignIn = true;
    public static Long userId = Long.valueOf(-1);
    public static Boolean userAdmin;
    public static List<User> allUsers;
    public static int myUserIndex;
    public static String userSearch = "";
    public static Long noteId;
    public static List<Note> allNote;
    public static int noteIndex;
    public static List<CheckOption> checkOptions;
}
