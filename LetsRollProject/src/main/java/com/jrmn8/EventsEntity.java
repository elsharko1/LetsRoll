package com.jrmn8;

import com.jrmn8.dao.AccessibilityDao;

import javax.persistence.*;

/**
 * Created by Mark on 8/10/2017.
 */
@Entity
@Table(name = "events", schema = "letsrolldb")
public class EventsEntity {
    private String eventID;
    private String title;
    private String creator;
    private String location;
    private String description;
    private String date;
    private String skillsneeded;
    private String accessibility = "";

    public EventsEntity(String eventId, String title, String creator, String location, String description, String date, String skillsneeded) {
        this.eventID = eventId;
        this.title = title;
        this.creator = creator;
        this.location = location;
        this.description = description;
        this.date = date;
        this.skillsneeded = skillsneeded;
    }

    public EventsEntity() {
        // need a blank constructor!
    }

    @Id
    @Column(name = "eventID", nullable = false, length = 99)
    public String getEventID() {
        return eventID;
    }

    public void setEventID(String eventId) {
        this.eventID = eventId;
    }

    @Basic
    @Column(name = "title", nullable = true, length = 5000)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "creator", nullable = true, length = 50)
    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    @Basic
    @Column(name = "location", nullable = true, length = 5000)
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Basic
    @Column(name = "description", nullable = true, length = 10000)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "date", nullable = true, length = 50)
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Basic
    @Column(name = "skillsneeded", nullable = true, length = 450)
    public String getSkillsneeded() {
        return skillsneeded;
    }

    public void setSkillsneeded(String skillsneeded) {
        this.skillsneeded = skillsneeded;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EventsEntity that = (EventsEntity) o;

        if (eventID != null ? !eventID.equals(that.eventID) : that.eventID != null) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (creator != null ? !creator.equals(that.creator) : that.creator != null) return false;
        if (location != null ? !location.equals(that.location) : that.location != null) return false;
        if (description != null ? !description.equals(that.description) : that.description != null) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;
        if (skillsneeded != null ? !skillsneeded.equals(that.skillsneeded) : that.skillsneeded != null) return false;

        return true;
    }

    public void accessibility() {
        if (AccessibilityDao.getExact(eventID, "eventID").size() > 0) {
            AccessibilityEntity ae = AccessibilityDao.getExact(eventID, "eventID").get(0);
            if (ae.getWheelchair() == 1) accessibility = accessibility + "Wheelchair Accessible\n";
            if (ae.getFamily() == 1) accessibility = accessibility + "Family Friendly\n";
            if (ae.getServicedog() == 1) accessibility = accessibility + "Service Dog Friendly\n";
            if (ae.getBlind() == 1) accessibility = accessibility + "Accommodates the visually impaired\n";
        }

    }

    @Override
    public int hashCode() {
        int result = eventID != null ? eventID.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (creator != null ? creator.hashCode() : 0);
        result = 31 * result + (location != null ? location.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (skillsneeded != null ? skillsneeded.hashCode() : 0);
        return result;
    }


}
