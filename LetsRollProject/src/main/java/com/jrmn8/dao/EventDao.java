package com.jrmn8.dao;

import com.jrmn8.EventsEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.HashMap;

public class EventDao {

    static Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
    static SessionFactory sessionFact = cfg.buildSessionFactory();

    //CRUD -> Add, Get, Update, Delete

    /*  So this method will add a new Event to the events table. Because the eventID is randomly generated,
        we do not need to worry about duplicates in the Primary Key.
     */
    public static void add(EventsEntity e) {


        // creating the hibernate configuration and sessionfactory.
        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();

        session.saveOrUpdate(e);

        tx.commit();
        session.close();
    }

    // When would we need to get an entire event? Parsing through the database with a keyword... Probably.
    // Searches Title, Description and Location to see if the searchTerm is in there.
    public static ArrayList<EventsEntity> getLike(String searchTerm) {

        // fix up EventDao.

        Session selectEvents = sessionFact.openSession();

        selectEvents.beginTransaction();

        // using HQL to basically join three criteria together.
        // in short it's just find where EventsEntity.title or location or description LIKE '%searchTerm%'

        String hql = "FROM EventsEntity E WHERE E.title LIKE '%" + searchTerm +
                "%' OR E.description LIKE '%" + searchTerm + "%' OR E.location LIKE '%" + searchTerm +
                "%'";
        Query query = selectEvents.createQuery(hql);
        ArrayList<EventsEntity> ev = (ArrayList<EventsEntity>) query.list();

        return ev;
    }

    // When we search exact eventID/Creator
    public static ArrayList<EventsEntity> getExact(String searchTerm, String column) {

        switch (column) {
            case "eventID":
            case "creator":
                break;
            // If the column string isn't a list of predefined columns, bad inquiry.
            default:
                return null;
        }
        Session selectUsers = sessionFact.openSession();

        selectUsers.beginTransaction();

        // Criteria is used to create the query
        Criteria c = selectUsers.createCriteria(EventsEntity.class);

        // results are returned as list and cast to an ArrayList

        c.add(Restrictions.like(column, searchTerm));
        ArrayList<EventsEntity> ev = (ArrayList<EventsEntity>) c.list();

        return ev;
    }


    public static boolean update(EventsEntity e) {
        try {
            Session session = sessionFact.openSession();
            Transaction tx = session.beginTransaction();

            session.update(e);

            tx.commit();
            session.close();

            return true;
        } catch (Exception exception) {
            return false;
        }

    }

    // No delete function yet, because I worry about being able to delete Events without criteria.
    // if needed will make a function later.
    // PCB

}
