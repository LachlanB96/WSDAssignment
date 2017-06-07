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
@Path("/users")
public class userService {
    
    @Context
    private ServletContext application;
    
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
    
    @Path("getUserList")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<User> getUserList() throws JAXBException, IOException, Exception {
        return getUsersApp().getUsers().getList();
    }
    
    // Debugging methods
    
    @Path("working")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String working(@QueryParam("text") String text) {
        return text;
    }
    
    @Path("printInfoStatic")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String findUserStatic() throws JAXBException, IOException, Exception {
        String s = "";
        User user = getUsersApp().getUsers().getUser("a@a.com");
        s += "Username: " + user.getEmail();
        return s;
    }
    
    @Path("getInfoStatic")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public User getInfoStatic() throws JAXBException, IOException, Exception {
        return new User("James", "james@james.com", "secretJames", "13-05-1984", 847563);
    }
}
