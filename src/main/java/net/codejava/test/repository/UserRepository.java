package net.codejava.test.repository;

import net.codejava.test.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    @Transactional
    @Modifying
    @Query("update User u set u.password = ?1 where u.id = ?2")
    int updatePasswordById(String password, Long id);
    @Transactional
    @Modifying
    @Query("update User u set u.name = ?1, u.email = ?2 where u.id = ?3")
    int updateNameAndEmailById(String name, String email, Long id);
    @Transactional
    @Modifying
    @Query("update User u set u.admin = ?1 where u.id = ?2")
    int updateAdminById(Boolean admin, Long id);

    @Override
    void deleteById(Long aLong);
}
