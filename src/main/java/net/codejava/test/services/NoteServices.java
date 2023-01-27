package net.codejava.test.services;

import net.codejava.test.model.Note;
import net.codejava.test.repository.NoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NoteServices {
    @Autowired
    private NoteRepository noteRepository;

    public List<Note> getAll(){ return noteRepository.findAll(); }

    public long save(Note note){
        noteRepository.save(note);
        return note.getId();
    }

    public void updateById(Long id,String title, String content){
        noteRepository.updateTitleAndContentById(title,content,id);
    }
}
