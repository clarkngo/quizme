package com.clarkngo.quizme.web.controller;

import com.clarkngo.quizme.web.dao.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {

    private UserDao userDao;

    public void init() {this.userDao = new UserDao();}

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if(userDao.userExists(username)) {
            res.setContentType("text/html");
            PrintWriter writer = res.getWriter();
            req.getRequestDispatcher("/registerForm.jsp").include(req,res);

            writer.print(
                    "<div class='container'>" +
                            "<h2 style='color: red;'>Username exists. Please use a different username.</h2>" +
                            "</div>"
            );

            writer.close();
        } else {
            userDao.addUser(username, password);
            res.setContentType("text/html");
            PrintWriter writer = res.getWriter();
            req.getRequestDispatcher("/login").include(req,res);

            writer.print(
                    "<div class='container'>" +
                            "<h2 style='color: green;'>Successfully registered! Please login.</h2>" +
                            "</div>"
            );

            writer.close();
        }
    }
}
