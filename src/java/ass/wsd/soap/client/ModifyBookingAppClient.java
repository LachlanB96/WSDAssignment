package ass.wsd.soap.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import static java.lang.System.out;
import java.util.List;

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
        boolean isDebug = false;
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
            System.out.println("(6) Cancel a booking");
            System.out.println("(7) Close a listing");
            System.out.println("(8) Exit application");
            String input = userInputString("==> ", "1", scan, isDebug);

            // LOGIN METHOD ###########################################################################
            if (input.equals("1")) {

                if (user != null) {
                    System.out.println("You are already logged in as " + user.getName() + "!");
                } else {
                    System.out.println("Login to account.");
                    String username = userInputString("Username", "a@a.com", scan, isDebug);
                    String password = userInputString("Password", "a", scan, isDebug);
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
                System.out.println("CREATE LISTING");
                int flightID = Integer.valueOf(userInputString("Flight ID", "1007", scan, isDebug));
                String origin = userInputString("Origin", "Sydney", scan, isDebug);
                String destination = userInputString("Destination", "Melbourne", scan, isDebug);
                int numofSeats = Integer.valueOf(userInputString("Number of Seats", "8", scan, isDebug));
                String departureDate = userInputString("Date of departure", "2017-06-16", scan, isDebug);
                String flightType = userInputString("Type of flight, (b)usiness or (e)conomical", "b", scan, isDebug);
                String price = userInputString("Price of flight", "100.00", scan, isDebug);
                String description = userInputString("Description", "Business flight from Sydney to Melbourne.", scan, isDebug);
                port.addListing(flightID, departureDate, departureDate, price, numofSeats, origin, destination, description, flightType);
                System.out.println("Listing successfully created listings " + flightID + ".");
            }// Create booking METHOD ########################################################################### 
            else if (input.equals("3")) {
                System.out.println("CREATE BOOKING");
                int userID = Integer.valueOf(userInputString("userID", "342345", scan, isDebug));
                int flightID = Integer.valueOf(userInputString("flightID", "1007", scan, isDebug));
                port.addBooking(userID, flightID);
            } // view listing METHOD ###########################################################################
            else if (input.equals("4")) {
                System.out.println("PRINT BOOKINGS");
                System.out.println("Search criteria (enter for default)");
                String userIDFilter = userInputString("Customer ID", "342345", scan, isDebug);
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
                boolean userIDEnable = userInputBoolean("Search using customer username", true, scan, isDebug);
                String userIDFilter = userInputString("Customer ID", "342345", scan, isDebug);
                String flightTypeFilter = userInputString("(b)usiness or (e)conomical", "b", scan, isDebug);
                String numSeatsFilter = userInputString("Number of Seats", "10", scan, isDebug);
                FlightsApp flightsApp = port.getFlightsApp();
                Flights flights = flightsApp.getFlights();
                List<ass.wsd.soap.client.Flight> flightList = flights.getFlight();
                for (int i = 0; i < flightList.size(); i++) {
                    //if (String.valueOf(flightList.get(i).id).equals(userIDFilter)) {
                    //Add filters here
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
                System.out.println("CANCEL BOOKING");
                if (user == null) {
                    System.out.println("Please login to complete this action!");
                } else {
                    int bookingID = Integer.valueOf(userInputString("BookingID", "100", scan, isDebug));
                    int userID = Integer.valueOf(userInputString("ID of the user who owns ths booking", "342345", scan, isDebug));
                    System.out.println(port.cancelBooking(bookingID, userID, user.id));
                }
            } else if (input.equals("7")) {
                System.out.println("CLOSE LISTING");
                int listingID = Integer.valueOf(userInputString("Enter ID of the listing: ", "342345", scan, isDebug));
                port.closeListing(listingID);
            } else if (input.equals("8")) {
                running = false;
            }
        }
    }

    private static String userInputString(String prompt, String defaultValue, BufferedReader scan, boolean isDebug) throws IOException {
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

    /* I'm pretty happy with this method. Prompts the user for a y or n. Allows
    for the program to specify a default value too, so if the user leaves
    the line empty, it will return a default. param prompt should be set to what
    you want the program to ask the user. param defaultValue is the value if
    user enters nothing. param scan is the buffered reader the program is using
    param isDebug is set to true if you want the program to automatically enter 
    the default value without a user prompt, useful for fast development and
    debugging */
    private static Boolean userInputBoolean(String prompt, boolean defaultValue, BufferedReader scan, boolean isDebug) throws IOException {
        if (defaultValue) {
            System.out.print("[ y | n ] " + prompt + "? (y): ");
        } else {
            System.out.print("[ y | n ] " + prompt + "? (n): ");
        }
        if (isDebug) {
            return defaultValue;
        } else {
            String userInput = scan.readLine();
            System.out.println();

            if ("y".equals(userInput.trim())) {
                return true;
            } else if ("n".equals(userInput.trim())) {
                return false;
            } else if ("".equals(userInput.trim())) {
                return defaultValue;
            } else {
                System.out.print("ERROR: Please enter either a 'y' or 'n' to signify yes or no.");
                return userInputBoolean(prompt, defaultValue, scan, isDebug);
            }
        }
    }
}
