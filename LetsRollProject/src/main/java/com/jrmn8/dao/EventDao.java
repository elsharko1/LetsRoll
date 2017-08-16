package com.jrmn8.dao;

import com.jrmn8.EventsEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import java.util.ArrayList;

//Event CRUD -> Add, Get, Update, Delete
public class EventDao {

    /*
    * Variables we will need to run hibernate.
    * Configuration utilizes our hibernate.cfg.xml (shows where the mapping of entities are,
    * the entities are DTO's)
    * Entities are Data transfer Objects that hold the data being transferred in and out of the database
    * SessionFactory object generates session objects to use as we need them
    */
    static Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
    static SessionFactory sessionFact = cfg.buildSessionFactory();

    /*  So this method will add a new Event to the events table. Because the eventID is randomly generated,
        we do not need to worry about duplicates in the Primary Key.
     */
    public static void add(EventsEntity e) {

        /**
         * Creating a session and a transaction object that will allow us to save or update
         * an event entity
         */
        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();

        /**
         * save or updates an event entity into our database
         */
        session.saveOrUpdate(e);

        /**
         * commit and close the session. Without this it will not save to our database
         */
        tx.commit();
        session.close();
    }


    /**
     * Searches Title, Description and Location to see if the searchTerm is in there.
      */
    public static ArrayList<EventsEntity> getLike(String searchTerm) {

        Session selectEvents = sessionFact.openSession();

        selectEvents.beginTransaction();


        //using HQL to basically join three criteria together.
        //HQL - Hibernate Query Language, used here because it's more flexible.
        //in short it's just find where EventsEntity.title or location or description LIKE '%searchTerm%'

        String hql = "FROM EventsEntity E WHERE E.title LIKE '%" + searchTerm +
                "%' OR E.description LIKE '%" + searchTerm + "%' OR E.location LIKE '%" + searchTerm +
                "%'";


        //Creates a query result based on the hql string above and then uses it immediately after

        Query query = selectEvents.createQuery(hql);
        ArrayList<EventsEntity> ev = (ArrayList<EventsEntity>) query.list();

        //returns trhe array list above
        return ev;
    }

    /**
     * When we search for the exact eventID/Creator
     * @param searchTerm - the field value we're looking for
     * @param column - the column that we're searching the field in
     * @return - An arrayList of event entities
     */
    public static ArrayList<EventsEntity> getExact(String searchTerm, String column) {

        //If the column you're searching for exists, proceed
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
        //indicate which entity class to create the criteria on
        Criteria c = selectUsers.createCriteria(EventsEntity.class);

        // results are returned as list and cast to an ArrayList
        //applies a restriction that checks for our exact search term
        //the 2 ways we're searching are HQL and restrictions
        //restrict by column and restrict by search term
        //any event that meets this criteria gets added to the array list
        c.add(Restrictions.like(column, searchTerm));
        ArrayList<EventsEntity> ev = (ArrayList<EventsEntity>) c.list();

        return ev;
    }


    /**
     * Literally updates an event entity
     * @param e - an event entity object
     * @return - returns true if it worked, false otherwise
     */
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

    // No delete function yet to prevent being able to delete Eventful production data
    // if needed will make a function later.
    // PCB
}
