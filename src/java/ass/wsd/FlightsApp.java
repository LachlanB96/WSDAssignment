/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd;

import java.io.*;
import javax.xml.bind.*;

public class FlightsApp implements Serializable {
    private String filePath; 
    private Flights flights;
    
    public FlightsApp() {
    
    }

    public FlightsApp(String filePath, Flights flight) {
        super();
        this.filePath = filePath;
        this.flights = flight;
    }

    public void setFilePath(String filePath) throws Exception {
        
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Flights.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.filePath = filePath;

        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        flights = (Flights) u.unmarshal(fin); 		
        fin.close();
    }
    
    public void updateXML(Flights flights, String filePath) throws Exception {
        this.flights = flights;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Flights.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(flights, fout);
        fout.close();
    }

    public Flights getFlights() {
        return flights ;
    }

    public void setFlights(Flights flights) {
        this.flights = flights;
    }
}
