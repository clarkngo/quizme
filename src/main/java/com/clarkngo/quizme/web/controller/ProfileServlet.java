package com.clarkngo.quizme.web.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProfileServlet", value = "/profile")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        PrintWriter writer = resp.getWriter();

        HttpSession oldSession = req.getSession(false);
        if (oldSession == null) {
            req.getRequestDispatcher("/loginForm.jsp").include(req, resp);
            writer.print(
                    "<div class='container'>" +
                            "<h2 style='color: red;'>Unauthorized access, please login.</h2>" +
                            "</div>"
            );
        } else {
            String username = (String)oldSession.getAttribute("username");
            String password = (String)oldSession.getAttribute("password");
            req.getRequestDispatcher("/userProfile.jsp").include(req, resp);
            writer.println(String.format("<h2>Welcome Username: %s, Password: %s</h2>", username, password));
            writer.println(String.format("Session Id: %s", oldSession.getId()));
        }

        writer.close();
    }
}
