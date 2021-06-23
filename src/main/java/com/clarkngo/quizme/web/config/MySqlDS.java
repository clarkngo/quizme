package com.clarkngo.quizme.web.config;

import com.mysql.cj.jdbc.MysqlDataSource;

import javax.sql.DataSource;
import java.sql.SQLException;

public class MySqlDS {

    private static DataSource ds;

    static {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setServerName("localhost");
        dataSource.setPortNumber(3306);
        dataSource.setDatabaseName("quizdb");
        dataSource.setUser("root");
        dataSource.setPassword("root");
        try {
            dataSource.setAllowMultiQueries(true);
            dataSource.setServerTimezone("EST");
            dataSource.setRewriteBatchedStatements(true); // To get the actual benefits of Batch Processing in MySQL
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ds = dataSource;
    }

    private MySqlDS() { }

    public static DataSource getDs() {
        return ds;
    }
}
