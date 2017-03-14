package edu.isep.lab.mvc.model.data;

import edu.isep.lab.mvc.model.Gender;

import java.io.Serializable;
import java.util.Date;

public class Person implements Serializable {
    private String firstName;
    private String lastName;
    private Date BirthDate;
    private Gender gender;

    public Person() {
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getBirthDate() {
        return BirthDate;
    }

    public void setBirthDate(Date birthDate) {
        BirthDate = birthDate;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }
}
