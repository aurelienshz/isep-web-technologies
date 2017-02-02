<%@ page import="java.util.ArrayList" %>
<%@ page import="java.awt.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Items</title>
</head>
<body>
    <form method="post">
        <input type="text" name="item" />
        <input type="submit" />
    </form>

<%
    ArrayList<String> items = (ArrayList<String>) session.getAttribute("items");
    if (items != null) {

        out.println("<p>" + items.size() + " items inserted</p>");
        out.println("<ul>");
        for (String i: items) {
            out.println("<li>" + i + "</li>");
        }
        out.println("</ul>");
    }
%>
</body>
</html>
