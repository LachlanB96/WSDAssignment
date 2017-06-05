/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.wsd;

/**
 *
 * @author lachlan
 */
import java.util.*;

public class FormHandler {

    private String origin;
    private String destination;
//    private String flightType;
//    private String departureDate;
//    private String returnDate;
//    private String notify;
    private Hashtable errors;

    public boolean validate() {
        boolean valid = true;
        if (origin.equals("")) {
            errors.put("origin", "Please enter your origin");
            origin = "";
            valid = false;
        }
        if (destination.equals("")) {
            errors.put("destination", "Please enter your destination");
            destination = "";
            valid = false;
        }
//        if (flightType.equals("")) {
//            errors.put("flightType", "Please enter a flight type");
//            flightType = "";
//            valid = false;
//        }
//        if (departureDate.equals("")) {
//            errors.put("departureDate", "Please enter a departure date");
//            departureDate = "";
//            valid = false;
//        }
//        if (returnDate.equals("")) {
//            errors.put("returnDate", "Please enter a return date");
//            returnDate = "";
//            valid = false;
//        }
        System.out.println(valid);

        return valid;
    }

    public String getErrorMsg(String s) {
        String errorMsg = (String) errors.get(s.trim());
        return (errorMsg == null) ? "" : errorMsg;
    }

    public FormHandler() {
        origin = "";
        destination = "";
//        flightType = "";
//        departureDate = "";
//        returnDate = "";
//        notify="";
        errors = new Hashtable();
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }
    
    public String getDestination() {
        return origin;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }
}
//  public FormBean() {
//    firstName="";
//    lastName="";
//    email="";
//    userName="";
//    password1="";
//    password2="";
//    zip="";
//    faveMusic = new String[] { "1" };
//    notify="";
//    errors = new Hashtable();
//  }
//  public String getFirstName() {
//    return firstName;
//  }
//  public String getLastName() {
//    return lastName;
//  }
//  public String getEmail() {
//    return email;
//  }
//  public String getUserName() {
//    return userName;
//  }
//  public String getPassword1() {
//    return password1;
//  }
//  public String getPassword2() {
//    return password2;
//  }
//  public String getZip() {
//    return zip;
//  }
//  public String getNotify() {
//    return notify;
//  }
//  public String[] getFaveMusic() {
//    return faveMusic;
//  }
//  public String isCbSelected(String s) {
//    boolean found=false;
//    if (!faveMusic[0].equals("1")) {
//      for (int i = 0; i < faveMusic.length; i++) {
//        if (faveMusic[i].equals(s)) {
//          found=true;  
//          break;
//        }
//      }
//      if (found) return "checked";
//    } 
//    return "";
//  }
//  public String isRbSelected(String s) {
//    return (notify.equals(s))? "checked" : "";
//  }
//  public void setFirstName(String fname) {
//    firstName =fname;
//  }
//  public void setLastName(String lname) {
//    lastName =lname;
//  }
//  public void setEmail(String eml) {
//    email=eml;
//  }
//  public void setUserName(String u) {
//    userName=u;
//  }
//  public void  setPassword1(String p1) {
//    password1=p1;
//  }
//  public void  setPassword2(String p2) {
//    password2=p2;
//  }
//  public void setZip(String z) {
//    zip=z;
//  }
//  public void setFaveMusic(String[] music) {
//    faveMusic=music;
//  }
//  public void setErrors(String key, String msg) {
//    errors.put(key,msg);
//  }
//  public void setNotify(String n) {
//    notify=n;
//  }
//}
