/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd.soap;

import ass.wsd.Booking;
import ass.wsd.Bookings;
import ass.wsd.BookingsApp;
import ass.wsd.Flight;
import ass.wsd.Flights;
import ass.wsd.FlightsApp;
import ass.wsd.User;
import ass.wsd.Users;
import ass.wsd.UsersApp;
import com.sun.javafx.scene.web.Debugger;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.servlet.ServletContext;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

/**
 *
 * @author lachlan
 */
@WebService(serviceName = "ModifyBookingApp")
public class ModifyBookingApp {

    @Resource
    private WebServiceContext context;

    @WebMethod
    public User login(String username, String password) {

        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        UsersApp app = (UsersApp) application.getAttribute("UsersApp");
        if (app == null) {
            app = new UsersApp();
            try {
                app.setFilePath(application.getRealPath("WEB-INF/users.xml"));
            } catch (Exception ex) {
                Logger.getLogger(ModifyBookingApp.class.getName()).log(Level.SEVERE, null, ex);
            }
            application.setAttribute("UsersApp", app);
        }
        Users users = app.getUsers();
        User user = users.login(username, password);
        return user;
    }

    @WebMethod
    public ArrayList<Booking> getBookingsXML() {

        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        BookingsApp app = (BookingsApp) application.getAttribute("BookingsApp");
        if (app == null) {
            app = new BookingsApp();
            try {
                app.setFilePath(application.getRealPath("WEB-INF/bookings.xml"));
            } catch (Exception ex) {
                Logger.getLogger(ModifyBookingApp.class.getName()).log(Level.SEVERE, null, ex);
            }
            application.setAttribute("BookingsApp", app);
        }
        return app.getBookings().getList();

    }

    @WebMethod
    public FlightsApp getFlightsApp() {

        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        FlightsApp app = (FlightsApp) application.getAttribute("FlightsApp");
        if (app == null) {
            app = new FlightsApp();
            try {
                app.setFilePath(application.getRealPath("WEB-INF/flights.xml"));
            } catch (Exception ex) {
                Logger.getLogger(ModifyBookingApp.class.getName()).log(Level.SEVERE, null, ex);
            }
            application.setAttribute("FlightsApp", app);
        }
        return app;

    }

    @WebMethod
    public void addListing(int flightID, String departureDate, String returnDate, String price, int numofSeats, String origin, String destination, String description, String flightType) throws Exception {

        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        FlightsApp app = (FlightsApp) application.getAttribute("FlightsApp");
        if (app == null) {
            app = new FlightsApp();
            try {
                app.setFilePath(application.getRealPath("WEB-INF/flights.xml"));
            } catch (Exception ex) {
                Logger.getLogger(ModifyBookingApp.class.getName()).log(Level.SEVERE, null, ex);
            }
            application.setAttribute("FlightsApp", app);
        }
        Flight newFlight = new Flight(flightID, departureDate, departureDate, price, numofSeats, origin, destination, description, flightType);

        Flights existingFlights = app.getFlights();
        existingFlights.addFlight(newFlight);
        app.updateXML(existingFlights);
    }

    @WebMethod
    public void addBooking(int userID, int flightID) throws Exception {

        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        BookingsApp bookingApp = (BookingsApp) application.getAttribute("BookingsApp");
        if (bookingApp == null) {
            bookingApp = new BookingsApp();
            try {
                bookingApp.setFilePath(application.getRealPath("WEB-INF/bookings.xml"));
            } catch (Exception ex) {
                Logger.getLogger(ModifyBookingApp.class.getName()).log(Level.SEVERE, null, ex);
            }
            application.setAttribute("BookingsApp", bookingApp);
        }
        FlightsApp flightApp = (FlightsApp) application.getAttribute("FlightsApp");
        if (flightApp == null) {
            flightApp = new FlightsApp();
            try {
                flightApp.setFilePath(application.getRealPath("WEB-INF/flights.xml"));
            } catch (Exception ex) {
                Logger.getLogger(ModifyBookingApp.class.getName()).log(Level.SEVERE, null, ex);
            }
            application.setAttribute("FlightsApp", flightApp);
        }
        Bookings existingBookings = bookingApp.getBookings();
        Flights existingFlights = flightApp.getFlights();
        Flight flightToBook = existingFlights.getFlightID(flightID);
        flightToBook.setNumofSeats(flightToBook.getNumofSeats() - 1);
        Booking newBooking = new Booking(userID, flightID, (new Random()).nextInt(999),
                flightToBook.getOrigin(), flightToBook.getDestination(), flightToBook.getFlightType(),
                flightToBook.getDepartureDate(), flightToBook.getReturnDate(), flightToBook.getDescription());
        existingBookings.addBooking(newBooking);

        flightApp.updateXML(existingFlights);
        bookingApp.updateXML(existingBookings);
    }

    @WebMethod
    public void closeListing(int listingID) throws Exception {

        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        FlightsApp app = (FlightsApp) application.getAttribute("FlightsApp");
        if (app == null) {
            app = new FlightsApp();
            try {
                app.setFilePath(application.getRealPath("WEB-INF/flights.xml"));
            } catch (Exception ex) {
                Logger.getLogger(ModifyBookingApp.class.getName()).log(Level.SEVERE, null, ex);
            }
            application.setAttribute("FlightsApp", app);
        }
        Flights existingFlights = app.getFlights();
        Flight listingToRemove = existingFlights.getFlightID(listingID);
        existingFlights.removeFlight(listingToRemove);
        app.updateXML(existingFlights);
    }

    @WebMethod
    public String cancelBooking(int bookingID, int userID, int requestersID) throws Exception {

        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        BookingsApp bookingApp = (BookingsApp) application.getAttribute("BookingsApp");
        if (bookingApp == null) {
            bookingApp = new BookingsApp();
            try {
                bookingApp.setFilePath(application.getRealPath("WEB-INF/bookings.xml"));
            } catch (Exception ex) {
                Logger.getLogger(ModifyBookingApp.class.getName()).log(Level.SEVERE, null, ex);
            }
            application.setAttribute("BookingsApp", bookingApp);
        }
        FlightsApp flightApp = (FlightsApp) application.getAttribute("FlightsApp");
        if (flightApp == null) {
            flightApp = new FlightsApp();
            try {
                flightApp.setFilePath(application.getRealPath("WEB-INF/flights.xml"));
            } catch (Exception ex) {
                Logger.getLogger(ModifyBookingApp.class.getName()).log(Level.SEVERE, null, ex);
            }
            application.setAttribute("FlightsApp", flightApp);
        }
        UsersApp userApp = (UsersApp) application.getAttribute("UsersApp");
        if (userApp == null) {
            userApp = new UsersApp();
            try {
                userApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
            } catch (Exception ex) {
                Logger.getLogger(ModifyBookingApp.class.getName()).log(Level.SEVERE, null, ex);
            }
            application.setAttribute("UsersApp", userApp);
        }
        String returnOutput = "";
        Users users = userApp.getUsers();
        User user = users.getUserID(requestersID);
        String userPrivege = user.getPrivilege();
        if (userID != requestersID && !userPrivege.equals("admin")) {
            returnOutput = "You do not have permission to do this!";
        } else {

            Bookings existingBookings = bookingApp.getBookings();
            ArrayList<Booking> bookingsToRemove = existingBookings.getBookingsUserID(userID);
            Booking bookingToRemove = bookingsToRemove.get(0);
            Flights existingFlights = flightApp.getFlights();
            Flight flightBooked = existingFlights.getFlightID(bookingToRemove.getFlightID());
            flightBooked.setNumofSeats(flightBooked.getNumofSeats() + 1);
            existingBookings.removeBooking(bookingToRemove);

            bookingApp.updateXML(existingBookings);
            flightApp.updateXML(existingFlights);
            returnOutput = "Booking removed successfully";
        }
        return returnOutput;

    }

}
