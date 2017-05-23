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
public class Flights implements Serializable {

    @XmlElement(name = "flightID")
    private int flightID;
    @XmlElement(name = "departureDate")
    private String departureDate;
    @XmlElement(name = "returnDate")
    private String returnDate;
    @XmlElement(name = "price")
    private String price;
    @XmlElement(name = "numofSeats")
    private String numofSeats;
    @XmlElement(name = "origin")
    private String origin;
    @XmlElement(name = "destination")
    private String destination;
    @XmlElement(name = "flightType")
    private String flightType;

    public Flights(int flightID, String departureDate, String returnDate, String price, String numofSeats, String origin, String destination, String flightType) {
        this.flightID = flightID;
        this.departureDate = departureDate;
        this.returnDate = returnDate;
        this.price = price;
        this.numofSeats = numofSeats;
        this.origin = origin;
        this.destination = destination;
        this.flightType = flightType;
    }

    public int getFlightID() {
        return flightID;
    }

    public void setFlightID(int flightID) {
        this.flightID = flightID;
    }

    public String getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(String departureDate) {
        this.departureDate = departureDate;
    }

    public String getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(String returnDate) {
        this.returnDate = returnDate;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getNumofSeats() {
        return numofSeats;
    }

    public void setNumofSeats(String numofSeats) {
        this.numofSeats = numofSeats;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getFlightType() {
        return flightType;
    }

    public void setFlightType(String flightType) {
        this.flightType = flightType;
    }

    public Flights() {
    }

}
