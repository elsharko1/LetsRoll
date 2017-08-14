package com.jrmn8.dao;

import com.jrmn8.AccessibilityEntity;
import com.jrmn8.EventsEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

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

    // Returns an ArrayList of events. If it returned an arraylist of AccessibilityEntities,wouldn't that be a bit useless? =]

    public static ArrayList<EventsEntity> get(String keyword, byte iswWheelchair, byte isBlind,
                                              byte isServiceDog, byte isFamily) {

        Session selectUsers = sessionFact.openSession();

        selectUsers.beginTransaction();

        // Criteria is used to create the query
        Criteria c = selectUsers.createCriteria(AccessibilityEntity.class);

        // results are returned as list and cast to an ArrayList
        return null;
        /*
        c.add(Restrictions.like(column, searchTerm));
        ArrayList<AccessibilityEntity> ev = (ArrayList<AccessibilityEntity>) c.list();

            return ev;*/
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
    // Also, come back and see if we need a specific get() requiring a userID and an eventID for a user to submit feedback.
// PCB
}