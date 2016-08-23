package com.kacmar.domain;

import java.util.Date;

/**
 * Created by tomas on 9.4.2016.
 */
public class Competition {
    private long idCompetition;
    private String name;
    private String description;
    private int city;
    private Date startDate;
    private boolean selfRegistration;
    private Date startRegistration;
    private Date endRegistration;
    private int maxTeams;
    private boolean foodSelect;
    private String photoPath;
    private int createdBy;
    private Date dateCreated;

    public Competition(){
        super();
    }

    public Competition(long idCompetition, String name, String description, Date startDate){
        this.idCompetition = idCompetition;
        this.name = name;
        this.description = description;
        this.startDate = startDate;
    }

    public long getIdCompetition() {
        return idCompetition;
    }

    public void setIdCompetition(long idCompetition) {
        this.idCompetition = idCompetition;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCity() {
        return city;
    }

    public void setCity(int city) {
        this.city = city;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public boolean isSelfRegistration() {
        return selfRegistration;
    }

    public void setSelfRegistration(boolean selfRegistration) {
        this.selfRegistration = selfRegistration;
    }

    public Date getStartRegistration() {
        return startRegistration;
    }

    public void setStartRegistration(Date startRegistration) {
        this.startRegistration = startRegistration;
    }

    public Date getEndRegistration() {
        return endRegistration;
    }

    public void setEndRegistration(Date endRegistration) {
        this.endRegistration = endRegistration;
    }

    public int getMaxTeams() {
        return maxTeams;
    }

    public void setMaxTeams(int maxTeams) {
        this.maxTeams = maxTeams;
    }

    public boolean isFoodSelect() {
        return foodSelect;
    }

    public void setFoodSelect(boolean foodSelect) {
        this.foodSelect = foodSelect;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }
}
