/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd.rest;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import ass.wsd.*;
import java.util.ArrayList;

/**
 *
 * @author Kieran O'Brien
 */
@Path("/bookings")
public class bookingsService {
    
    @Context
    private ServletContext application;
    
    private BookingsApp getBookingsApp() throws JAXBException, IOException, Exception {
        // The web server can handle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        synchronized (application) {
            BookingsApp bookingsApp = (BookingsApp) application.getAttribute("bookingsApp");
            if (bookingsApp == null) {
                bookingsApp = new BookingsApp();
                bookingsApp.setFilePath(application.getRealPath("WEB-INF/bookings.xml"));
                application.setAttribute("bookingsApp", bookingsApp);
            }
            return bookingsApp;
        }
    }
    
    private FlightsApp getFlightsApp() throws JAXBException, IOException, Exception {
        // The web server can handle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        synchronized (application) {
            FlightsApp flightsApp = (FlightsApp) application.getAttribute("flightsApp");
            if (flightsApp == null) {
                flightsApp = new FlightsApp();
                flightsApp.setFilePath(application.getRealPath("WEB-INF/flights.xml"));
                application.setAttribute("flightsApp", flightsApp);
            }
            return flightsApp;
        }
    }
    
    private UsersApp getUsersApp() throws JAXBException, IOException, Exception {
        // The web server can handle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        synchronized (application) {
            UsersApp userApp = (UsersApp) application.getAttribute("userApp");
            if (userApp == null) {
                userApp = new UsersApp();
                userApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
                application.setAttribute("userApp", userApp);
            }
            return userApp;
        }
    }

    @Path("hello")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello World";
    }
    
    @Path("getBookings")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Bookings getBookings() throws IOException, Exception {
        return getBookingsApp().getBookings();
    }
    
    // IMPLEMENT GETTING A SINGLE BOOKING!!!
    
    @Path("getBookingsList")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Booking> getBookingsList() throws IOException, Exception {
        return getBookingsApp().getBookings().getList();
    }

    /**
     * only produces a single booking, WRONG!
     * 
    @Path("getBookingdUserID")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Booking getBookingsUserID(@QueryParam("id") int id) throws IOException, Exception {
        return getBookingsApp().getBookings().getUserID(id);
    }
    **/
    
    @Path("getBookingsUserID")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Booking> getBookingUserID(@QueryParam("id") int id) throws IOException, Exception {
        return getBookingsApp().getBookings().getBookingsUserID(id);
    }
    
    @Path("getBookingsUserEmail")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Booking> getBookingUserID(@QueryParam("email") String email) throws IOException, Exception {
        int id = getUsersApp().getUsers().getUsersID(email);
        if (id != 0) return getBookingsApp().getBookings().getBookingsUserID(id);
        return null;
    }
    
    /**
     *  Flight section 
     */
    
    @Path("getFlights")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Flights getFlights() throws IOException, Exception {
        return getFlightsApp().getFlights();
    }
    
    @Path("getFlight")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Flight getFlight(@QueryParam("id") int id) throws IOException, Exception {
        return getFlightsApp().getFlights().getFlightID(id);
    }
    
    @Path("getFlightsWithDestination")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Flight> getFlight(@QueryParam("destination") String destination) throws IOException, Exception {
        return getFlightsApp().getFlights().getFlightsTo(destination.toLowerCase());
    }
    
    @Path("getFlightsAmount")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getFlightsAmount() throws IOException, Exception {
        return "Amount of flights: " + getFlightsApp().getFlights().getListSize();
    }
    
    @Path("getFlightsStatus")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String getFlightsStatus(@QueryParam("id") int id) throws IOException, Exception {
        int max = getFlightsApp().getFlights().getMax(id);
        int amount = getBookingsApp().getBookings().isFull(id);
        return generateString(max, amount);
    }
    
    private String generateString(int max, int amount) {
        if (amount < max) return "There are currently " + amount + " out of " + max + " bookings taken on this flight" ;
        return "There are no more seats avaliable, all " + max + " are taken";
    }
    
    /**
     *  User section 
     */
    
    @Path("getUsers")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Users getUsers() throws IOException, Exception {
        return getUsersApp().getUsers();
    }
    
    @Path("getInfo")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public User findUser(@QueryParam("email") String email) throws JAXBException, IOException, Exception {
        return getUsersApp().getUsers().getUser(email);
    }
    
    @Path("getUserID")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public int getUserList(@QueryParam("email") String email) throws JAXBException, IOException, Exception {
        return getUsersApp().getUsers().getUserID(email);
    }

}
