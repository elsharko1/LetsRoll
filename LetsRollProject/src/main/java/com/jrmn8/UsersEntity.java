package com.jrmn8;

import javax.persistence.*;

@Entity
@Table(name = "users", schema = "letsrolldb", catalog = "")
public class UsersEntity {
    private String userID;
    private String email;
    private String location;
    private String skills;
    private String fullName;

    @Id
    @Column(name = "userID", nullable = false, length = 50)
    public String getUserID() {
        return userID;
    }

    public void setUserID(String eventfulUserName) {
        this.userID = eventfulUserName;
    }

    @Basic
    @Column(name = "email", nullable = false, length = 255)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "location", nullable = false, length = 255)
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Basic
    @Column(name = "skills", nullable = false, length = 255)
    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    @Basic
    @Column(name = "fullName", nullable = false, length = 255)
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UsersEntity that = (UsersEntity) o;

        if (userID != null ? !userID.equals(that.userID) : that.userID != null)
            return false;
        if (email != null ? !email.equals(that.email) : that.email != null) return false;
        if (location != null ? !location.equals(that.location) : that.location != null) return false;
        if (skills != null ? !skills.equals(that.skills) : that.skills != null) return false;
        if (fullName != null ? !fullName.equals(that.fullName) : that.fullName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userID != null ? userID.hashCode() : 0;
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (location != null ? location.hashCode() : 0);
        result = 31 * result + (skills != null ? skills.hashCode() : 0);
        result = 31 * result + (fullName != null ? fullName.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return (getUserID() + ", " + getFullName());
    }
}
