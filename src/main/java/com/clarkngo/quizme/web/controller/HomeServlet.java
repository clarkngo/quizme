package com.clarkngo.quizme.web.controller;

import com.clarkngo.quizme.web.dao.QuizTypeDao;
import com.clarkngo.quizme.web.domain.QuizType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(true);

        QuizTypeDao dao = new QuizTypeDao();
        List<QuizType> qtList = dao.getQuizTypes();
        session.setAttribute("quizTypeList", qtList);
        req.getRequestDispatcher("/home-page").forward(req, res);
    }
}
