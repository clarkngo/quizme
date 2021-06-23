package com.clarkngo.quizme.web.dao;

import com.clarkngo.quizme.web.config.MySqlDS;
import com.clarkngo.quizme.web.domain.Choice;
import com.clarkngo.quizme.web.domain.Question;
import com.clarkngo.quizme.web.domain.QuizType;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDao {

    private DataSource ds;
    private Connection conn;


    public QuestionDao() {
        this.ds = MySqlDS.getDs();
    }

    public List<Question> getQuestions(int id) {
        List<Question> questions = new ArrayList<>();
        PreparedStatement ps = null;
        try {
            this.conn = ds.getConnection();
            ps = conn.prepareStatement("SELECT qu.Id AS QuestionId, qu.Description AS QuestionDescription FROM quiztype AS qt INNER JOIN question AS qu ON qt.Id=Fk_QuizTypeId_Question WHERE qt.Id=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question qu = new Question();
                qu.setQuestionId(rs.getInt("QuestionId"));
                qu.setDescription(rs.getString("QuestionDescription"));
                questions.add(qu);
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
        return questions;
    }

    public List<Question> getTenRandomQuestions(int id) {
        List<Question> questions = new ArrayList<>();
        PreparedStatement ps = null;
        try {
            this.conn = ds.getConnection();
            ps = conn.prepareStatement("" +
                    "SELECT qu.Id AS QuestionId, qu.Description AS QuestionDescription " +
                    "FROM quiztype AS qt INNER JOIN question AS qu ON qt.Id=Fk_QuizTypeId_Question " +
                    "WHERE qt.Id=? " +
                    "ORDER BY RAND() LIMIT 10");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            int count = 1;
            while (rs.next()) {
                /*
                Question qu = new Question();
                qu.setQuestionId(rs.getInt("QuestionId"));
                qu.setDescription(rs.getString("QuestionDescription"));
                qu.setIsSelected(0);

                List<Choice> choices = new ChoiceDao().getChoices(rs.getInt("QuestionId"));
                qu.setChoices(choices);
                questions.add(qu);
                */
                Question qu = new Question();
                qu.setQuestionId(rs.getInt("QuestionId"));
                qu.setId(count);
                qu.setQuestion(rs.getString("QuestionDescription"));
                List<Choice> choices = new ChoiceDao().getChoices(rs.getInt("QuestionId"));
                for (int i = 0; i <choices.size(); i++) {
                    if (i == 0) qu.getOptions().get(0).replace("a", choices.get(i).getDescription());
                    if (i == 1) qu.getOptions().get(0).replace("b", choices.get(i).getDescription());
                    if (i == 2) qu.getOptions().get(0).replace("c", choices.get(i).getDescription());
                    if (i == 3) qu.getOptions().get(0).replace("d", choices.get(i).getDescription());
                    if (choices.get(i).getIsAnswer() == 1) qu.setAnswer(choices.get(i).getDescription());
                }
                questions.add(qu);
                count++;
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
        return questions;
    }

}
