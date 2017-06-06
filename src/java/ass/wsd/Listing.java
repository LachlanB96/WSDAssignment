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
    private int id;
    @XmlElement(name = "flight1")
    private int flight1;
    @XmlElement(name = "fligh2")
    private int flight2;
    @XmlElement(name = "fligh3")
    private int flight3;
    @XmlElement(name = "fligh4")
    private int flight4;
    @XmlElement(name = "fligh5")
    private int flight5;

    public Listing(int id, int flight1, int flight2, int flight3, int flight4, int flight5) {
        this.id = id;
        this.flight1 = flight1;
        this.flight2 = flight2;
        this.flight3 = flight3;
        this.flight4 = flight4;
        this.flight5 = flight5;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFlight1() {
        return flight1;
    }

    public void setFlight1(int flight1) {
        this.flight1 = flight1;
    }

    public int getFlight2() {
        return flight2;
    }

    public void setFlight2(int flight2) {
        this.flight2 = flight2;
    }

    public int getFlight3() {
        return flight3;
    }

    public void setFlight3(int flight3) {
        this.flight3 = flight3;
    }

    public int getFlight4() {
        return flight4;
    }

    public void setFlight4(int flight4) {
        this.flight4 = flight4;
    }

    public int getFlight5() {
        return flight5;
    }

    public void setFlight5(int flight5) {
        this.flight5 = flight5;
    }

    public Listing() {
    }
}
