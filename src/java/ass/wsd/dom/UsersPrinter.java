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
        htmlTable += "<table><tr><td>departureDate</td><td>price</td><td>numofSeats</td><td>origin</td>"
                            + "<td>destination</td>"
                            + "<td>flightType</td>"
                            + "<td>description</td>"
                            + "<td>flightID</td></tr>";
        NodeList flights = node.getChildNodes();
        for (int i = 1; i < flights.getLength(); i += 2) {
            NodeList flight = flights.item(i).getChildNodes();
            if(flight.item(9).getChildNodes().item(0).getNodeValue().equals(filterDestination)){
                htmlTable += "<tr>";
                for (int j = 1; j < flight.getLength(); j += 2) {
                    htmlTable += "<td>";
                    htmlTable += flight.item(j).getChildNodes().item(0).getNodeValue();
                    htmlTable += "</td>";
                }
                htmlTable += "</tr>";
            }
        }
        return htmlTable;
    }
}

//        switch (type) {
//            case Node.ELEMENT_NODE:
//                if (name.equals("flights")) {
//                    name = "table";
//                } else if (name.equals("flight")) {
//                    name = "tr";
//                } else {
//                    name = "td";
//                }
//
//                htmlTable += "<" + name + ">";
//                if (name.equals("table")) {
//                    htmlTable += "\n<tr><td>departureDate</td><td>price</td><td>numofSeats</td><td>origin</td>"
//                            + "<td>destination</td>"
//                            + "<td>flightType</td>"
//                            + "<td>description</td>"
//                            + "<td>flightID</td></tr>";
//                }
//                NodeList att = node.getChildNodes();
//                
//                
//
//                for (int i = 0; i < att.getLength(); i++) {
//
//                    
//                    Node child = att.item(i);
//                    out.print(child.getNodeName() + att.item(0));
//                    printHTML(child, "", "");
//
//                }
//                htmlTable += "</" + name + ">";
//                break;
//            case Node.TEXT_NODE:
//                //out.println(value);
//                htmlTable += value;
//                break;
//        }
//
//        return htmlTable;

//        int type = node.getNodeType();
//        String name = node.getNodeName();
//        String value = node.getNodeValue();
//        String nodeDepth = depth;
//        String tagName;
//
//        htmlTable += "<table><tr><td>departureDate</td><td>price</td><td>numofSeats</td><td>origin</td>"
//                + "<td>destination</td>"
//                + "<td>flightType</td>"
//                + "<td>description</td>"
//                + "<td>flightID</td></tr>";
//        
//        NodeList flight = node.getChildNodes();
//        out.println(node.getNodeName());
//        for (int i = 0; i < flight.getLength(); i++) {
//            NodeList flights = flight.item(1).getChildNodes();
//            for (int x = 0; x < flights.getLength(); x++) {
//                String flightDetails = flights.item(x).getNodeName();
//                out.println(flightDetails + " || " + flights.item(1).getChildNodes().item(0).getNodeValue());
//            }
//        }
////            if (flightDetails.item(9).getChildNodes().item(0).getNodeValue().equals(filterDestination)) { //9 is used to get XML element 4's value
////                out.println(flightDetails.item(i).getNodeName());
////                htmlTable += "<tr>";
////                for (int j = 0; j < flightDetails.getLength(); j++) {
////                    htmlTable += "<td>";
////                    Node child = flightDetails.item(j);
////                    htmlTable = child.getNodeValue();
////                    htmlTable += "</td>";
////                }
////                htmlTable += "</tr>";
////            }
////        }
////        htmlTable += ("</table>");
//        return "";
