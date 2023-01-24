package net.codejava.test.repository;

import net.codejava.test.model.CheckOption;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface CheckOptionRepository extends JpaRepository<CheckOption, Long> {
    @Transactional
    @Modifying
    @Query("update CheckOption c set c.checked = ?1 where c.id = ?2")
    int updateCheckedById(Boolean checked, Long id);

    List<CheckOption> findByNoteId(Long noteId);

    @Override
    void deleteById(Long aLong);
}
