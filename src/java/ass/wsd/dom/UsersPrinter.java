package ass.wsd.dom;

import java.io.*;
import static java.lang.System.out;
import java.util.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.*;

public class UsersPrinter implements Serializable {

    public String htmlTable = "";

    public List<Integer> listFlightIDs;

    public String print(String printType, String filePath, String[] searchFilters, boolean loggedIn) throws ParserConfigurationException, SAXException, IOException {
        FileInputStream in = new FileInputStream(filePath);
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(in);
        Element root = document.getDocumentElement();
        String output;
        if (printType.equals("results")) {
            output = printHTML(root, searchFilters, loggedIn);
        } else if (printType.equals("booking")) {
            output = printBooking(root, searchFilters);
        } else {
            output = "ERROR";
        }
        //out.println(output);
        return output;
    }

    public String printHTML(Node node, String[] searchFilters, boolean loggedIn) {
        int flightCounter = 0;
        String htmlTable = "";
        listFlightIDs = new ArrayList<>();
        htmlTable += "<table class='table'><thead><tr>"
                + "<td>Departure Date</td>"
                + "<td>Price</td>"
                + "<td>Number of Seats</td>"
                + "<td>Origin</td>"
                + "<td>Destination</td>"
                + "<td>Flight Type</td>"
                + "<td>Description</td>"
                + "<td>Flight ID</td></tr></thead>";
        if (loggedIn) {
            htmlTable += "<tbody class='row-select'>";
        } else {
            htmlTable += "<tbody>";
        }
        NodeList flights = node.getChildNodes();
        for (int i = 1; i < flights.getLength(); i += 2) {
            NodeList flight = flights.item(i).getChildNodes();

            if (flight.item(7).getChildNodes().item(0).getNodeValue().equals(searchFilters[1])
                    && flight.item(9).getChildNodes().item(0).getNodeValue().equals(searchFilters[2])
                    && flight.item(11).getChildNodes().item(0).getNodeValue().equals(searchFilters[3])
                    && flight.item(1).getChildNodes().item(0).getNodeValue().equals(searchFilters[4])) {
                htmlTable += "<tr>";
                for (int j = 1; j < flight.getLength(); j += 2) {
                    htmlTable += "<td>";
                    htmlTable += flight.item(j).getChildNodes().item(0).getNodeValue();
                    htmlTable += "</td>";
                }
                System.out.println(Integer.parseInt(flight.item(15).getChildNodes().item(0).getNodeValue()));
                listFlightIDs.add(Integer.valueOf(flight.item(15).getChildNodes().item(0).getNodeValue()));
                htmlTable += "<td style='display: none;'>"
                        + "<input type='radio' name='flight' id='flight_choice' "
                        + "value='" + flight.item(15).getChildNodes().item(0).getNodeValue() + "'>"
                        + "</td>"
                        + "</tr>";
                flightCounter++;
            }
        }
        htmlTable += "</tbody></table>";
        if (flightCounter > 0) {
            return htmlTable;
        } else {
            return "There are no flights that fit the criteria.<br>";
        }
    }

    public String printBooking(Node node, String[] searchFilters) {
        int type = node.getNodeType();
        String name = node.getNodeName();
        String value = node.getNodeValue();
        String htmlTable = "";
        htmlTable += "<table class='table'><thead><tr>"
                + "<td>departureDate</td>"
                + "<td>price</td>"
                + "<td>numofSeats</td>"
                + "<td>origin</td>"
                + "<td>destination</td>"
                + "<td>flightType</td>"
                + "<td>description</td>"
                + "<td>flightID</td></tr></thead><tbody>";

        NodeList flights = node.getChildNodes();
        for (int i = 1; i < flights.getLength(); i += 2) {
            NodeList flight = flights.item(i).getChildNodes();

            if (flight.item(15).getChildNodes().item(0).getNodeValue().equals(searchFilters[0])) {
                htmlTable += "<tr>";
                for (int j = 1; j < flight.getLength(); j += 2) {
                    htmlTable += "<td>";
                    htmlTable += flight.item(j).getChildNodes().item(0).getNodeValue();
                    htmlTable += "</td>";
                }
                htmlTable += "</tr>";
            }
        }
        htmlTable += "</tbody></table>";
        return htmlTable;
    }
}
