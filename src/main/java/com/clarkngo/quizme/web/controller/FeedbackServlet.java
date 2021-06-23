package com.clarkngo.quizme.web.controller;

import com.clarkngo.quizme.web.dao.FeedbackDao;
import com.clarkngo.quizme.web.dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "FeedbackServlet", value = "/feedback")
public class FeedbackServlet extends HttpServlet {


    private FeedbackDao feedbackDao;

    public void init() {this.feedbackDao = new FeedbackDao();}

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int rating = Integer.parseInt(req.getParameter("rating"));
        String description = req.getParameter("description");
        int quizTypeId = Integer.parseInt(req.getParameter("quizTypeId"));
        System.out.println(rating);
        System.out.println(description);
        System.out.println(quizTypeId);
        feedbackDao.addFeedback(quizTypeId, rating, description);

        res.setContentType("text/html");
        PrintWriter writer = res.getWriter();
        writer.print(
                "<div class='container'>" +
                        "<h2 style='color: green;'>Successfully sent feedback! Thank you.</h2>" +
                        "</div>"
        );

        writer.close();
    }
}
