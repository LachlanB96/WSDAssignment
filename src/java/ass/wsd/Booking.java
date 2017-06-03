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
public class Booking implements Serializable {

    @XmlElement(name = "id")
    private int id;
    @XmlElement(name = "flightID")
    private int flightID;
    @XmlElement(name = "bookingID")
    private int bookingID;
    @XmlElement(name = "origin")
    private String origin;
    @XmlElement(name = "destination")
    private String destination;
    @XmlElement(name = "flightType")
    private String flightType;
    @XmlElement(name = "departureDate")
    private String departureDate;
    @XmlElement(name = "returnDate")
    private String returnDate;
    @XmlElement(name = "description")
    private String description;

    public Booking(int id, int flightID, int bookingID, String origin, String destination, String flightType, String departureDate, String returnDate, String description) {
        this.id = id;
        this.flightID = flightID;
        this.bookingID = bookingID;
        this.origin = origin;
        this.destination = destination;
        this.flightType = flightType;
        this.departureDate = departureDate;
        this.returnDate = returnDate;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFlightID() {
        return flightID;
    }

    public void setFlightID(int flightID) {
        this.flightID = flightID;
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Booking() {
    }
}
