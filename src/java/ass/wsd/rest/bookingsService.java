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
}
