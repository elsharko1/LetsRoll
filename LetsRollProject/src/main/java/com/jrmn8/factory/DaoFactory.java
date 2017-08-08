package com.jrmn8.factory;

import com.jrmn8.dao.Dao;
import com.jrmn8.dao.HibernateDao;
import com.jrmn8.dao.JDBCDao;

public class DaoFactory {

    public static final int JDBC = 1;
    public static final int HIBERNATE = 2;

    public static Dao getInstance(int daoType) {

        Dao dao = null;

        switch (daoType) {
            case JDBC:
                dao = new JDBCDao();
                break;
            case HIBERNATE:
                dao = new HibernateDao();
                break;
            default:
                break;
        }
        return dao;
    }
}