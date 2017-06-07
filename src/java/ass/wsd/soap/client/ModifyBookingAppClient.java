/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd.soap.client;

import ass.wsd.Booking;
import ass.wsd.Flight;
import ass.wsd.User;
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

    public static void main(String[] args) throws IOException, Exception_Exception {

        ModifyBookingApp_Service locator = new ModifyBookingApp_Service();
        ModifyBookingApp port = locator.getModifyBookingAppPort();
        BufferedReader scan = new BufferedReader(new InputStreamReader(System.in));
        ass.wsd.soap.client.User user = null;
        String userInput;
        boolean running = true;

        while (running) {

            System.out.println();
            System.out.println();
            System.out.println();
            System.out.println("### MAIN MENU ###");
            System.out.println();

            if (user != null) {
                System.out.println("Hello " + user.getName() + "!");
            } else {
                System.out.println("Welcome unknown user!");
            }

            System.out.println();
            System.out.println("On prompts, leave the input empty to use the default value in brackets (<value>).");
            System.out.println("Enter a number to take action: ");
            System.out.println("(1) Login to account");
            System.out.println("(2) Create a listing");
            System.out.println("(3) Create a booking");
            System.out.println("(4) View current bookings");
            System.out.println("(5) View current listings");
            System.out.println("(6) Close a listing");
            System.out.println("(7) Exit application");
            String input = userInputFormatted("==> ", "1", scan, false);

            // LOGIN METHOD ###########################################################################
            if (input.equals("1")) {

                if (user != null) {
                    System.out.println("You are already logged in as " + user.getName() + "!");
                } else {
                    String username = "r@r.r";
                    String password = "r";

                    System.out.println("Login to account.");
                    System.out.println("Username (r@r.r): ");
                    userInput = ""; //scan.readLine();
                    if (!"".equals(userInput.trim())) {
                        username = userInput;
                    }
                    System.out.println("Password (r): ");
                    userInput = ""; //scan.readLine();
                    if (!"".equals(userInput.trim())) {
                        password = userInput;
                    }
                    System.out.println("Authenticating...");
                    user = port.login(username, password);
                    if (user != null) {
                        System.out.println("Successfully logged in. Welcome " + user.getName() + "!");
                    } else {
                        System.out.println("Username and/or password does not exist. Exitting.");
                    }

                }
            } // Create listing METHOD ###########################################################################
            else if (input.equals("2")) {
                System.out.println("Create a listing.");
                int flightID = Integer.valueOf(userInputFormatted("Listing origin", "1007", scan, true));
                String origin = userInputFormatted("Listing origin", "Sydney", scan, true);
                String destination = userInputFormatted("Listing origin (Sydney): ", "Melbourne", scan, true);
                int numofSeats = Integer.valueOf(userInputFormatted("Listing origin (Sydney): ", "8", scan, true));
                String departureDate = userInputFormatted("Listing origin (Sydney): ", "2017-06-16", scan, true);
                String flightType = userInputFormatted("Listing origin (Sydney): ", "Business", scan, true);
                String price = userInputFormatted("Listing origin (Sydney): ", "100.00", scan, true);
                String description = userInputFormatted("Listing origin (Sydney): ", "Business flight from Sydney to Melbourne.", scan, true);
                port.addListing(flightID, departureDate, departureDate, price, numofSeats, origin, destination, description, flightType);
            } else if (input.equals("3")) {
                System.out.println("Create a booking.");
                int userID = Integer.valueOf(userInputFormatted("Listing origin", "342345", scan, true));
                int flightID = Integer.valueOf(userInputFormatted("Listing origin", "1007", scan, true));
                int bookingID = Integer.valueOf(userInputFormatted("Listing origin", "103", scan, true));
                String origin = userInputFormatted("Listing origin", "Sydney", scan, true);
                String destination = userInputFormatted("Listing origin (Sydney): ", "Melbourne", scan, true);
                String departureDate = userInputFormatted("Listing origin (Sydney): ", "2017-06-16", scan, true);
                String flightType = userInputFormatted("Listing origin (Sydney): ", "Business", scan, true);
                String description = userInputFormatted("Listing origin (Sydney): ", "Business flight from Sydney to Melbourne.", scan, true);
                port.addBooking(userID, flightID, bookingID, origin, destination, flightType, departureDate, departureDate, description);
            } // view listing METHOD ###########################################################################
            else if (input.equals("4")) {
                System.out.println("PRINT BOOKINGS");
                System.out.println("Search criteria (enter for default)");
                String userIDFilter = userInputFormatted("Customer ID", "342345", scan, true);
                String flightTypeFilter = userInputFormatted("(b)usiness or (e)conomical", "b", scan, true);
                String numSeatsFilter = userInputFormatted("Number of Seats", "10", scan, true);
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
            } else if (input.equals("5")) {
                System.out.println("PRINT LISTINGS");
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
            } else if (input.equals("6")) {
                System.out.println("CLOSE LISTING");
                int listingID = Integer.valueOf(userInputFormatted("Customer ID", "342345", scan, false));
                port.closeListing(listingID);
            } else if (input.equals("7")) {
                running = false;
            }
        }
    }

    private static String userInputFormatted(String prompt, String defaultValue, BufferedReader scan, boolean isDebug) throws IOException {
        System.out.print(prompt + " (" + defaultValue + "): ");
        if (isDebug) {
            return defaultValue;
        } else {
            String userInput = scan.readLine();
            System.out.println();

            if (!"".equals(userInput.trim())) {
                return userInput;
            }
            return defaultValue;
        }
    }
}
