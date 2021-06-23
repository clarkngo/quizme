package com.clarkngo.quizme.web.domain;

import java.util.List;

public class Quiz {
    private QuizType quizType;
    private List<Question> questions;
    private String questionsJson;

    public String getQuestionsJson() {
        return questionsJson;
    }

    public void setQuestionsJson(String questionsJson) {
        this.questionsJson = questionsJson;
    }

    public QuizType getQuizType() {
        return quizType;
    }

    public void setQuizType(QuizType quizType) {
        this.quizType = quizType;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    @Override
    public String toString() {
        return "Quiz{" +
                "quizType=" + quizType +
                ", questions=" + questions +
                '}';
    }
}
