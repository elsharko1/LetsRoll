package com.jrmn8.controller;

/**
 * Created by JRMN8 on 7/21/2017.
 */

import com.jrmn8.AccessibilityEntity;
import com.jrmn8.EventsEntity;
import com.jrmn8.GoogleOAUTH;
import com.jrmn8.UsersEntity;
import com.jrmn8.dao.AccessibilityDao;
import com.jrmn8.dao.EventDao;
import com.jrmn8.dao.UsersDao;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.hibernate.criterion.Restrictions;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import javax.servlet.http.HttpServletRequest;

import static java.lang.Byte.valueOf;

@Controller
public class HomeController {

    //Dao dao = DaoFactory.getInstance(DaoFactory.HIBERNATE);
    HttpClient http = HttpClientBuilder.create().build();
    Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
    SessionFactory sessionFact = cfg.buildSessionFactory();

    @RequestMapping("/")

    public ModelAndView helloWorld() {
        // Upon clicking login, user is sent to Eventful
        // We should have perhaps a separate page for receiving the Eventful Login once a user has logged in

        return new ModelAndView("welcome", "message", "Hello World");
    }

    @RequestMapping("/loginLanding")
    public String loginLanding(Model model) {

        // this page should receive a user once they have gone through with a facebook login.
        // this page as well should run back end operations to see if they exist in our Database
        // if they do not, we should redirect them to a Registration Profile page so they can save their information
        // that they alter into our database. We will henceforth pull that information using their userID
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

    @RequestMapping("/homepage")
    public String homePage(Model model,HttpServletRequest request, @RequestParam("code") String code) {

        // just a buncha links
        request.getSession().setAttribute("test", "tester");
        model.addAttribute("named", "RRen");

        final GoogleOAUTH google = new GoogleOAUTH();

        org.json.simple.JSONObject userInfo = google.getUserInfoJson(code);
        UsersEntity currentUser = new UsersEntity();
        currentUser.setUserID((String)userInfo.get("id"));
        currentUser.setFullName((String)userInfo.get("name"));
        currentUser.setEmail((String)userInfo.get("email"));
        currentUser.setSkills("");
        currentUser.setLocation("");

        model.addAttribute("currentuser", currentUser);

        UsersDao.add(currentUser);

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

/*        EventDao eventDao = DaoFactory.getInstance(EventDao);
        boolean status = eventDao.addEvent(event);

        //return createevent or confirmation?
        return new ModelAndView("createevent", "status", status);*/

        return "createevent";
    }

    @RequestMapping(value = {"/searchresults"}, method = RequestMethod.GET)
    public ModelAndView searchResultsPage(Model model, @RequestParam("keywords") String keywords) {
        // we should utilize the criteria we are passed in from the homepage
        // in here [so we'll need to use @RequestParam] and then search through
        // the API database to return certain events

        try {
            keywords = keywords.replaceAll(" ", "%20");

            String apiKey = "9jgSrPMqWvRQm37Q";
            String oAuthConsumerKey = "b0a69fd8c5696e3c7221";
            String oAuthConsumerSecret = "161e1240e25025e9619e";
            // keywords field below will be the parameter the user inputs;
            // use JDBC to call user details and GET THEIR CITY LOCATION.
            // will prepopulate the location field of the search bar with that information.
            ArrayList<EventsEntity> eventList = new ArrayList<EventsEntity>();

            HttpHost host = new HttpHost("api.eventful.com", 80, "http");
            // maybe remove all spaces inside keywords before searching
            HttpGet getPage = new HttpGet("/json/events/search?app_key=" + apiKey + "&keywords=" + keywords);
            HttpResponse response = http.execute(host, getPage);
            String jsonString = EntityUtils.toString(response.getEntity());
            JSONObject json = new JSONObject(jsonString);
            System.out.println("Response code: " + response.getStatusLine().getStatusCode());

            JSONObject object = json.getJSONObject("events");
            JSONArray array = object.getJSONArray("event");

            DateFormat df = new SimpleDateFormat("yyyy-MM-dd-kk.mm.ss.SSS");

            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");

            for (int i = 0; i < array.length(); i++) {
                EventsEntity event = new EventsEntity();
                // venue name
                // description,title, city name, venue address, venueid, owner, going_null, created, venue_url,
                // start_time, postal_code

                event.setEventID(array.getJSONObject(i).getString("id"));
                event.setTitle(array.getJSONObject(i).getString("title"));
                event.setCreator(array.getJSONObject(i).getString("owner"));
                event.setLocation(array.getJSONObject(i).getString("venue_name") + array.getJSONObject(i).getString("venue_address"));
                event.setDescription(array.getJSONObject(i).getString("description"));
                /*event.setDate((Timestamp) df.parse(array.getJSONObject(i).getString("start_time")));*/
                model.addAttribute("date", (array.getJSONObject(i).getString("start_time")));
                /*model.addAttribute("date", (Timestamp) dateFormat.parse(array.getJSONObject(i).getString("start_time")));*/
                event.setSkillsneeded("skill" + i);

                eventList.add(event);
            }
            model.addAttribute("jsonPageData", eventList);

        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        /*} catch (ParseException e) {
            e.printStackTrace();*/
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

    // testing database information pull.

    @RequestMapping("/test")
    public String test(Model model, @RequestParam("userName") String username) {
        Session selectUsers = sessionFact.openSession();

        selectUsers.beginTransaction();

        // Criteria is used to create the query
        Criteria c = selectUsers.createCriteria(UsersEntity.class);

        // results are returned as list and cast to an ArrayList

        c.add(Restrictions.like("userID", "%" + username + "%"));
        ArrayList<UsersEntity> users = (ArrayList<UsersEntity>) c.list();
        ArrayList<String> userstostring = new ArrayList<String>();
        for (int i = 0; i < users.size(); i++) {
            userstostring.add(users.get(i).toString());
        }
        model.addAttribute("users", userstostring);
        return "test";
    }

    @RequestMapping("/adduser")
    public String newUser() {
        return "adduser";
    }

    @RequestMapping("/addinguser")
    public String addNewUser(@RequestParam("eventfulUserName") String username,
                                 @RequestParam("email") String email,
                                 @RequestParam("location") String location,
                                 @RequestParam("skills") String skills,
                                 @RequestParam("fullName") String fullname, Model model) {


        Session session = sessionFact.openSession();

        Transaction tx = session.beginTransaction();

        UsersEntity newUser = new UsersEntity();

        newUser.setUserID(username);
        newUser.setEmail(email);
        newUser.setLocation(location);
        newUser.setSkills(skills);
        newUser.setFullName(fullname);

        session.save(newUser);
        tx.commit();
        session.close();

        model.addAttribute("newStuff", newUser);
        return "addUserSuccess";
    }

    @RequestMapping("/eventcreated")
    public String addNewEvent(@RequestParam("title") String title,
                             @RequestParam("date") String date,
                             //@RequestParam("repeat") String repeat,
                             @RequestParam("where") String location,
                             //@RequestParam("choice") String choice,
                              @RequestParam("creator") String creator,
                             @RequestParam("description") String description,
                             @RequestParam("skillsneeded") String skills,
                             @RequestParam("wheelchair") String choiceW,
                            @RequestParam("family") String choiceF,
                             @RequestParam("servicedog") byte choiceS,
                             @RequestParam("blind") byte choiceB,
                             Model model) {



        EventsEntity newEvent = new EventsEntity();
        int ID = (int) (Math.random() * 10000000);
        String eventID = String.valueOf(ID);
        AccessibilityEntity newAccess = new AccessibilityEntity();

        newEvent.setEventID(eventID);
        newEvent.setTitle(title);
        newEvent.setCreator(creator);
        newEvent.setDate(date);
        //newEvent.setRepeat(repeat);
        newEvent.setLocation(location);
        newEvent.setDescription(description);
        newEvent.setSkillsneeded(skills);
        //newEvent.setCreator(creator);
        //newEvent.setChoice(choice);
        newAccess.setEventID(eventID);
        byte wheelchair = valueOf(choiceW);
        newAccess.setWheelchair(wheelchair);
        byte family = valueOf(choiceF);
        newAccess.setFamily(family);
        byte servicedog = valueOf(choiceS);
        newAccess.setServicedog(servicedog);
        byte blind = valueOf(choiceB);
        newAccess.setBlind(blind);
//        newAccess.setFamily(accessF);
//        newAccess.setServicedog(accessS);
//        newAccess.setBlind(accessB);


        Session session = sessionFact.openSession();
        Transaction tx = session.beginTransaction();
        EventDao.add(newEvent);
        AccessibilityDao.add(newAccess);
        session.save(newAccess);


//        model.addAttribute("eventID", eventID);
//        model.addAttribute("title", title);
//        model.addAttribute("where", location);
        model.addAttribute("newEvent", newEvent);
        model.addAttribute("newAccess", newAccess);
        return "eventcreated";
    }

    @RequestMapping("/registered")

    public ModelAndView adduser(@RequestParam("fullName") String fullName,
                                @RequestParam("location") String location,
                                Model model) {


        model.addAttribute("fullName",fullName);
        model.addAttribute("location",location);


        return new ModelAndView("registrationComplete", "message" , model);
    }

    @RequestMapping("/registration")

    public String register() {
        return "registration";
    }

    @RequestMapping("/welcome")

    public ModelAndView welcome() {
        return new
                ModelAndView("/loginpage", "message", "Welcome!");

    }

    @RequestMapping("log")

    public String welcomeGreeting() {
        return "/loginpage";

    }

    @RequestMapping("daofield")
    public String daoField() {
        return "daofield";
    }

    @RequestMapping("daotest")

    public String daoTest(Model model, @RequestParam("daofield") String daofield, @RequestParam("wheelchair") byte choiceW,
                          @RequestParam("family") byte choiceF,
                          @RequestParam("servicedog") byte choiceS,
                          @RequestParam("blind") byte choiceB) {
        model.addAttribute("dao", AccessibilityDao.get(daofield, choiceW, choiceB, choiceS, choiceF));
        return "daotest";
    }

}
