package edu.isep.lab.mvc.controller;

import edu.isep.lab.mvc.model.data.Person;
import edu.isep.lab.mvc.model.form.PersonForm;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/person")
public class PersonController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Person person = new Person();
        req.setAttribute("person", person);
        req.getRequestDispatcher("personForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        PersonForm personForm = new PersonForm();
        Person person = personForm.handleRequest(req);

        req.setAttribute("person", person);
        req.setAttribute("personForm", personForm);

        if (personForm.isValid()) {
            req.getRequestDispatcher("confirmation.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("personForm.jsp").forward(req, resp);
        }

    }
}
