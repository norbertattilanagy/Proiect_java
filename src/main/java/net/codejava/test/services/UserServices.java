package net.codejava.test.services;

import net.codejava.test.model.User;
import net.codejava.test.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServices {
    @Autowired
    private UserRepository userRepository;

    public List<User> getAll(){return userRepository.findAll();}

    public long save(User user){
        userRepository.save(user);
        return user.getId();
    }

    public void updateDate(Long id,String name,String email){
        userRepository.updateNameAndEmailById(name,email,id);
    }

    public void updatePassword(Long id,String password){
        userRepository.updatePasswordById(password,id);
    }

    public void updateAdmin(Long id,Boolean admin){
        userRepository.updateAdminById(admin, id);
    }

    public void deleteUser(Long id){
        userRepository.deleteById(id);
    }
}
