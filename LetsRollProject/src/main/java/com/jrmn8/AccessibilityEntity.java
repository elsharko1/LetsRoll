package com.jrmn8;

import javax.persistence.*;

@Entity
@Table(name = "accessibility", schema = "letsrolldb", catalog = "")
public class AccessibilityEntity {
    private String eventId;
    private byte wheelchair;
    private byte family;
    private byte servicedog;
    private byte blind;

    @Id
    @Column(name = "eventID", nullable = false, length = 99)
    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    @Basic
    @Column(name = "wheelchair", nullable = false)
    public byte getWheelchair() {
        return wheelchair;
    }

    public void setWheelchair(byte wheelchair) {
        this.wheelchair = wheelchair;
    }

    @Basic
    @Column(name = "family", nullable = false)
    public byte getFamily() {
        return family;
    }

    public void setFamily(byte family) {
        this.family = family;
    }

    @Basic
    @Column(name = "servicedog", nullable = false)
    public byte getServicedog() {
        return servicedog;
    }

    public void setServicedog(byte servicedog) {
        this.servicedog = servicedog;
    }

    @Basic
    @Column(name = "blind", nullable = false)
    public byte getBlind() {
        return blind;
    }

    public void setBlind(byte blind) {
        this.blind = blind;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AccessibilityEntity that = (AccessibilityEntity) o;

        if (wheelchair != that.wheelchair) return false;
        if (family != that.family) return false;
        if (servicedog != that.servicedog) return false;
        if (blind != that.blind) return false;
        if (eventId != null ? !eventId.equals(that.eventId) : that.eventId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = eventId != null ? eventId.hashCode() : 0;
        result = 31 * result + (int) wheelchair;
        result = 31 * result + (int) family;
        result = 31 * result + (int) servicedog;
        result = 31 * result + (int) blind;
        return result;
    }
}
