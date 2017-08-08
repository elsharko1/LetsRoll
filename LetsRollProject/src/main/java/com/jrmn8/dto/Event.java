package com.jrmn8.dto;

public class Event extends EventsDto {
    private String accommodations;
    private String attending;

    public Event() {
    }

    public Event(String accommodations) {
        super();
        this.accommodations = accommodations;
    }

    public String getAccommodations() {
        return accommodations;
    }

    public void setAccommodations(String accommodations) {
        this.accommodations = accommodations;
    }

    public String getAttending() {
        return attending;
    }

    public void setAttending(String attending) {
        this.attending = attending;
    }
}