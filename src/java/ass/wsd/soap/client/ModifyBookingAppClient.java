/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd.soap.client;

import ass.wsd.Booking;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lachlan
 */
public class ModifyBookingAppClient {

    public static void main(String[] args) {
        ModifyBookingApp_Service locator = new ModifyBookingApp_Service();
        ModifyBookingApp port = locator.getModifyBookingAppPort();

        out.println(port.hello("World"));
        List<ass.wsd.soap.client.Booking> bookings = port.getBookingsXML();
        for (int i = 0; i < bookings.size(); i++) {
            out.print(bookings.get(i).bookingID);
            out.print(" | ");
            out.print(bookings.get(i).departureDate);
            out.print(" | ");
            out.print(bookings.get(i).description);
            out.print(" | ");
            out.print(bookings.get(i).destination);
            out.print(" | ");
            out.print(bookings.get(i).flightID);
            out.print(" | ");
            out.print(bookings.get(i).flightType);
            out.print(" | ");
            out.print(bookings.get(i).id);
            out.print(" | ");
            out.print(bookings.get(i).origin);
            out.print(" | ");
            out.println(bookings.get(i).returnDate);
        }

        //x.getBookings();
    }

}
