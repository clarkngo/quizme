package com.clarkngo.quizme.web.domain;

public class Choice {
    private int choiceId;
    private String description;
    private int isAnswer;

    public int getChoiceId() {
        return choiceId;
    }

    public void setChoiceId(int choiceId) {
        this.choiceId = choiceId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getIsAnswer() {
        return isAnswer;
    }

    public void setIsAnswer(int isAnswer) {
        this.isAnswer = isAnswer;
    }
    @Override
    public String toString() {
        return "Choice{" +
                "choiceId=" + choiceId +
                ", description='" + description + '\'' +
                ", isAnswer=" + isAnswer +
                '}';
    }
}
