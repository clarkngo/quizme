package com.clarkngo.quizme.web.dao;

import com.clarkngo.quizme.web.config.MySqlDS;
import com.clarkngo.quizme.web.domain.Choice;
import com.clarkngo.quizme.web.domain.Question;
import com.clarkngo.quizme.web.domain.Quiz;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuizDao {
    private DataSource ds;
    private Connection conn;

    public QuizDao() {
        this.ds = MySqlDS.getDs();
    }

    private PreparedStatement ps;
    public Quiz getQuiz(int id) {
        Quiz quiz = new Quiz();

        quiz.setQuizType(new QuizTypeDao().getQuizType(id));
        quiz.setQuestions(new QuestionDao().getTenRandomQuestions(id));
        for (int i=0; i < quiz.getQuestions().size(); i++) {
            int questionId = quiz.getQuestions().get(i).getQuestionId();
            quiz.getQuestions().get(i).setChoices(new ChoiceDao().getChoices(questionId));
        }
        return quiz;
    }
}
