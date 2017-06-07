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
@XmlRootElement(name = "bookings")
@XmlAccessorType(XmlAccessType.FIELD)
public class Bookings implements Serializable {

    @XmlElement(name = "booking")
    private ArrayList<Booking> list = new ArrayList<Booking>();

    public ArrayList<Booking> getList() {
        return list;
    }

    public void addBooking(Booking booking) {
        list.add(booking);
    }

    public void removeBooking(Booking booking) {
        list.remove(booking);
    }
    
    public Booking getUserID(int ID) {
        for (Booking booking : list) {
            if (booking.getId() == ID) {
                return booking; // User ID found in bookings.xml. Return this booking.
            }
        }
        return null; // No booking can be found for User ID.
    }
    
    public ArrayList<Booking> getBookingsUserID(int id) {
        ArrayList<Booking> bookings = new ArrayList<>();
        for (Booking booking : list) {
            if (booking.getId() == id) {
                bookings.add(booking);
            }
        }
        if (bookings.isEmpty()) return null;
        return bookings;
    }
    
    public int isFull(int id) {
        int count = 0;
        for (Booking booking : list) {
            if (booking.getFlightID()== id) {
                count++;
            }
        }
        return count;
    }
    
}
