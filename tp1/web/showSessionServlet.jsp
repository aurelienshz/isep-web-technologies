<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
    <title>Session servlet</title>
</head>
<body>
<%
    // New user :
    String message = "Hello, new user !";

    // Handle already visited status :
    if (session.getAttribute("visited") != null && (boolean) session.getAttribute("visited")) {
        message = "Hello, returning user !";
    }

    // Handle form submission :
    String name = request.getParameter("name");
    String birth = request.getParameter("birth");
    if (name != null && birth != null) {
        session.setAttribute("name", name);
        session.setAttribute("birth", birth);
    }

    // Handle user who has filled in her details :
    if (session.getAttribute("name") != null && session.getAttribute("birth") != null) {
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String inputBirthDate = (String) session.getAttribute("birth");
        LocalDate birthdayDate = LocalDate.parse(inputBirthDate, dateTimeFormatter);

        LocalDate now = LocalDate.now();
        while(now.isAfter(birthdayDate)) {
            birthdayDate = birthdayDate.plusYears(1);
        }

        long daysToBirthday = now.until(birthdayDate, ChronoUnit.DAYS);
        message = "Hello, " + session.getAttribute("name") + ". Your birthday is in " + daysToBirthday + " days";
    }

    session.setAttribute("visited", true);
%>

<h3><%= message %></h3>

<form method="post">
    <input type="text" name="name" />
    <input type="date" name="birth" />
    <input type="submit" />
</form>

</body>
</html>
