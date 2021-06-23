package com.clarkngo.quizme.web.temp;

import com.clarkngo.quizme.web.dao.QuizDao;
import com.clarkngo.quizme.web.domain.Quiz;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "QuizServlet2", value = "/quiz2")
public class QuizServlet2 extends HttpServlet {
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
            System.out.println(req.getParameter("choice"));
        }
        req.getRequestDispatcher("/quiz-screen").forward(req,res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(true);


    }
}
