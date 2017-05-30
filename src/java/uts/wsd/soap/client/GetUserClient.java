/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.soap.client;

import static java.lang.System.out;


/**
 *
 * @author lachlan
 */

public class GetUserClient {
    

    public static void main(String[] args) {
        GetUser_Service locator = new GetUser_Service();
        GetUser users = locator.getGetUserPort();
        

        User x = users.getUser("a@a.com");
       

        out.println(x.getName());
    }
}
