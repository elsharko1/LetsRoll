package com.jrmn8.dao;

import com.jrmn8.UsersEntity;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import java.util.ArrayList;

//@SuppressWarnings("Duplicates")
public class UsersDao {

        static Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
        static SessionFactory sessionFact = cfg.buildSessionFactory();

        //CRUD -> Add, Get, Update, Delete

        /*  So this method will add a new User to the table. We utilize the primary key to add. However, we should
            only really need to add when a new user comes in through the registration page... so we should do some
            checks to validate if they're in the system or not. However, that should be in a validator, I suppose.
            Hence, this method will be used after validation has passed. Don't expect it to validate here!
            [userID must be unique from any existing ones.]
         */
        public static void add(UsersEntity u) {


            // creating the hibernate configuration and sessionfactory.
            Session session = sessionFact.openSession();
            Transaction tx = session.beginTransaction();

            ArrayList<UsersEntity> exist = (ArrayList<UsersEntity>) getExact(u.getUserID(), "userID");
            if (exist.size() == 0) session.saveOrUpdate(u);

            tx.commit();
            session.close();
        }

        // When would we need to get a user? Probably when we're given a userID to pull up their relevant details.
        // Would we need getLike for users? Search by name maybe? Heh.
        public static ArrayList<UsersEntity> getLike(String searchTerm, String column) {

            switch (column) {
                case "fullName":
                case "location":
                case "skills":
                    break;
                // If the column string isn't a list of predefined columns, bad inquiry.
                default:
                    return null;
            }
            Session selectUsers = sessionFact.openSession();

            selectUsers.beginTransaction();

            // Criteria is used to create the query
            Criteria c = selectUsers.createCriteria(UsersEntity.class);

            // results are returned as list and cast to an ArrayList

            c.add(Restrictions.like(column, "%" + searchTerm + "%"));
            ArrayList<UsersEntity> ev = (ArrayList<UsersEntity>) c.list();

            return ev;
        }

        // When we search userID or perhaps email!
        public static ArrayList<UsersEntity> getExact(String searchTerm, String column) {

            switch (column) {
                case "userID":
                case "email":
                    break;
                // If the column string isn't a list of predefined columns, bad inquiry.
                default:
                    return null;
            }
            Session selectUsers = sessionFact.openSession();

            selectUsers.beginTransaction();

            // Criteria is used to create the query
            Criteria c = selectUsers.createCriteria(UsersEntity.class);

            // results are returned as list and cast to an ArrayList

            c.add(Restrictions.like(column, searchTerm));
            ArrayList<UsersEntity> ev = (ArrayList<UsersEntity>) c.list();

            return ev;
        }

        //updates. We have to validate if the entity exists in the table.
        public static void update(UsersEntity e) {

            //code to validate entity here.

            Session session = sessionFact.openSession();
            Transaction tx = session.beginTransaction();

            session.update(e);

            tx.commit();
            session.close();

        }

        // Deleting a user? Well, you can, but you better also delete events linked to em, I suppose.
        // if needed will make a function later.
        // PCB

    }

