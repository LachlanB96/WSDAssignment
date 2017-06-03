/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd;

import java.io.*;
import javax.xml.bind.*;

/**
 *
 * @author Peter Nguyen
 */
public class BookingsApp implements Serializable {
    private String filePath; 
    private Bookings bookings;
    
    public BookingsApp() {
    
    }

    public BookingsApp(String filePath, Bookings booking) {
        super();
        this.filePath = filePath;
        this.bookings = booking;
    }

    public void setFilePath(String filePath) throws Exception {
        
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.filePath = filePath;

        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        bookings = (Bookings) u.unmarshal(fin); 		
        fin.close();
    }
    
    public void updateXML(Bookings bookings, String filePath) throws Exception {
        this.bookings = bookings;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(bookings, fout);
        fout.close();
    }

    public Bookings getBookings() {
        return bookings ;
    }

    public void setBooking(Bookings bookings) {
        this.bookings = bookings;
    }
}
