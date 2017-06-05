/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd.soap.client;

import ass.wsd.Booking;
import ass.wsd.Flight;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author lachlan
 */
public class ModifyBookingAppClient {

    public static void main(String[] args) throws IOException {

        BufferedReader scan = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("Enter a number to take action: ");
        System.out.println("(1) print flights");
        System.out.println("(2) create viewing");
        System.out.println("(3) create booking");
        System.out.println("(4) cancel booking");
        System.out.print("==> ");
        //String s = scan.next();
        String input = scan.readLine();
        ModifyBookingApp_Service locator = new ModifyBookingApp_Service();
        ModifyBookingApp port = locator.getModifyBookingAppPort();
        System.out.println(input);

        if (input.equals("1")) {
            String userInput;
            String userIDFilter = "342345";
            String flightTypeFilter = "b";
            String numSeatsFilter = "10";
            System.out.println("PRINT FLIGHTS");
            System.out.println("Search criteria (enter for default)");
            System.out.print("Customer ID (342345): ");
            userInput = scan.readLine();
            if(!"".equals(userInput.trim())) userIDFilter = userInput;
            System.out.print("(b)usiness or (e)conomical (b): ");
            userInput = scan.readLine();
            if(!"".equals(userInput.trim())) flightTypeFilter = userInput;
            System.out.print("Number of Seats (10): ");
            userInput = scan.readLine();
            if(!"".equals(userInput.trim())) numSeatsFilter = userInput;
            System.out.println("--------------------------------------");
            FlightsApp flightsApp = port.getFlightsApp();
            Flights flights = flightsApp.getFlights();
            List<ass.wsd.soap.client.Flight> flightList = flights.getFlight();
            for (int i = 0; i < flightList.size(); i++) {
                //if (String.valueOf(flightList.get(i).id).equals(userIDFilter)) {
                    out.print(flightList.get(i).flightID);
                    out.print(" | ");
                    out.print(flightList.get(i).departureDate);
                    out.print(" | ");
                    out.print(flightList.get(i).returnDate);
                    out.print(" | ");
                    out.print(flightList.get(i).price);
                    out.print(" | ");
                    out.print(flightList.get(i).numofSeats);
                    out.print(" | ");
                    out.print(flightList.get(i).origin);
                    out.print(" | ");
                    out.print(flightList.get(i).destination);
                    out.print(" | ");
                    out.print(flightList.get(i).description);
                    out.print(" | ");
                    out.println(flightList.get(i).flightType);
                //}
            }

            //x.getBookings();
        }
        else if (input.equals("2")) {
            String userInput;
            String userIDFilter = "342345";
            String flightTypeFilter = "b";
            String numSeatsFilter = "10";
            System.out.println("PRINT FLIGHTS");
            System.out.println("Search criteria (enter for default)");
            System.out.print("Customer ID (342345): ");
            userInput = scan.readLine();
            if(!"".equals(userInput.trim())) userIDFilter = userInput;
            System.out.print("(b)usiness or (e)conomical (b): ");
            userInput = scan.readLine();
            if(!"".equals(userInput.trim())) flightTypeFilter = userInput;
            System.out.print("Number of Seats (10): ");
            userInput = scan.readLine();
            if(!"".equals(userInput.trim())) numSeatsFilter = userInput;
            System.out.println("--------------------------------------");
            List<ass.wsd.soap.client.Booking> bookings = port.getBookingsXML();
            for (int i = 0; i < bookings.size(); i++) {
                if (String.valueOf(bookings.get(i).id).equals(userIDFilter)) {
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
            }

            //x.getBookings();
        }
    }

}
