package com.clarkngo.quizme.web.domain;

public class QuestionChoice {
    private int questionId;
    private String questionDescription;
    private int choiceId;
    private String choiceDescription;
    private int choiceIsAnswer;

    public int getChoiceIsAnswer() {
        return choiceIsAnswer;
    }

    public int getIsSelected() {
        return isSelected;
    }

    public void setIsSelected(int isSelected) {
        this.isSelected = isSelected;
    }

    private int isSelected;

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getQuestionDescription() {
        return questionDescription;
    }

    public void setQuestionDescription(String questionDescription) {
        this.questionDescription = questionDescription;
    }

    public int getChoiceId() {
        return choiceId;
    }

    public void setChoiceId(int choiceId) {
        this.choiceId = choiceId;
    }

    public String getChoiceDescription() {
        return choiceDescription;
    }

    public void setChoiceDescription(String choiceDescription) {
        this.choiceDescription = choiceDescription;
    }

    public int getChoiceIsAnswer(int choiceIsAnswer) {
        return this.choiceIsAnswer;
    }

    public void setChoiceIsAnswer(int choiceIsAnswer) {
        this.choiceIsAnswer = choiceIsAnswer;
    }
}
