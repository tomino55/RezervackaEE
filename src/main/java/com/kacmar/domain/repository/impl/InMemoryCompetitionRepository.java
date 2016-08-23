package com.kacmar.domain.repository.impl;

import com.kacmar.domain.Competition;
import com.kacmar.domain.repository.CompetitionRepository;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by tomas on 9.4.2016.
 */

@Repository
public class InMemoryCompetitionRepository implements CompetitionRepository {

    private List<Competition> listOfCompetitions = new ArrayList<Competition>();

    public InMemoryCompetitionRepository(){
        Competition comp1 = new Competition(1,"Ciernohorsky pohar", "4. rocnik sutaze o pohar starostu obce Poloma.", new Date());
        listOfCompetitions.add(comp1);
        Competition comp2 = new Competition(2,"Bycia hora", "Treti rocnik pohara starostu obce Olsov", new Date());
        listOfCompetitions.add(comp2);
        Competition comp3 = new Competition(3,"Toryssky pohar", "Treti rocnik pohara starostu obce Olsov", new Date());
        listOfCompetitions.add(comp3);
        Competition comp4 = new Competition(3,"Nocna Byjacovce", "Treti rocnik pohara starostu obce Olsov", new Date());
        listOfCompetitions.add(comp4);
        Competition comp5 = new Competition(5,"Pohar Krivany", "Treti rocnik pohara starostu obce Olsov", new Date());
        listOfCompetitions.add(comp5);
    }
    public List<Competition> getAllCompetitions() {
        return this.listOfCompetitions;
    }

    public Competition getCompetitionById(long id){
        Competition comp = null;
        for(Competition competition : listOfCompetitions){
            if(competition.getIdCompetition() == id){
                comp =  competition;
                break;
            }
        }

        if(comp == null){
            throw new IllegalArgumentException("Competition with id " + id + " does not exist.");
        }
        else {
            return comp;
        }
    }
}
