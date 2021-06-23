package com.clarkngo.quizme.web.dao;

import com.clarkngo.quizme.web.config.MySqlDS;
import com.clarkngo.quizme.web.domain.QuizType;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuizTypeDao {
    private DataSource ds;
    private Connection conn;


    public QuizTypeDao() {
        this.ds = MySqlDS.getDs();
    }

    public List<QuizType> getQuizTypes() {
        List<QuizType> quizTypes = new ArrayList<>();
        PreparedStatement ps = null;
        try {
            this.conn = ds.getConnection();
            ps = conn.prepareStatement("SELECT * FROM quiztype");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                QuizType qt = new QuizType();
                qt.setQuizTypeId(rs.getInt("Id"));
                qt.setName(rs.getString("Name"));
                qt.setDescription(rs.getString("Description"));
                qt.setImageUrl(rs.getString("ImageURL"));

                quizTypes.add(qt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return quizTypes;
    }

    public QuizType getQuizType(int id) {
        QuizType quizType = new QuizType();
        PreparedStatement ps = null;
        try {
            this.conn = ds.getConnection();
            ps = conn.prepareStatement("SELECT * FROM quiztype WHERE Id=?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                quizType.setQuizTypeId(rs.getInt("Id"));
                quizType.setName(rs.getString("Name"));
                quizType.setDescription(rs.getString("Description"));
                quizType.setImageUrl(rs.getString("ImageURL"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return quizType;
    }
}
