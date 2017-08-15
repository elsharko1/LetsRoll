package com.jrmn8.controller;

/**
 * Created by JRMN8 on 7/21/2017.
 */

import com.jrmn8.*;
import com.jrmn8.dao.AccessibilityDao;
import com.jrmn8.dao.EventDao;
import com.jrmn8.dao.UserattendingDao;
import com.jrmn8.dao.UsersDao;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.hibernate.criterion.Restrictions;
import org.hibernate.id.IdentifierGenerationException;
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

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static java.lang.Byte.valueOf;

/**
 * Controller class that manages the interaction between web views
 * and models.
 */
@Controller
public class HomeController {

    /**
     * HttpClient object will be used for Eventful data pull.
     */
    HttpClient http = HttpClientBuilder.create().build();

    /**
    *Configuration and SessionFactory will be used for the DAO.
    */
     Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
    SessionFactory sessionFact = cfg.buildSessionFactory();

    /**
     * The app launches on this welcome page, checks if the user is already logged in and if not, upon clicking login,
     * the user is logged in through Google OAUTH2. Request is the session. Return is the homepage or welcome
     * page based on whether the user is logged in.
     */
    @RequestMapping("/")
    public ModelAndView helloWorld(HttpServletRequest request) {

        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("homepage", "status", "You are now welcome to create an event!");
        }
        return new ModelAndView("welcome", "status", "");
    }

    /**
     */
    @RequestMapping("/homepage")
    public String homePage(Model model, HttpServletRequest request,
                           HttpServletResponse response) {

        final GoogleOAUTH google = new GoogleOAUTH();
        String code = request.getParameter("code");
        System.out.println(code);
        UsersEntity currentUser = new UsersEntity();

        if (code != null) {
            try {
                org.json.simple.JSONObject userInfo = google.getUserInfoJson(code);
                currentUser.setUserID((String) userInfo.get("id"));
                currentUser.setFullName((String) userInfo.get("name"));
                currentUser.setEmail((String) userInfo.get("email"));
                currentUser.setSkills("");
                currentUser.setLocation("");
                UsersDao.add(currentUser);

                if (currentUser.getUserID() != null) model.addAttribute("currentuser", currentUser);
            } catch (IdentifierGenerationException E) {
                System.out.println("YOU REFRESHED THE PAGE!!!");
            }
        }

        //get user login cookie
        Cookie[] cookies = request.getCookies();
        boolean isLoggedIn = isLoggedIn(cookies);

        //if cookie exists we send them to the home page
        if (!isLoggedIn && currentUser.getUserID() != null) {
            //if no cookie exists (they are not logged in) we call usersDao.add
            UsersDao.add(currentUser);
            //set the cookie to the google number
            response.addCookie(new Cookie("userID", currentUser.getUserID()));
        }
        return "homepage";
}

    private boolean isLoggedIn(Cookie[] cookies) {
        boolean isLoggedIn = false;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userID") && cookie.getValue().isEmpty() == false) {
                isLoggedIn = true;
            }
        }
        return isLoggedIn;
    }

    private Cookie userCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("userID")) return cookies[i];
        }
        return new Cookie("userID", "");
    }

    @RequestMapping("/profile")
    public ModelAndView profilePage(Model model, HttpServletRequest request) {

        Cookie cook = userCookie(request);
        UsersEntity user = UsersDao.getExact(cook.getValue(), "userID").get(0);
        model.addAttribute("user", user);
        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("profile", "model", "");
        }
        return new ModelAndView("welcome", "status", "Please Login First");


    }

    @RequestMapping("/editprofile")
    public ModelAndView editprofilePage(Model model, HttpServletRequest request) {

        String userID = userCookie(request).getValue();
        UsersEntity user = new UsersEntity();
        user.setFullName(request.getParameter("fullName"));
        user.setUserID(userID);
        user.setSkills(request.getParameter("skills"));
        user.setLocation(request.getParameter("location"));
        user.setEmail(request.getParameter("email"));
        UsersDao.update(user);

        model.addAttribute("user", user);

        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("editprofile", "model", "");
        }
        return new ModelAndView("welcome", "status", "Please Login First");


    }

    @RequestMapping("/createevent")
    public ModelAndView createEventPage(Model model, HttpServletRequest request) {
        // in this page, we will create an event with the following fields:
        // all Eventful fields AND [Skills required, Accommodations].
        // Passing into the database will be userID and all the fields above.
        // as a Post-MVP milestone, maybe pass back to Eventful?

/*        EventDao eventDao = DaoFactory.getInstance(EventDao);
        boolean status = eventDao.addEvent(event);

        //return createevent or confirmation?
        return new ModelAndView("createevent", "status", status);*/


//get user login cookie
        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("createevent", "status", "You are now welcome to create an event!");
        }
        return new ModelAndView("welcome", "status", "Please Login First");


    }

    @RequestMapping(value = {"/searchresults"}, method = RequestMethod.GET)
    public ModelAndView searchResultsPage(Model model, @RequestParam("keywords") String keywords, HttpServletRequest request) {
        // we should utilize the criteria we are passed in from the homepage
        // in here [so we'll need to use @RequestParam] and then search through
        // the API database to return certain events

        try {
            String keyword = keywords.replaceAll(" ", "%20");

            String apiKey = "9jgSrPMqWvRQm37Q";
            String oAuthConsumerKey = "b0a69fd8c5696e3c7221";
            String oAuthConsumerSecret = "161e1240e25025e9619e";
            // keywords field below will be the parameter the user inputs;
            // use JDBC to call user details and GET THEIR CITY LOCATION.
            // will prepopulate the location field of the search bar with that information.
            ArrayList<EventsEntity> eventList = new ArrayList<EventsEntity>();

            HttpHost host = new HttpHost("api.eventful.com", 80, "http");
            // maybe remove all spaces inside keywords before searching
            HttpGet getPage = new HttpGet("/json/events/search?app_key=" + apiKey + "&keywords=" + keyword);
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

                EventDao.add(event);
            }
            model.addAttribute("searchresults", EventDao.getLike(keywords));

        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        /*} catch (ParseException e) {
            e.printStackTrace();*/
        }
        // should go to searchresults.jsp, but at the moment that isn't set up for our JSON yet.
        // let's get that done later.

        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("searchresults", "message", "");
        }
        return new ModelAndView("welcome", "status", "Please Login First");


    }

    @RequestMapping("/feedbackpage")
    public ModelAndView feedbackPage(Model model, HttpServletRequest request) {
        // so in our database we have a userevents table
        // this links userid with eventid that they are participating in
        // additionally there is a field for feedback
        // and so we do a few checks - has date of event passed? has user already inputted feedback for this event?
        // grace period for feedback? Can't let user give feedback for event several months prior.

        // Directed prompts above a text field to take in feedback. Ask:
        // Were the accessbility options valid? Did the Event Coordinator do what he was supposed to?
        // Other comments. God this is gonna be a potato to code. SQL fun! How to set up table later?


        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("feedbackpage", "status", "You are now welcome to creat an event!");
        }
        return new ModelAndView("welcome", "status", "Please Login First");
    }

    @RequestMapping("/eventdetails")
    public ModelAndView eventDetails(Model model, HttpServletRequest request) {
        // takes in a EVENT OBJECT (@REQUESTPARAM (EventID) -> Event object?)
        // SCREW IT I'M MAKING AN EVENT OBJECT CLASS

        // ToString? and format on JSP page.
        // ability to attend or volunteer will be on this page


        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("eventdetails", "status", "You are now welcome to creat an event!");
        }
        return new ModelAndView("welcome", "status", "Please Login First");
    }

    @RequestMapping("/attendorvolunteer")
    public ModelAndView attendOrVolunteer(Model model, HttpServletRequest request) {

        // click attend to attend! Database will be updated and event will be added
        // to users events attending. Otherwise, as a volunteer, confirmation page
        // and event coordinator SHOULD receive volunteer list + emails.
        // however, I have no idea how I'd implement that right now
        // but we should have it work as so.

        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("attendorvolunteer", "status", "You are now welcome to creat an event!");
        }
        return new ModelAndView("welcome", "status", "Please Login First");


    }

    @RequestMapping("/confirmationpage")
    public ModelAndView confirmation(Model model, HttpServletRequest request) {
        // confirms you're attending or volunteering.
        // return event details on the page so user knows what event they just registered for.

        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("confirmationpage", "status", "You are now welcome to creat an event!");
        }
        return new ModelAndView("welcome", "status", "Please Login First");
    }

    @RequestMapping("/yourevents")
    public ModelAndView yourEventsPage(Model model, HttpServletRequest request) {
        // this should show the events you're attending
        // whether you're just an attendee, a volunteer, or the coordinator!
        // does some queries to pull out events that possess the userID.
        // sorting the results, make them all mutually exclusive
        // first display just attending, then ones you're volunteering at, and finally ones you're coordinating.

        // if you're coordinating, under "events you're coordinating" there'll be a list of volunteers per event
        // Should also display feedback once date has passed.
        // display everything

        ArrayList<EventsEntity> created = EventDao.getExact(userCookie(request).getValue(), "creator");
        ArrayList<UserattendingEntity> attending = UserattendingDao.getExact(userCookie(request).getValue(), "userID");
        for (EventsEntity e : created) {
            e.setCreator(UsersDao.getExact(e.getCreator(), "userID").get(0).getFullName());

        }
        ArrayList<EventsEntity> attendee = new ArrayList<EventsEntity>();
        ArrayList<EventsEntity> volunteer = new ArrayList<EventsEntity>();

        for (UserattendingEntity u : attending) {
            if (u.getIsVolunteer() == 1) volunteer.add(EventDao.getExact(u.getEventID(), "eventID").get(0));
            if (u.getIsVolunteer() == 0) attendee.add(EventDao.getExact(u.getEventID(), "eventID").get(0));
        }

        for (EventsEntity e: volunteer) {
            if(!e.getCreator().equals("evdb")) {
                e.setCreator(UsersDao.getExact(e.getCreator(), "userID").get(0).getFullName());
            }
        }

        for (EventsEntity e: attendee) {
            if(!e.getCreator().equals("evdb")) {
                e.setCreator(UsersDao.getExact(e.getCreator(), "userID").get(0).getFullName());
            }
        }
        model.addAttribute("created", created);
        model.addAttribute("attendee", attendee);
        model.addAttribute("volunteer", volunteer);


        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("yourevents", "status", model);
        }
        return new ModelAndView("welcome", "status", "Please Login First");
    }

    //SpringTiles -> Omnipresent header -> Logout button if we learn how to use it.
    // if not, leave logout button on Home Page.

    // testing database information pull.

    @RequestMapping("/test")
    public ModelAndView test(Model model, @RequestParam("userName") String username,
                             HttpServletRequest request) {
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

        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("test", "status", "You are now welcome to creat an event!");
        }
        return new ModelAndView("welcome", "status", "Please Login First");
    }


    @RequestMapping("/adduser")
    public ModelAndView newUser(HttpServletRequest request) {

        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("adduser", "status", "You are now welcome to creat an event!");
        }
        return new ModelAndView("welcome", "status", "Please Login First");
    }

    @RequestMapping("/addinguser")
    public ModelAndView addNewUser(@RequestParam("eventfulUserName") String username,
                                   @RequestParam("email") String email,
                                   @RequestParam("location") String location,
                                   @RequestParam("skills") String skills,
                                   @RequestParam("fullName") String fullname, Model model,
                                   HttpServletRequest request) {


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

        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("addUserSuccess", "status", "You are now welcome to creat an event!");
        }
        return new ModelAndView("welcome", "status", "Please Login First");

    }

    @RequestMapping("/eventcreated")
    public ModelAndView addNewEvent(@RequestParam("title") String title,
                                    @RequestParam("date") String date,
                                    @RequestParam("where") String location,
                                    @RequestParam("description") String description,
                                    @RequestParam("skillsneeded") String skills,
                                    @RequestParam("wheelchair") String choiceW,
                                    @RequestParam("family") String choiceF,
                                    @RequestParam("servicedog") byte choiceS,
                                    @RequestParam("blind") byte choiceB,
                                    Model model, HttpServletRequest request) {


        EventsEntity newEvent = new EventsEntity();
        int ID = (int) (Math.random() * 10000000);
        String eventID = String.valueOf(ID);
        AccessibilityEntity newAccess = new AccessibilityEntity();

        newEvent.setEventID(eventID);
        newEvent.setTitle(title);
        newEvent.setCreator(userCookie(request).getValue());
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
//        return "eventcreated";
//    }
        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("eventcreated", "status", "You are now welcome to creat an event!");
        }
        return new ModelAndView("welcome", "status", "Please Login First");
    }

    @RequestMapping("/registered")

    public ModelAndView adduser(@RequestParam("fullName") String fullName,
                                @RequestParam("location") String location,
                                Model model, HttpServletRequest request) {


        model.addAttribute("fullName", fullName);
        model.addAttribute("location", location);


//        return new ModelAndView("registrationComplete", "message" , model);
//    }
        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("registrationComplete", "message", model);
        }
        return new ModelAndView("welcome", "status", "Please Login First");
    }

    @RequestMapping("/registration")

    public ModelAndView register(HttpServletRequest request) {

//        return "registration";
//    }
        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("registration", "status", "You are now welcome to creat an event!");
        }
        return new ModelAndView("welcome", "status", "Please Login First");
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


    @RequestMapping("/addAttendee")
    public String attend(Model model, @RequestParam("id") String eventID, HttpServletRequest request) {

        UserattendingEntity attendee = new UserattendingEntity();

        UsersEntity currentUser = UsersDao.getExact(userCookie(request).getValue(), "userID").get(0);
        EventsEntity event = EventDao.getExact(eventID, "eventID").get(0);
        AccessibilityEntity accessibility = new AccessibilityEntity();
        if (AccessibilityDao.getExact(eventID, "eventID").size() > 0) {
            accessibility = AccessibilityDao.getExact(eventID, "eventID").get(0);
        }

        if (UserattendingDao.getExact(eventID, "eventID").size() > 0) {

            UserattendingEntity userAttending = UserattendingDao.getExact(eventID, "eventID").get(0);
            if (userAttending.getUserID().equals(currentUser.getUserID()) && userAttending.getIsVolunteer() == 0) {
                model.addAttribute("message", "You've already signed up to attend.");
            }
        }


        attendee.setEventID(eventID);
        attendee.setUserID(userCookie(request).getValue());
        attendee.setIsVolunteer((byte) 0);
        UserattendingDao.add(attendee);

        model.addAttribute("event", event);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("attendee", attendee);
        model.addAttribute("accessibility", accessibility);
        return "confirmationpage";
    }

    @RequestMapping("/addVolunteer")
    public String volunteer(Model model, @RequestParam("id") String eventID, HttpServletRequest request) {

        UserattendingEntity volunteer = new UserattendingEntity();

        UsersEntity currentUser = UsersDao.getExact(userCookie(request).getValue(), "userID").get(0);
        EventsEntity event = EventDao.getExact(eventID, "eventID").get(0);

        AccessibilityEntity accessibility = new AccessibilityEntity();
        if (AccessibilityDao.getExact(eventID, "eventID").size() > 0) {
            accessibility = AccessibilityDao.getExact(eventID, "eventID").get(0);
        }

        if (UserattendingDao.getExact(eventID, "eventID").size() > 0) {

            UserattendingEntity userVolunteering = UserattendingDao.getExact(eventID, "eventID").get(0);

            if (userVolunteering.getUserID().equals(currentUser.getUserID()) && userVolunteering.getIsVolunteer() == 1) {
                model.addAttribute("message", "You've already signed up to volunteer.");
            }
        }

        volunteer.setEventID(eventID);
        volunteer.setUserID(userCookie(request).getValue());
        volunteer.setIsVolunteer((byte) 1);
        UserattendingDao.add(volunteer);
        model.addAttribute("event", event);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("attendee", volunteer);
        model.addAttribute("accessibility", accessibility);

        return "confirmationpage";
    }

    @RequestMapping("/logout")
    public String logOut(HttpServletRequest request, HttpServletResponse response) {

        //get user login cookie
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userID") && cookie.getValue().isEmpty() == false) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        return "welcome";
    }
}
