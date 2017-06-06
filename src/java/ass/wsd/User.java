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
@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class User implements Serializable {

    private String name;
    private String email;
    private String password;
    private String dob;
    private String privilege;
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

    @XmlElement
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @XmlElement
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @XmlElement
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @XmlElement
    public String getDOB() {
        return dob;
    }

    public void setDOB(String dob) {
        this.dob = dob;
    }

    @XmlElement
    public String getPrivilege() {
        return privilege;
    }

    public void setPrivelege(String privilege) {
        this.privilege = privilege;
    }

    @XmlElement
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }
}
