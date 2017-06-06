/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
public class Listing implements Serializable {

    @XmlElement(name = "id")
    private int ID;
    @XmlElement(name = "flightID")
    private int flightID;

    public Listing(int ID, int flightID) {
        this.ID = ID;
        this.flightID = flightID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getFlightID() {
        return flightID;
    }

    public void setFlightID(int flightID) {
        this.flightID = flightID;
    }


    public Listing() {
    }
}
