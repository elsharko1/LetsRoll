package com.jrmn8.dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Dao {
    static Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
    static SessionFactory sessionFact = cfg.buildSessionFactory();

    static SessionFactory sessionReset() {
        return sessionFact;
    }
}
