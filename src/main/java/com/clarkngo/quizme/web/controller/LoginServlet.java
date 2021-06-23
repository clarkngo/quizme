package com.clarkngo.quizme.web.controller;

import com.clarkngo.quizme.web.dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private UserDao userDao;

    public void init() {
        this.userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (username!=null && password!=null && userDao.checkCredentials(username, password)) {
            // get the old session
            HttpSession oldSession = req.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }

            // generate a new Session
            HttpSession newSession = req.getSession(true);
            newSession.setAttribute("username", username);
            newSession.setAttribute("password", password);

            // setting session to expire in 10 minutes
            newSession.setMaxInactiveInterval(10 * 60);
            res.sendRedirect(req.getContextPath() + "/home");
        } else {
            res.setContentType("text/html");
            PrintWriter writer = res.getWriter();
            req.getRequestDispatcher("/loginForm.jsp").include(req, res);

            writer.print(
                    "<div class='container'>" +
                            "<h2 style='color: red;'>Incorrect user name or password.</h2>" +
                            "</div>"
            );

            writer.close();
        }
    }
}
