package ass.wsd.dom;

import java.io.*;
import static java.lang.System.out;
import java.util.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.*;

public class UsersPrinter implements Serializable {

    public String htmlTable = "";
    public UsersPrinter() {}

    public String setFilePath(String filePath) throws ParserConfigurationException, SAXException, IOException {
        return print(filePath);
    }

    public String print(String filePath) throws ParserConfigurationException, SAXException, IOException {
        FileInputStream in = new FileInputStream(filePath);
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(in);
        Element root = document.getDocumentElement();
        return printHTML(root);
    }

    public String printHTML(Node node) {
        int type = node.getNodeType();
        String name = node.getNodeName();
        String value = node.getNodeValue();
        switch (type) {
            case Node.ELEMENT_NODE:
                if (name.equals("flights")) {
                    name = "table";
                } else if (name.equals("flight")) {
                    name = "tr";
                } else {
                    name = "td";
                }
                htmlTable += ("<" + name + ">");
                if (name.equals("table")) {
                    htmlTable += ("<tr><td>departureDate</td><td>price</td><td>numofSeats</td><td>origin</td>"
                            + "<td>origin</td>"
                            + "<td>destination</td>"
                            + "<td>flightType</td>"
                            + "<td>description</td>"
                            + "<td>flightID</td></tr>");
                }
                NodeList att = node.getChildNodes();
                for (int i = 0; i < att.getLength(); i++) {
                    Node child = att.item(i);

                    printHTML(child);
                }
                htmlTable += ("</" + name + ">");
                break;
            case Node.TEXT_NODE:
                htmlTable += (value);
                break;
        }
        return htmlTable;
    }
}
