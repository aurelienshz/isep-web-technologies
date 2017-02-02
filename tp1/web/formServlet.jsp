<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
  <head>
    <meta charset="UTF-8">
    <title></title>
  </head>
  <body>

  <h1>Hello World !</h1>

  <form method="post">
    <label>
      <strong>First name:</strong>
      <input required type="text" name="firstName"/>
    </label>
    <br>
    <label>
      <strong>Last name:</strong>
      <input required type="text" name="lastName"/>
    </label>
    <br>
    <label>
      <strong>Birth date:</strong>
      <input required type="date" name="birth"/>
    </label>
    <br>
    <strong>Gender:</strong><br>
    <label>
      <input required type="radio" name="gender" value="M">
      Male
    </label>
    <label>
      <input required type="radio" name="gender" value="F">
      Female
    </label>
    <br>
    <input type="submit" />
  </form>

  <a href="/readCookies">See cookies values</a>

  <h2>Submitted form :</h2>
  <%
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String birth = request.getParameter("birth");
    String gender = request.getParameter("gender");

    if (firstName != null && lastName != null && birth != null && gender != null) {
      response.addCookie(new Cookie("firstName", firstName));
      response.addCookie(new Cookie("lastName", lastName));
      response.addCookie(new Cookie("gender", gender));
      response.addCookie(new Cookie("birth", birth));

      String inputBirthDate = request.getParameter("birth");
      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

      String formattedDate;
      try {
        Date dateStr = formatter.parse(inputBirthDate);
        formatter.applyPattern("dd/MM/yyyy");
        formattedDate = formatter.format(dateStr);
      } catch (ParseException e) {
        formattedDate = "Could not parse birth date";
      }
  %>
  <table>
    <thead>
    <tr>
      <td>First name</td>
      <td>Last name</td>
      <td>Birth date</td>
      <td>Gender</td>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><%= request.getParameter("firstName") %></td>
      <td><%= request.getParameter("lastName") %></td>
      <td><%= formattedDate %></td>
      <td><% out.print(request.getParameter("gender").equals("M") ? "Male" : "Female"); %></td>
    </tr>
    </tbody>
  </table>

  <% } else { out.print("<p>No form submitted yet</p>"); } %>

  </body>
</html>