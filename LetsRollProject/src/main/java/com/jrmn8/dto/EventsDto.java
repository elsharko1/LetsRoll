package com.jrmn8.dto;

import java.util.Date;

public abstract class EventsDto {
    private String id;
    private String url;
    private String title;
    private String description;
    private String performers;
    private String start_time;
    private String venue_name;
    private String venue_address;
    private String city_name;
    private String postal_code;
    private String region_name;
    private String venue_url;
    private String venue_display;
    private String venue_id;
    private String going_count;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPerformers() {
        return performers;
    }

    public void setPerformers(String performers) {
        this.performers = performers;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getVenue_name() {
        return venue_name;
    }

    public void setVenue_name(String venue_name) {
        this.venue_name = venue_name;
    }

    public String getVenue_address() {
        return venue_address;
    }

    public void setVenue_address(String venue_address) {
        this.venue_address = venue_address;
    }

    public String getCity_name() {
        return city_name;
    }

    public void setCity_name(String city_name) {
        this.city_name = city_name;
    }

    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }

    public String getRegion_name() {
        return region_name;
    }

    public void setRegion_name(String region_name) {
        this.region_name = region_name;
    }

    public String getVenue_url() {
        return venue_url;
    }

    public void setVenue_url(String venue_url) {
        this.venue_url = venue_url;
    }

    public String getVenue_display() {
        return venue_display;
    }

    public void setVenue_display(String venue_display) {
        this.venue_display = venue_display;
    }

    public String getVenue_id() {
        return venue_id;
    }

    public void setVenue_id(String venue_id) {
        this.venue_id = venue_id;
    }

    public String getGoing_count() {
        return going_count;
    }

    public void setGoing_count(String going_count) {
        this.going_count = going_count;
    }
}