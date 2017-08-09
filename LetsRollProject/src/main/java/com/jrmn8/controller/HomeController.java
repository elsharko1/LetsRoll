package com.jrmn8.controller;

/**
 * Created by JRMN8 on 7/21/2017.
 */

import com.jrmn8.dao.Dao;
import com.jrmn8.dto.Event;
import com.jrmn8.factory.DaoFactory;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONString;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import java.sql.*;
import java.util.ArrayList;

@Controller
public class HomeController {

    Dao dao = DaoFactory.getInstance(DaoFactory.HIBERNATE);
    HttpClient http = HttpClientBuilder.create().build();

    @RequestMapping("/")

    public ModelAndView helloWorld() {
        // Upon clicking login, user is sent to Eventful
        // We should have perhaps a separate page for receiving the Eventful Login once a user has logged in

        return new ModelAndView("welcome", "message", "Hello World");
    }

    @RequestMapping("/loginLanding")
    public String loginLanding(Model model) {
        // this page should receive a user once they have gone through with an eventful login.
        // this page as well should run back end operations to see if they exist in our Database
        // if they do not, we should redirect them to a Registration Profile page so they can save their information
        // that they alter into our database. We will henceforth pull that information using their Eventful ID
        // on subsequent logins after they've registered for the first time.
        // If they already exist in our database, we will send them to the HOME page.

        // So what we'll need to do then is in this page, return two different views based on the condition of if they
        // exist or not in our database.
        boolean exists = false;
        // if (exists) return homepage(model);
        // else (They don't exist, so we return registration) -> return profileReg(model);
        return "";
    }

    @RequestMapping("/profileReg")
    public String profileRegistration(Model model) {
        // this page is redirected from our "LoginLanding" page.
        // only shows up if user needs to register
        // Most fields will already be pre-populated
        // such as Name, email address, and location
        // the only input we need from the user is Skills.

        return "profileReg";
    }

    @RequestMapping("/profileAdd")
    public String profileAdd(Model model) {
        // we do some JDBC query work here and pass back our User + Skills to the database.
        // then display all user fields similar to our Profile.jsp

        // add attributes to the model [likely]
        // model.addattribute.

        return profilePage(model);
    }

    @RequestMapping("/login")
    public String hello(Model model) {
        model.addAttribute("message", "Please Login");
        //this is a test comment
        return "loginpage";
    }

    @RequestMapping("/homepage")
    public String homePage(Model model) {
        // just a buncha links
        return "homepage";
    }

    @RequestMapping("/profile")
    public String profilePage(Model model) {

        return "profile";
    }

    @RequestMapping("/createevent")
    public String createEventPage(Model model) {
        // in this page, we will create an event with the following fields:
        // all Eventful fields AND [Skills required, Accommodations].
        // Passing into the database will be userID and all the fields above.
        // as a Post-MVP milestone, maybe pass back to Eventful?
        return "createevent";
    }

    @RequestMapping(value = {"/searchresults"}, method = RequestMethod.GET)
    public ModelAndView searchResultsPage(Model model) {
        // we should utilize the criteria we are passed in from the homepage
        // in here [so we'll need to use @RequestParam] and then search through
        // the API database to return certain events

        try {
            String apiKey = "9jgSrPMqWvRQm37Q";
            String oAuthConsumerKey = "b0a69fd8c5696e3c7221";
            String oAuthConsumerSecret = "161e1240e25025e9619e";
            // keywords field below will be the parameter the user inputs;
            // use JDBC to call user details and GET THEIR CITY LOCATION.
            // will prepopulate the location field of the search bar with that information.
            String keywords = "Detroit";
            String text = "";
            ArrayList<Event> eventList = new ArrayList<Event>();

            HttpHost host = new HttpHost("api.eventful.com", 80, "http");
            HttpGet getPage = new HttpGet("/json/events/search?app_key=" + apiKey + "&keywords=" + keywords);
            HttpResponse response = http.execute(host, getPage);
            String jsonString = EntityUtils.toString(response.getEntity());
            JSONObject json = new JSONObject(jsonString);
            System.out.println("Response code: " + response.getStatusLine().getStatusCode());

            JSONObject object = json.getJSONObject("events");
            JSONArray array = object.getJSONArray("event");

            for (int i = 0; i < array.length(); i++) {
                Event event = new Event();
                // venue name
                // description,title, city name, venue address, venueid, owner, going_null, created, venue_url,
                // start_time, postal_code
                event.setPostal_code(array.getJSONObject(i).getString("postal_code"));
                event.setGoing_count(array.getJSONObject(i).getString("going_count"));
                event.setUrl(array.getJSONObject(i).getString("url"));
                event.setId(array.getJSONObject(i).getString("id"));
                event.setCity_name(array.getJSONObject(i).getString("city_name"));
                event.setRegion_name(array.getJSONObject(i).getString("region_name"));
                event.setStart_time(array.getJSONObject(i).getString("start_time"));
                event.setDescription(array.getJSONObject(i).getString("description"));
                event.setVenue_display(array.getJSONObject(i).getString("venue_display"));
                event.setPerformers(array.getJSONObject(i).getString("performers"));
                event.setTitle(array.getJSONObject(i).getString("title"));
                event.setVenue_address(array.getJSONObject(i).getString("venue_address"));
                event.setVenue_id(array.getJSONObject(i).getString("venue_id"));
                event.setVenue_name(array.getJSONObject(i).getString("venue_name"));
                event.setVenue_url(array.getJSONObject(i).getString("venue_url"));

                eventList.add(event);
            }
            model.addAttribute("jsonPageData", eventList);

        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        // should go to searchresults.jsp, but at the moment that isn't set up for our JSON yet.
        // let's get that done later.
        return new ModelAndView("jsonData", "message", model);
    }

    @RequestMapping("/feedbackpage")
    public String feedbackPage(Model model) {
        // so in our database we have a userevents table
        // this links userid with eventid that they are participating in
        // additionally there is a field for feedback
        // and so we do a few checks - has date of event passed? has user already inputted feedback for this event?
        // grace period for feedback? Can't let user give feedback for event several months prior.

        // Directed prompts above a text field to take in feedback. Ask:
        // Were the accessbility options valid? Did the Event Coordinator do what he was supposed to?
        // Other comments. God this is gonna be a potato to code. SQL fun! How to set up table later?


        return "feedbackpage";
    }

    @RequestMapping("/eventdetails")
    public String eventDetails(Model model) {
        // takes in a EVENT OBJECT (@REQUESTPARAM (EventID) -> Event object?)
        // SCREW IT I'M MAKING AN EVENT OBJECT CLASS

        // ToString? and format on JSP page.
        // ability to attend or volunteer will be on this page

        return "eventdetails";
    }

    @RequestMapping("/attendorvolunteer")
    public String attendOrVolunteer(Model model) {

        // click attend to attend! Database will be updated and event will be added
        // to users events attending. Otherwise, as a volunteer, confirmation page
        // and event coordinator SHOULD receive volunteer list + emails.
        // however, I have no idea how I'd implement that right now
        // but we should have it work as so.
        return "attendorvolunteer";
    }

    @RequestMapping("/confirmationpage")
    public String confirmation(Model model) {
        // confirms you're attending or volunteering.
        // return event details on the page so user knows what event they just registered for.
        return "confirmationpage";
    }

    @RequestMapping("/yourevents")
    public String yourEventsPage(Model model) {
        // this should show the events you're attending
        // whether you're just an attendee, a volunteer, or the coordinator!
        // does some queries to pull out events that possess the userID.
        // sorting the results, make them all mutually exclusive
        // first display just attending, then ones you're volunteering at, and finally ones you're coordinating.

        // if you're coordinating, under "events you're coordinating" there'll be a list of volunteers per event
        // Should also display feedback once date has passed.
        // display everything

        return "yourevents";
    }

    //SpringTiles -> Omnipresent header -> Logout button if we learn how to use it.
    // if not, leave logout button on Home Page.
}
