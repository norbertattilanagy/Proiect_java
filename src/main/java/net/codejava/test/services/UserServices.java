package net.codejava.test.services;

import net.codejava.test.model.User;
import net.codejava.test.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServices {
    @Autowired
    private UserRepository uRepo;

    public List<User> getAll(){return uRepo.findAll();}

    public void save(User user){uRepo.save(user); }
}
