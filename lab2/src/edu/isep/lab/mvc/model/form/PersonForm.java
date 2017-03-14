package edu.isep.lab.mvc.model.form;

import edu.isep.lab.mvc.exception.InvalidFormFieldIdentifierException;
import edu.isep.lab.mvc.model.Gender;
import edu.isep.lab.mvc.model.data.Person;
import edu.isep.lab.mvc.util.DateFormatUtils;

import javax.servlet.ServletRequest;
import java.text.ParseException;
import java.util.Date;

public class PersonForm {
    public static final String GENDER_FIELD_IDENTIFIER = "gender";
    public static final String FIRST_NAME_FIELD_IDENTIFIER = "firstName";
    public static final String LAST_NAME_FIELD_IDENTIFIER = "lastName";
    public static final String BIRTH_DATE_NAME_FIELD_IDENTIFIER = "birth";

    private Person person = new Person();
    private boolean isSubmitted;

    public PersonForm() {}

    public Person handleRequest(ServletRequest request) {
        isSubmitted = true;
        if (request.getParameter(GENDER_FIELD_IDENTIFIER) == null) {
            person.setGender(null);
        } else {
            try {
                Gender gender = this.parseGender(request.getParameter(GENDER_FIELD_IDENTIFIER));
                person.setGender(gender);
            } catch (ParseException e) {
                person.setGender(null);
            }
        }

        try {
            Date birth = DateFormatUtils.parseDateFromInputField(request.getParameter(BIRTH_DATE_NAME_FIELD_IDENTIFIER));
            person.setBirthDate(birth);
        } catch (ParseException e) {
            person.setBirthDate(null);
        }

        person.setFirstName(request.getParameter(FIRST_NAME_FIELD_IDENTIFIER));
        person.setLastName(request.getParameter(LAST_NAME_FIELD_IDENTIFIER));

        return person;
    }

    private Gender parseGender(String requestGender) throws ParseException {
        if (requestGender.toLowerCase().equals("m"))
            return Gender.MALE;
        if (requestGender.toLowerCase().equals("f"))
            return Gender.FEMALE;

        throw new ParseException("Could not read gender from submitted data", 0);
    }

    public boolean isSubmitted() {
        return isSubmitted;
    }

    public String getFieldError(String name) throws InvalidFormFieldIdentifierException {
        switch (name) {
            case GENDER_FIELD_IDENTIFIER:
                return "Please pick a gender";
            case FIRST_NAME_FIELD_IDENTIFIER:
                return "Please input your first name";
            case LAST_NAME_FIELD_IDENTIFIER:
                return "Please input your last name";
            case BIRTH_DATE_NAME_FIELD_IDENTIFIER:
                return "Please input your birth date";
            default:
                throw new InvalidFormFieldIdentifierException();
        }
    }

    public boolean isValid() {
        return person.getBirthDate() != null
                && person.getGender() != null
                && person.getLastName() != null
                && person.getFirstName() != null;
    }
}
