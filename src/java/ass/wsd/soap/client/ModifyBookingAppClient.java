/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd.soap.client;

import static java.lang.System.out;

/**
 *
 * @author lachlan
 */
public class ModifyBookingAppClient {

    public static void main(String[] args) {
        ModifyBookingApp_Service locator = new ModifyBookingApp_Service();
        ModifyBookingApp calculator = locator.getModifyBookingAppPort();

        out.println(calculator.hello("World"));
        BookingsApp x = calculator.getBookingsApp();
    }

}
