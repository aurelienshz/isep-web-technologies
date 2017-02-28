<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%! private SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy"); %>
<%
    Date parsedDate;
    try {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        parsedDate = df.parse(request.getParameter("birth"));
    } catch (ParseException e) {
        parsedDate = null;
        e.printStackTrace();
    }%>

<jsp:useBean id="person" scope="page"  class="edu.isep.lab1.bean.Person">
    <jsp:setProperty name="person" property="firstName" param="firstName" />
    <jsp:setProperty name="person" property="lastName" param="lastName" />
    <jsp:setProperty name="person" property="birth" value="<%= parsedDate %>" />
    <jsp:setProperty name="person" property="gender" param="gender" />
</jsp:useBean>

<html>
<head>
    <title>Form Servlet - Using Bean</title>
</head>
<body>

<h1>Submitted data :</h1>
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
        <td><%= person.getFirstName() %></td>
        <td><%= person.getLastName() %></td>
        <td><%= dateFormatter.format(person.getBirth()) %></td>
        <td><%= person.getGender().equals("M") ? "Male" : "Female" %></td>
    </tr>
    </tbody>
</table>


</body>
</html>
