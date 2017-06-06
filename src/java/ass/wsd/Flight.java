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
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Flight implements Serializable {

    @XmlElement(name = "flightID")
    private int flightID;
    @XmlElement(name = "departureDate")
    private String departureDate;
    @XmlElement(name = "returnDate")
    private String returnDate;
    @XmlElement(name = "price")
    private String price;
    @XmlElement(name = "numofSeats")
    private int numofSeats;
    @XmlElement(name = "origin")
    private String origin;
    @XmlElement(name = "destination")
    private String destination;
    @XmlElement(name = "description")
    private String description;
    @XmlElement(name = "flightType")
    private String flightType;

    public Flight(int flightID, String departureDate, String returnDate, String price, int numofSeats, String origin, String destination, String description, String flightType) {
        this.flightID = flightID;
        this.departureDate = departureDate;
        this.returnDate = returnDate;
        this.price = price;
        this.numofSeats = numofSeats;
        this.origin = origin;
        this.destination = destination;
        this.description = description;
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

    public int getNumofSeats() {
        return numofSeats;
    }

    public void setNumofSeats(int numofSeats) {
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
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    public String getFlightType() {
        return flightType;
    }

    public void setFlightType(String flightType) {
        this.flightType = flightType;
    }

    public Flight() {
    }

}
