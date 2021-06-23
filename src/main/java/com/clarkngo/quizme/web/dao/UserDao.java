package com.clarkngo.quizme.web.dao;

import com.clarkngo.quizme.web.config.MySqlDS;
import com.clarkngo.quizme.web.domain.User;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private DataSource ds;
    private Connection conn;

    public UserDao() {
        this.ds = MySqlDS.getDs();
    }

    private PreparedStatement ps;

    public boolean checkCredentials(String username, String password)
    {
        boolean st =false;
        try {
            this.conn = ds.getConnection();
            ps = conn.prepareStatement("SELECT * FROM user WHERE Email=? AND Password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs =ps.executeQuery();
            st = rs.next();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return st;
    }

    public User getUserId(String username) {
        User user = new User();
        try {
            this.conn = ds.getConnection();
            ps = conn.prepareStatement("SELECT * FROM user WHERE Email=?");
            ps.setString(1, username);
            ResultSet rs =ps.executeQuery();
            if (rs.next()) {
                user.setUserId(rs.getInt("Id"));
                user.setName(rs.getString("Name"));
                user.setEmail(rs.getString("Email"));
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean userExists(String username) {
        int result = 0;
        try {
            this.conn = ds.getConnection();
            ps = conn.prepareStatement("SELECT IF (EXISTS(SELECT * FROM user WHERE Email=?),1,0) AS userExists");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt("userExists");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return result == 1;
    }

    public void addUser(String username, String password) {
        try {
            this.conn = ds.getConnection();
            ps = conn.prepareStatement("INSERT INTO user (Email, Password) VALUES (?,?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
