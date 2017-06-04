/*
 *
 */
package ass.wsd;

import java.io.*;
import javax.xml.bind.annotation.*;
import java.io.Serializable;

/**
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class User implements Serializable {

    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "password")
    private String password;
    @XmlElement(name = "dob")
    private String dob;
    @XmlElement(name = "privilege")
    private String privilege;
    @XmlElement(name = "id")
    private int ID;

    public User() {
    }

    public User(String name, String email, String password, String dob, int ID) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.privilege = "user";
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDOB() {
        return dob;
    }

    public void setDOB(String dob) {
        this.dob = dob;
    }

    public String getPrivilege() {
        return privilege;
    }

    public void setPrivelege(String privilege) {
        this.privilege = privilege;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }
}
