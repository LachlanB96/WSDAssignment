package ass.wsd.dom;

import java.io.*;
import static java.lang.System.out;
import java.util.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.*;

public class UsersPrinter implements Serializable {

    public String htmlTable = "";

    public UsersPrinter() {
    }

    public String print(String filePath, String filterDestination) throws ParserConfigurationException, SAXException, IOException {
        FileInputStream in = new FileInputStream(filePath);
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(in);
        Element root = document.getDocumentElement();
        String output = printHTML(root, filterDestination, "");
        //out.println(output);
        return output;
    }

    public String printHTML(Node node, String filterDestination, String depth) {
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
                + "<td>flightID</td></tr></thead><tbody class='row-select'>";
        NodeList flights = node.getChildNodes();
        for (int i = 1; i < flights.getLength(); i += 2) {
            NodeList flight = flights.item(i).getChildNodes();
            if (filterDestination.isEmpty()){
                htmlTable += "<tr>";
                for (int j = 1; j < flight.getLength(); j += 2) {
                    htmlTable += "<td>";
                    htmlTable += flight.item(j).getChildNodes().item(0).getNodeValue();
                    htmlTable += "</td>";
                    htmlTable += "<td style='display: none;'>"
                            + "<input type='radio' name='flight' id='flight_choice' "
                            + "value='" + flight.item(9).getChildNodes().item(0).getNodeValue() + "'>"
                            + "</td>";
                }
                htmlTable += "</tr>";
            }
            if (flight.item(9).getChildNodes().item(0).getNodeValue().equals(filterDestination)) {
                htmlTable += "<tr>";
                for (int j = 1; j < flight.getLength(); j += 2) {
                    htmlTable += "<td>";
                    htmlTable += flight.item(j).getChildNodes().item(0).getNodeValue();
                    htmlTable += "</td>";
                    htmlTable += "<td style='display: none;'>"
                            + "<input type='radio' name='flight' id='flight_choice' "
                            + "value='" + flight.item(9).getChildNodes().item(0).getNodeValue() + "'>"
                            + "</td>";
                }
                htmlTable += "</tr>";
            }
        }
        htmlTable += "</tr></tbody></table>";
        return htmlTable;
    }
}