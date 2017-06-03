///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package ass.wsd.dom;
//
//import java.io.*;
//import static java.lang.System.out;
//import java.util.*;
//import javax.xml.parsers.*;
//import org.w3c.dom.*;
//import org.xml.sax.*;
//
//public class UsersPrinter implements Serializable {
//    
//    
//     public UsersPrinter(){
//         
//     }
//
//    public void printHTML() throws FileNotFoundException, SAXException, ParserConfigurationException, IOException {
//        FileInputStream in;
//         in = new FileInputStream("web/WEB-INF/users.xml");
//        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
//        DocumentBuilder builder = factory.newDocumentBuilder();
//        Document document = builder.parse(in);
//        Element rootNode = document.getDocumentElement();
//        int type = rootNode.getNodeType();
//        String name = rootNode.getNodeName();
//        String value = rootNode.getNodeValue();
//        switch (type) {
//            case Node.ELEMENT_NODE:
//                if (name.equals("users")) {
//                    name = "table";
//                } else if (name.equals("user")) {
//                    name = "tr";
//                } else {
//                    name = "td";
//                }
//
//                htmlTable += ("<" + name + ">");
//                if (name.equals("table")) {
//                    htmlTable += ("\n<tr><td>Email</td><td>Name</td><td>Password</td><td>Gender</td><td>Favourite colour</td></tr>");
//                }
//                NodeList att = rootNode.getChildNodes();
//                for (int i = 0; i < att.getLength(); i++) {
//                    Node child = att.item(i);
//
//                    htmlTable += ln("The first user is " + child.getChildNodes().item(1).getChildNodes().item(3).getChildNodes().item(0).getNodeValue());
//
//                }
//                htmlTable += ("</" + name + ">");
//                break;
//            case Node.TEXT_NODE:
//                htmlTable += (value);
//                break;
//        }
//    }
//
//}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

    public UsersPrinter(String test) throws ParserConfigurationException, SAXException, IOException {
        print("web/WEB-INF/users.xml");
    }
    
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
        // INSERT YOUR CODE HERE
        int type = node.getNodeType();
        String name = node.getNodeName();
        String value = node.getNodeValue();
        
        

        switch (type) {
            case Node.ELEMENT_NODE:
                if (name.equals("users")) {
                    name = "table";
                } else if (name.equals("user")) {
                    name = "tr";
                } else {
                    name = "td";
                }

                htmlTable += ("<" + name + ">");
                if (name.equals("table")) {
                    htmlTable += ("\n<tr><td>Email</td><td>Name</td><td>Password</td><td>Gender</td><td>Favourite colour</td></tr>");
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
