package com.jrmn8.dao;

import com.jrmn8.AccessibilityEntity;
import com.jrmn8.EventsEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import java.util.ArrayList;

@SuppressWarnings("Duplicates")
public class AccessibilityDao {

    static Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
    static SessionFactory sessionFact = cfg.buildSessionFactory();

    //CRUD -> Add, Get, Update, Delete

    /*  Accessbility should be pretty straightforward I suppose.
     */
    public static void add(AccessibilityEntity a) {


        // creating the hibernate configuration and sessionfactory.
        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();

        session.saveOrUpdate(a);

        tx.commit();
        session.close();
    }

    // AccessbilityEntity, when searching, really only has one use case: Is the selected field a positive or not?
    // for example, wheelchairfriendly '1' or '0'? As such, we can just use a get, but our parameters will be different.
    // additionally, because only the events made on our end will have accessibilityentity aspects, we really shouldn't need
    // to worry about Eventful's events.

    // Returns an ArrayList of events. If it returned an arraylist of AccessibilityEntities, wouldn't that be a bit useless? =]
    // Need validation for this though. If a user does not click any accessibility options, direct to EventDao then!

    public static ArrayList<EventsEntity> get(String keyword, byte isWheelchair, byte isBlind,
                                              byte isServiceDog, byte isFamily) {
        // if all the values are literally 0, use eventsDao's search option, the getLike.
        if (isWheelchair+isBlind+isServiceDog+isFamily == 0) return EventDao.getLike(keyword);

        Session selectEvents = sessionFact.openSession();

        selectEvents.beginTransaction();

        // find list of valid events, pull a list, parse through the list and search through it
        String hql = "FROM AccessibilityEntity E WHERE ";
        //these are bytes because 0 is NO and 1 is YES in our database
        byte[] fields = {isWheelchair,isBlind,isServiceDog, isFamily};
        byte index = (byte) (isWheelchair+isBlind+isServiceDog+isFamily);
        String[] fieldnames = {"E.wheelchair", "E.blind", "E.servicedog", "E.family"};
        /**
         * We start off with an external counter, x, that will increment every time we go through the
         * fields array. If the byte at fields [x] is 1, we access fieldnames and append the String to
         * our HQL statement. In short, it's generating one wholesome HQL statement to search for the
         * accessibility parameters that are equal to 1. Because when they are 1, we want to search for them.
         */
        int x = 0;
        for (int i = 0; i < index; x++){
            if(fields[x] == 1) {
                hql = hql + fieldnames[x] + "= 1 ";
                i++;
                if (i != index) hql = hql + "OR ";
            }
        }

        Query query = selectEvents.createQuery(hql);
        ArrayList<AccessibilityEntity> ae = (ArrayList<AccessibilityEntity>) query.list();
        ArrayList<EventsEntity> ev = new ArrayList<EventsEntity>();
        //code below emulates "like" in SQL/HQL language
        keyword = keyword.toLowerCase();
        for (AccessibilityEntity acc: ae) {
            EventsEntity e = EventDao.getExact(acc.getEventID(), "eventID").get(0);
            //.contains is case sensitive so we turn everything to lowercase.
            if(e.getTitle().toLowerCase().contains(keyword) || e.getDescription().toLowerCase().contains(keyword) ||
                    e.getLocation().toLowerCase().contains(keyword)) {
                //adds it to our events entity array list
                ev.add(e);
            }
        }
        // returns the list
        return ev;
    }

    public static ArrayList<AccessibilityEntity> getExact(String searchTerm, String column) {

        switch (column) {
            case "eventID":
                // If the column string isn't a list of predefined columns, bad inquiry.
                break;
            default:
                return null;
        }
        Session selectAccessibility = sessionFact.openSession();

        selectAccessibility.beginTransaction();

        // Criteria is used to create the query
        Criteria c = selectAccessibility.createCriteria(AccessibilityEntity.class);

        // results are returned as list and cast to an ArrayList

        c.add(Restrictions.like(column, searchTerm));
        ArrayList<AccessibilityEntity> av = (ArrayList<AccessibilityEntity>) c.list();

        return av;
    }

    // updates. The userattending should exist in the database, so we should be ok in terms of validation.
    // really only should be used when a user gives feedback.

    public static void update(AccessibilityEntity a) {

        //code to validate entity here.

        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();

        session.update(a);

        tx.commit();
        session.close();

    }

// Deleting a userattending? Maybe if a user cancels attending an event, or a coordinator cancels an event.
// if needed will make a function later.
// PCB
}