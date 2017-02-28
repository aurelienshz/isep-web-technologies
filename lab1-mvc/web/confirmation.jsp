<%@ page import="edu.isep.lab.mvc.model.Gender" %>
<%@ page import="edu.isep.lab.mvc.util.DateFormatUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="person" scope="request" type="edu.isep.lab.mvc.model.data.Person" />

<html>
<head>
  <title>Form bean JSP</title>
</head>
<body>

<h1>Baked beans - Success !</h1>
<p>The form was successfully submitted and validated !</p>

<ul>
  <li><strong>First name :</strong> ${person.firstName}</li>
  <li><strong>Last name :</strong> ${person.lastName}</li>
  <li><strong>Birth date :</strong> <%= DateFormatUtils.formatDateForHumanDisplay(person.getBirthDate()) %></li>
  <li><strong>Gender :</strong> <%= person.getGender() == Gender.MALE ? "Male" : "Female" %></li>
</ul>

</body>
</html>