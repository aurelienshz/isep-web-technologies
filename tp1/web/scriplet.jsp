<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: aurelien
  Date: 28/02/17
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String remoteIP = request.getRemoteHost();
    Date now = new Date();
%>

<html>
<head>
    <title>JSP scriplet</title>
</head>
<body>
    <h1>Awesome JSP Scriplet</h1>
    <ul>
        <li><strong>Your IP : </strong><%= remoteIP %></li>
        <li><strong>Current time : </strong><%= now %></li>
    </ul>
</body>
</html>
