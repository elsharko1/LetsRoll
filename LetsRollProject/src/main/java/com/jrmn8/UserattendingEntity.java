package com.jrmn8;

import javax.persistence.*;

@Entity
@Table(name = "userattending", schema = "letsrolldb", catalog = "")
public class UserattendingEntity {
    private String eventfulUserName;
    private String eventId;
    private byte isVolunteer;
    private String feedback;

    @Id
    @Column(name = "eventfulUserName", nullable = false, length = 16)
    public String getEventfulUserName() {
        return eventfulUserName;
    }

    public void setEventfulUserName(String eventfulUserName) {
        this.eventfulUserName = eventfulUserName;
    }

    @Basic
    @Column(name = "eventID", nullable = false, length = 99)
    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    @Basic
    @Column(name = "isVolunteer", nullable = false)
    public byte getIsVolunteer() {
        return isVolunteer;
    }

    public void setIsVolunteer(byte isVolunteer) {
        this.isVolunteer = isVolunteer;
    }

    @Basic
    @Column(name = "feedback", nullable = true, length = 2000)
    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserattendingEntity that = (UserattendingEntity) o;

        if (isVolunteer != that.isVolunteer) return false;
        if (eventfulUserName != null ? !eventfulUserName.equals(that.eventfulUserName) : that.eventfulUserName != null)
            return false;
        if (eventId != null ? !eventId.equals(that.eventId) : that.eventId != null) return false;
        if (feedback != null ? !feedback.equals(that.feedback) : that.feedback != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = eventfulUserName != null ? eventfulUserName.hashCode() : 0;
        result = 31 * result + (eventId != null ? eventId.hashCode() : 0);
        result = 31 * result + (int) isVolunteer;
        result = 31 * result + (feedback != null ? feedback.hashCode() : 0);
        return result;
    }
}
