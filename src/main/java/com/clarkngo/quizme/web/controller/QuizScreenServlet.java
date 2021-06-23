package com.clarkngo.quizme.web.controller;

import com.clarkngo.quizme.web.dao.QuizTypeDao;
import com.clarkngo.quizme.web.domain.QuizType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "QuizScreenServlet", value = "/quiz-screen")
public class QuizScreenServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher("/quizScreen.jsp").forward(req,res);
    }
}
