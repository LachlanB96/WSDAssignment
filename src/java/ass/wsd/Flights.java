/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

/**
 *
 * @author Peter Nguyen
 */
@XmlRootElement(name = "flights")
@XmlAccessorType(XmlAccessType.FIELD)
public class Flights implements Serializable {

    @XmlElement(name = "flight")
    private ArrayList<Flight> list = new ArrayList<Flight>();

    public ArrayList<Flight> getList() {
        return list;
    }

    public void addFlight(Flight flight) {
        list.add(flight);
    }

    public void removeFlight(Flight flight) {
        list.remove(flight);
    }
    
    public Flight getFlightID(int flightID) {
        for (Flight flight : list) {
            if (flight.getFlightID() == flightID) {
                return flight; // flightID found in flights.xml. Return this flight.
            }
        }
        return null; // No flight can be found for Flight ID.
    }
    
    public ArrayList<Flight> getFlightsTo(String destination) {
        ArrayList<Flight> flights = new ArrayList<Flight>();
        for (Flight flight : list) {
            if (flight.getDestination().toLowerCase().equals(destination)) {
                flights.add(flight);
            }
        }
        if (flights.isEmpty()) return null;
        return flights;
    }
    
    public int getListSize() {
        return list.size();
    }
}
