package com.kacmar.controller;

import com.kacmar.domain.repository.CompetitionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by tomas on 9.4.2016.
 */
@Controller
public class CompetitionController {

    @Autowired
    private CompetitionRepository competitionRepository;

    @RequestMapping("/competitions")
    public String list(Model model){
        model.addAttribute("competitions", competitionRepository.getAllCompetitions());
        return "competitions";
    }
}
