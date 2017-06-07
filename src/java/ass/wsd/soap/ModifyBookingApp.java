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
    public User login(String username, String password
    ) {

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
    public void addBooking(int userID, int flightID, int bookingID, String origin, String destination, String flightType, String departureDate, String returnDate, String description) throws Exception {

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
        Booking newBooking = new Booking(userID, flightID, bookingID, origin, destination, flightType, departureDate, returnDate, description);

        Bookings existingBookings = app.getBookings();
        existingBookings.addBooking(newBooking);
        app.updateXML(existingBookings);
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

}
