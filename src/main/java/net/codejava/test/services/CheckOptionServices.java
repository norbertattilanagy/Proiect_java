package net.codejava.test.services;

import jakarta.transaction.Transactional;
import net.codejava.test.model.CheckOption;
import net.codejava.test.repository.CheckOptionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CheckOptionServices {
    @Autowired
    private CheckOptionRepository checkOptionRepository;

    private List<CheckOption> getAll(){ return checkOptionRepository.findAll(); }

    public long save(CheckOption checkOption){
        checkOptionRepository.save(checkOption);
        return checkOption.getId();
    }

    public List<CheckOption> selectByNoteId(Long noteId){
        return checkOptionRepository.findByNoteId(noteId);
    }

    public void updateCheckedById(Long id,Boolean check){
        checkOptionRepository.updateCheckedById(check,id);
    }

    public void deleteById(Long id){
        checkOptionRepository.deleteById(id);
    }

    @Transactional
    public void deleteByNoteId(Long id){
        checkOptionRepository.deleteByNoteId(id);
    }
}
