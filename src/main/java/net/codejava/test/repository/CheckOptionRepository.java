package net.codejava.test.repository;

import net.codejava.test.model.CheckOption;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CheckOptionRepository extends JpaRepository<CheckOption, Long> {
}
