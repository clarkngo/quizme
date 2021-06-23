package com.clarkngo.quizme.web.domain;

import java.util.List;

public class QuizJson {
    private QuizType quizType;
    private String questions;

    public QuizType getQuizType() {
        return quizType;
    }

    public void setQuizType(QuizType quizType) {
        this.quizType = quizType;
    }

    public String getQuestions() {
        return questions;
    }

    public void setQuestions(String questions) {
        this.questions = questions;
    }

}
