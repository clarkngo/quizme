package com.clarkngo.quizme.web.dao;

import com.clarkngo.quizme.web.config.MySqlDS;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class FeedbackDao {

    private DataSource ds;
    private Connection conn;

    public FeedbackDao() {
        this.ds = MySqlDS.getDs();
    }

    private PreparedStatement ps;

    public void addFeedback(int quizTypeId, int rating, String description) {
        try {
            this.conn = ds.getConnection();
            ps = conn.prepareStatement("INSERT INTO feedback (Fk_QuizTypeId_Feedback, Rating, Description) VALUES (?,?,?)");
            ps.setInt(1, quizTypeId);
            ps.setInt(2, rating);
            ps.setString(3, description);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
