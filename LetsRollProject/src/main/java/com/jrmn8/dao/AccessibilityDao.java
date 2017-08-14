package com.jrmn8.dao;

import com.jrmn8.AccessibilityEntity;
import com.jrmn8.EventsEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
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
        // if all the values are literally 0
        if (isWheelchair+isBlind+isServiceDog+isFamily == 0) return EventDao.getLike(keyword);

        Session selectEvents = sessionFact.openSession();

        selectEvents.beginTransaction();

        // find list of valid events, pull a list, parse through the list and search through it?

        String hql = "FROM AccessibilityEntity E WHERE ";
        // time for some if statements. This is terribly inefficient!
        byte[] fields = {isWheelchair,isBlind,isServiceDog, isFamily};
        byte index = (byte) (isWheelchair+isBlind+isServiceDog+isFamily);
        String[] fieldnames = {"E.wheelchair", "E.blind", "E.servicedog", "E.family"};
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
        keyword = keyword.toLowerCase();
        for (AccessibilityEntity acc: ae) {
            EventsEntity e = EventDao.getExact(acc.getEventID(), "eventID").get(0);
            if(e.getTitle().toLowerCase().contains(keyword) || e.getDescription().toLowerCase().contains(keyword) ||
                    e.getLocation().toLowerCase().contains(keyword)) {
                ev.add(e);
            }
        }

        //Criteria c = selectEvents.createCriteria(AccessibilityEntity.class);

        // results are returned as list and cast to an ArrayList
        return ev;
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