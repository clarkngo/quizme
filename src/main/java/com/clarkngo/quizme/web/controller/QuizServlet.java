package com.clarkngo.quizme.web.controller;

import com.clarkngo.quizme.web.dao.QuizDao;
import com.clarkngo.quizme.web.dao.QuizTypeDao;
import com.clarkngo.quizme.web.domain.Quiz;
import com.clarkngo.quizme.web.domain.QuizType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "QuizServlet", value = "/quiz")
public class QuizServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(true);

       // res.setHeader("Set-Cookie","JSESSIONID=" + session.getId());
        if (session.getAttribute("quiz") == null) {
            int id = Integer.parseInt(req.getParameter("quizTypeId"));
            int page = Integer.parseInt(req.getParameter("page"));
            QuizDao dao = new QuizDao();
            Quiz quiz = dao.getQuiz(id);
            session.setAttribute("quiz", quiz);
            session.setAttribute("page",1);
        } else {
            session.setAttribute("page", req.getParameter("page"));
            session.setAttribute("questionId", req.getParameter("questionId"));
            System.out.println(req.getParameter("questionId"));
        }
        req.getRequestDispatcher("/quiz-screen").forward(req,res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        System.out.println(req.getParameter("quizTypeId"));
        System.out.println(req.getParameter("page"));
        System.out.println(req.getParameter("questionId"));

    }
}
