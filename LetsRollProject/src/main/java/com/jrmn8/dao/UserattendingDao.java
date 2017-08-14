package com.jrmn8.dao;

import com.jrmn8.UserattendingEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("Duplicates")
public class UserattendingDao {

    static Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
    static SessionFactory sessionFact = cfg.buildSessionFactory();

    //CRUD -> Add, Get, Update, Delete

    /*  So this method will add a new UserattendingEntity to the table. Save or update allows us to ignore whether
        they're already in the table, and basically updates if they changed their preference. IE if they clicked volunteer
        instead of solely attend. Do we need to validate? Nah.
     */
    public static void add(UserattendingEntity u) {


        // creating the hibernate configuration and sessionfactory.
        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();

        session.saveOrUpdate(u);

        tx.commit();
        session.close();
    }

    // UserAttending should never need a getLike. We're searching for either userID or eventID, based on whether
    // we want to return a list of users attending a specific event, or a user's specific events, hence the exact search.
    // Additionally, we should implement a validation that a creator can never join their own event as an attendee.

    public static ArrayList<UserattendingEntity> getExact(String searchTerm, String column) {

        switch (column) {
            case "userID":
            case "eventID":
            case "isVolunteer":
                break;
            // If the column string isn't a list of predefined columns, bad inquiry.
            default:
                return null;
        }
        Session selectUserAttending = sessionFact.openSession();

        selectUserAttending.beginTransaction();

        // Criteria is used to create the query
        ArrayList<UserattendingEntity> ev = null;

        // results are returned as list and cast to an ArrayList
        // is volunteer is a tinyint that is supposed to act as a boolean, hence hibernate querying.
        // does this work..? The answer's yes.
        if (column.equals("isVolunteer")) {
            String hql = "FROM UserattendingEntity E WHERE E.isVolunteer = " + searchTerm;
            Query query = selectUserAttending.createQuery(hql);
            ev = (ArrayList<UserattendingEntity>) query.list();
        }
        // if just a string criteria to search, we can just use hibernate criterias. Keep it simple.
        else {
            Criteria c = selectUserAttending.createCriteria(UserattendingEntity.class);
            c.add(Restrictions.like(column, searchTerm));
            ev = (ArrayList<UserattendingEntity>) c.list();
        }
        return ev;
    }

    // updates. The userattending should exist in the database, so we should be ok in terms of validation.
    // really only should be used when a user gives feedback.

    public static void update(UserattendingEntity e) {

        //code to validate entity here.

        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();

        session.update(e);

        tx.commit();
        session.close();

    }

    // Deleting a userattending? Maybe if a user cancels attending an event, or a coordinator cancels an event.
    // if needed will make a function later.
    // PCB

}
