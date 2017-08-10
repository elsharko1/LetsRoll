package com.jrmn8;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "events", schema = "letsrolldb", catalog = "")
public class EventsEntity {
    private String eventId;
    private String title;
    private String creator;
    private String location;
    private String description;
    private Timestamp date;
    private String skillsneeded;

    @Id
    @Column(name = "eventID", nullable = false, length = 99)
    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    @Basic
    @Column(name = "title", nullable = false, length = 200)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "creator", nullable = false, length = 16)
    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    @Basic
    @Column(name = "location", nullable = false, length = 99)
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Basic
    @Column(name = "description", nullable = false, length = 2000)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
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

        if (eventId != null ? !eventId.equals(that.eventId) : that.eventId != null) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (creator != null ? !creator.equals(that.creator) : that.creator != null) return false;
        if (location != null ? !location.equals(that.location) : that.location != null) return false;
        if (description != null ? !description.equals(that.description) : that.description != null) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;
        if (skillsneeded != null ? !skillsneeded.equals(that.skillsneeded) : that.skillsneeded != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = eventId != null ? eventId.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (creator != null ? creator.hashCode() : 0);
        result = 31 * result + (location != null ? location.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (skillsneeded != null ? skillsneeded.hashCode() : 0);
        return result;
    }
}
