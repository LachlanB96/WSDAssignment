/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.soap;

import ass.wsd.User;
import ass.wsd.UsersApp;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.servlet.ServletContext;
import javax.xml.bind.JAXBException;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

/**
 *
 * @author lachlan
 */


@WebService(serviceName = "GetUser")
public class GetUser {

    @Resource
    private WebServiceContext context;

    
    @WebMethod
    public UsersApp getUsersApp() throws JAXBException, IOException, Exception {

        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        UsersApp usersApp = (UsersApp) application.getAttribute("usersApp");
        if (usersApp == null) {
            usersApp = new UsersApp();
            usersApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
            application.setAttribute("usersApp", usersApp);
        }
        return usersApp;

    }


    @WebMethod
    public User getUser(String email) {
        try {
            return getUsersApp().getUsers().getUser(email);
        } catch (IOException ex) {
            Logger.getLogger(GetUser.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(GetUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    @WebMethod
    public int add(int a, int b) {
        return a + b;
    }
}
