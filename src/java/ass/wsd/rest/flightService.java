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
@Path("/flights")
public class flightService {
    
    @Context
    private ServletContext application;
    
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

    @Path("hello")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello World";
    }

    @Path("getFlights")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Flights getFlights() throws IOException, Exception {
        return getFlightsApp().getFlights();
    }
}
