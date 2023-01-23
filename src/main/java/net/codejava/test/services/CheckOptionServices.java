package net.codejava.test.services;

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
}