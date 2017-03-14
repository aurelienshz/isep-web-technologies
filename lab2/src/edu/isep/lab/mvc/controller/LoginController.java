package edu.isep.lab.mvc.controller;

import edu.isep.lab.mvc.model.data.Person;
import edu.isep.lab.mvc.model.form.PersonForm;
import sun.security.provider.certpath.OCSPResponse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final String VALID_LOGIN = "admin";
    private static final String VALID_PASSWORD = "test";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.html").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        System.out.println(req.getParameter("login"));
        System.out.println(req.getParameter("password"));

        // TODO validate login and pass from DB instead of doing this :
        if (req.getParameter("login").equals(VALID_LOGIN) && req.getParameter("password").equals(VALID_PASSWORD)) {
            resp.setStatus(HttpServletResponse.SC_OK);
        } else {
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        }
    }
}
