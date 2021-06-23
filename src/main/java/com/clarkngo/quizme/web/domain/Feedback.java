package com.clarkngo.quizme.web.domain;

public class Feedback {
    private int feedbackId;
    private int fkQuizTypeIdFeedback;
    private int rating;
    private String description;

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getFkQuizTypeIdFeedback() {
        return fkQuizTypeIdFeedback;
    }

    public void setFkQuizTypeIdFeedback(int fkQuizTypeIdFeedback) {
        this.fkQuizTypeIdFeedback = fkQuizTypeIdFeedback;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "feedbackId=" + feedbackId +
                ", fkQuizTypeIdFeedback=" + fkQuizTypeIdFeedback +
                ", rating=" + rating +
                ", description='" + description + '\'' +
                '}';
    }
}
