/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

/**
 *
 * @author Peter Nguyen
 */
@XmlRootElement(name = "listings")
@XmlAccessorType(XmlAccessType.FIELD)
public class Listings implements Serializable {

    @XmlElement(name = "listing")
    private ArrayList<Listing> list = new ArrayList<Listing>();

    public ArrayList<Listing> getList() {
        return list;
    }
    
    public void setList(ArrayList<Listing> list) {
        this.list = list;
    }

    public void addListing(Listing listing) {
        list.add(listing);
    }

    public void removeListing(Listing listing) {
        list.remove(listing);
    }
    
    public ArrayList<Listing> getListings(int ID) {
        ArrayList<Listing> lists = new ArrayList<>();
        for (Listing listing : list) {
            if (listing.getID() == ID) {
                lists.add(listing); // User ID found in listings.xml. Return this booking.
            }
        }
        return lists; // No listing can be found for User ID.
    }
}
