/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd.rest;
import ass.wsd.*;
import javax.ws.rs.*;
import javax.ws.rs.core.*;

/**
 *
 * @author Kieran O'Brien
 */
@Path("/users")
public class userService {

    @Path("hello")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello World";
    }
    
    @Path("getInfo")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public User findUser() {
        
    }
}
