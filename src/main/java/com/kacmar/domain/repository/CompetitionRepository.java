package com.kacmar.domain.repository;

import com.kacmar.domain.Competition;

import java.util.List;

/**
 * Created by tomas on 9.4.2016.
 */
public interface CompetitionRepository {
    List<Competition> getAllCompetitions();

    public Competition getCompetitionById(long id);
}


