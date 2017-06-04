/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd.soap;

import ass.wsd.Booking;
import ass.wsd.BookingsApp;
import ass.wsd.FlightsApp;
import java.util.ArrayList;
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

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
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
}
