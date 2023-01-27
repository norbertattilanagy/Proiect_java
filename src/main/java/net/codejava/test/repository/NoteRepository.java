package net.codejava.test.repository;

import net.codejava.test.model.Note;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface NoteRepository extends JpaRepository<Note, Long> {
    Note findByUserId(Long userId);
    @Transactional
    @Modifying
    @Query("update Note n set n.title = ?1, n.content = ?2 where n.id = ?3")
    int updateTitleAndContentById(String title, String content, Long id);
}
