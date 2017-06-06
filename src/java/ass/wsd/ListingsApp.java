/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd;

import java.io.*;
import javax.xml.bind.*;

public class ListingsApp implements Serializable {
    private String filePath; 
    private Listings listings;
    
    public ListingsApp() {
    
    }

    public ListingsApp(String filePath, Listings listing) {
        super();
        this.filePath = filePath;
        this.listings = listing;
    }

    public void setFilePath(String filePath) throws Exception {
        
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Listings.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.filePath = filePath;

        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        listings = (Listings) u.unmarshal(fin); 		
        fin.close();
    }
    
    public void updateXML(Listings listings, String filePath) throws Exception {
        this.listings = listings;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Listings.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(listings, fout);
        fout.close();
    }

    public Listings getListings() {
        return listings ;
    }

    public void setListing(Listings listings) {
        this.listings = listings;
    }
}
