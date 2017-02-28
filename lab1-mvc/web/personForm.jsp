<%@ page import="edu.isep.lab.mvc.model.Gender" %>
<%@ page import="edu.isep.lab.mvc.model.form.PersonForm" %>
<%@ page import="edu.isep.lab.mvc.util.DateFormatUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="person" scope="request" type="edu.isep.lab.mvc.model.data.Person" />

<html>
<head>
  <title>Form bean JSP</title>
</head>
<body>

<h1>Baked beans</h1>
<p>This page's form sends the request to a servlet that acts as a controller : it handles
  the request to hydrate a bean (through the PersonForm::handleRequest class).
  In case of failure to fill the form correctly, it redirects the user to this page.
  If the form is correctly filled in, it redirects the user to a summary page, choosing which
  page to show according to the birth year of the user.
</p>

<form method="post" action="/person">
  <div>
    <label>
      First name
      <input type="text" name="<%= PersonForm.FIRST_NAME_FIELD_IDENTIFIER %>" value="${person.firstName}"/>
    </label>
  </div>
  <div>
    <label>
      Last name
      <input type="text" name="<%= PersonForm.LAST_NAME_FIELD_IDENTIFIER %>" value="${person.lastName}"/>
    </label>
  </div>
  <div>
    <label>
      Birth date
      <input type="date" name="<%= PersonForm.BIRTH_DATE_NAME_FIELD_IDENTIFIER %>" value="<%= person.getBirthDate() != null ? DateFormatUtils.formatDateForValueAttribute(person.getBirthDate()) : "" %>"/>
    </label>
  </div>
  <div>
    <label>Gender</label>
    <label><input type="radio" name="<%= PersonForm.GENDER_FIELD_IDENTIFIER %>" value="m" <%= person.getGender() == Gender.MALE ? "checked" : "" %>/> Male</label>
    <label><input type="radio" name="<%= PersonForm.GENDER_FIELD_IDENTIFIER %>" value="f" <%= person.getGender() == Gender.FEMALE ? "checked" : "" %>/> Female</label>
  </div>
  <input type="submit" />
</form>

</body>
</html>