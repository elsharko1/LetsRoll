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
     * Check searchResults() for the usage! [Around Line 276]
     */
    HttpClient http = HttpClientBuilder.create().build();

    /**
     * Configuration and SessionFactory will be used for the DAO.
     */
    Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
    SessionFactory sessionFact = cfg.buildSessionFactory();

    /**
     * The app launches on this welcome page, checks if the user is already logged in and if not, upon clicking login,
     * the user is prompted to log in through Google OAUTH2. Request is the session, and holds all our session data,
     * including a cookie that holds the userID we receive from google upon successful login.
     */
    @RequestMapping("/")
    public ModelAndView helloWorld(HttpServletRequest request) {

        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("homepage", "status", "You are now welcome to create an event!");
        }

        return new ModelAndView("welcome", "", "");

    }

    /**
     * A user is redirected to the homepage after logging in through Google. Utilizing a GoogleOAUTH class we've made,
     * we utilize a String code that we receive from google to pull valid user details from google. These user details are
     * then put into our database, and the userID received from google is stored in a cookie. Then, we direct to the homepage
     * view that allows a user to:
     * <p>
     * - Edit their profile
     * - Create an event
     * - View events they're participating in
     * - Search events with a keyword.
     */
    @RequestMapping("/homepage")
    public ModelAndView homePage(Model model, HttpServletRequest request, HttpServletResponse response) {

        // Check GoogleOAUTH class for information.
        GoogleOAUTH.buildGoogleOAUTH();
        String code = request.getParameter("code");
        UsersEntity currentUser = new UsersEntity();

        /** We take the userInfo received and populate a UserEntity (currentUser) with the data,
         *  Code != null because if the user refreshes the page, we try to build a code again. However, that
         *  code is going to be null. This is just an inherent problem with refreshing or revisiting the home page.
         *  This is a workaround for now, and will be polished up after.
         */
        if (code != null) {
            try {
                org.json.simple.JSONObject userInfo = GoogleOAUTH.getUserInfoJson(code);
                currentUser.setUserID((String) userInfo.get("id"));
                currentUser.setFullName((String) userInfo.get("name"));
                currentUser.setEmail((String) userInfo.get("email"));
                currentUser.setSkills("");
                currentUser.setLocation("");
                UsersDao.add(currentUser);

                if (currentUser.getUserID() != null) model.addAttribute("currentuser", currentUser);
            } catch (IdentifierGenerationException E) {
                E.printStackTrace();
            }
        }

        //get user login cookie
        Cookie[] cookies = request.getCookies();
        boolean isLoggedIn = isLoggedIn(cookies);

        /** if cookie exists we send them to the home page
         *  because every time we revisit the page, currentUser = new UserEntity();
         *  and as such is a completely new object. We only want to run the addCookie()
         *  method once, and that is when the user logs in the first time around.
         */
        if (!isLoggedIn && currentUser.getUserID() != null) {
            //if no cookie exists (they are not logged in) we call usersDao.add
            UsersDao.add(currentUser);
            //set the cookie to the google userID
            response.addCookie(new Cookie("userID", currentUser.getUserID()));
            // return the proper modelandview
            return new ModelAndView("homepage", "status", "");
        }

        // are you logged in?
        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("homepage", "status", "");
        }
        return new ModelAndView("welcome", "status", "Please Login First");

    }

    /* *
     * Method to check whether a user is logged in. We check all cookies that the session has,
     * and going off that, attempt to find a cookie that has "userID" as a name. Then, we check if
     * the "userID" cookie isEmpty - if empty, then the user is clearly not logged in.
     *
     * Returns true if user is logged in, returns false is user is not logged in.
     */
    private boolean isLoggedIn(Cookie[] cookies) {
        boolean isLoggedIn = false;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userID") && !cookie.getValue().isEmpty()) {
                isLoggedIn = true;
            }
        }
        return isLoggedIn;

    }

    /**
     * This goes through our current list of cookies and searches through for the
     * userID cookie. If the cookie does not exist, then we return an equivalently named
     * cookie that has no value. ("")
     *
     * @param request is our session.
     * @return Cookie with name userID and value:
     * - Google userID if the cookie had existed
     * - Blank if the cookie did not.
     */
    private Cookie userCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("userID")) return cookies[i];
        }
        return new Cookie("userID", "");

    }

    /**
     * Displays the current user's profile. User has ability to change the profile.
     *
     * @param model   - model to add userEntity user in order to display on the jsp.
     * @param request - our session to pull our cookie.
     * @return directs us to our profile.jsp that will have our current user profile information!
     */

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

    /**
     * As the title suggests, it takes in whatever fields/edits made to said fields in the profile page
     * and saves them to the database. Then it shows a confirmation of your fields that have been saved.
     *
     * @param model   - model to add our edited userEntity user in order to display on the jsp.
     * @param request - our session to pull our cookie.
     * @return directs us to editprofile.jsp that shows a confirmation of changed profile fields.
     */

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

    /**
     * Just returns the createevent.jsp. All fields are in the jsp, so nothing is in this method.
     *
     * @return createevent.jsp. Go look at that!
     */

    @RequestMapping("/createevent")
    public ModelAndView createEventPage(HttpServletRequest request) {

        //get user login cookie
        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("createevent", "status", "You are now welcome to create an event!");
        }
        return new ModelAndView("welcome", "status", "Please Login First");

    }

    /**
     * This page comes from the homepage, after a user has entered keywords to search for in events.
     * We search in LetsRoll's Event Database and Eventful.
     * @param model - model to add our search results to
     * @param keywords - keywords to search with
     * @param request - session to pull cookies from
     * @return searchresults.jsp that displays all our valid results.
     */
    @RequestMapping("/searchresults")
    public ModelAndView searchResultsPage(Model model, @RequestParam("keywords") String keywords, HttpServletRequest request) {
        // In the following block of code, we have two keyword variables
        // one is keywords which has potential spaces, and the other is keyword (no s!)
        // that replaces the spaces with '%20'.

        // Trying to execute search from eventful. A few possible exceptions, so try/catch.
        try {
            // We make a 'spaceless' String from our keywords field to append to a URL to pass
            // to Eventful so that we do not run into any errors and get valid results.
            String keyword = keywords.replaceAll(" ", "%20");

            // apiKey is a credential given by Eventful to use in order to search their DataBase ('DB')
            String apiKey = "9jgSrPMqWvRQm37Q";

            // This is the http that we go to in order to search.
            // Using port 80 = http. Different port for https, but that's irrelevant.
            HttpHost host = new HttpHost("api.eventful.com", 80, "http");

            // Build a URL in the way that Eventful requires in order to search.
            HttpGet getPage = new HttpGet("/json/events/search?app_key=" + apiKey + "&keywords=" + keyword);

            // The HTTP page we get after we execute the above getpage.
            // this literally gets us a http page that we can theoretically view in our browser
            HttpResponse response = http.execute(host, getPage);

            // Taking the Eventful response result and putting it into a String object (but it's a json)
            // in short, reading the http page that we would have gotten above and reading it entirely into a String.
            String jsonString = EntityUtils.toString(response.getEntity());

            // taking the previous jsonString and actually making it a JSON object.
            JSONObject json = new JSONObject(jsonString);

            // "breaking down the tree"
            // Json goes from a whole JSON to an array of JSON objects
            JSONObject object = json.getJSONObject("events");
            JSONArray array = object.getJSONArray("event");

            // Parse through the array of events and utilize the values given
            // to create EventsEntity objects that we can save to the Events table in our database.
            // We utilize our DAO for the Events table (EventDao) to toss the values to our database.
            // The DAO utilizes CRUD! (Create, Read, Update, Delete)
            for (int i = 0; i < array.length(); i++) {
                EventsEntity event = new EventsEntity();

                event.setEventID(array.getJSONObject(i).getString("id"));
                event.setTitle(array.getJSONObject(i).getString("title"));
                event.setCreator(array.getJSONObject(i).getString("owner"));
                event.setLocation(array.getJSONObject(i).getString("venue_name") + array.getJSONObject(i).getString("venue_address"));
                event.setDescription(array.getJSONObject(i).getString("description"));
                model.addAttribute("date", (array.getJSONObject(i).getString("start_time")));
                event.setSkillsneeded("skill" + i);

                // Even though this says add, it's actually addorupdate
                // so no errors are thrown.
                EventDao.add(event);
            }

            // Then we use our DAO to search through our database with the keywords.
            model.addAttribute("searchresults", EventDao.getLike(keywords));

        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        }

        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("searchresults", "message", "");
        }
        return new ModelAndView("welcome", "status", "Please Login First");

    }

    /**
     * Functionality not implemented yet. This is a stretch goal.
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/feedbackpage")
    public ModelAndView feedbackPage(Model model, HttpServletRequest request) {
        // so in our database we have a userevents table
        // this links userid with eventid that they are participating in
        // additionally there is a field for feedback
        // and so we do a few checks - has date of event passed? has user already inputted feedback for this event?
        // grace period for feedback? Can't let user give feedback for event several months prior.

        // Directed prompts above a text field to take in feedback. Ask:
        // Were the accessbility options valid? Did the Event Coordinator do what he was supposed to?
        // Other comments.


        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("feedbackpage", "status", "You are now welcome to creat an event!");
        }
        return new ModelAndView("welcome", "status", "Please Login First");
    }

    /**
     * this should show the events you're attending
     * whether you're just an attendee, a volunteer, or the coordinator!
     * does some queries to pull out events that possess the userID.
     * sorting the results, make them all mutually exclusive
     * first display just attending, then ones you're volunteering at, and finally ones you're coordinating.
     * @param model - model to display events with
     * @param request - session to request cookies from.
     * @return yourevents.jsp, a page that shows events the currentUser is affiliated with.
     */
    @RequestMapping("/yourevents")
    public ModelAndView yourEventsPage(Model model, HttpServletRequest request) {

        // Should also display feedback once date has passed.[Stretch Goal]

        ArrayList<EventsEntity> created = EventDao.getExact(userCookie(request).getValue(), "creator");
        ArrayList<UserattendingEntity> attending = UserattendingDao.getExact(userCookie(request).getValue(), "userID");
        // replaces creator field(having ID number) with their full name
        for (EventsEntity e : created) {
            //get(0) because our DAO's return us a list but the list only has one true entity which
            //is the creator
            e.setCreator(UsersDao.getExact(e.getCreator(), "userID").get(0).getFullName());

        }
        ArrayList<EventsEntity> attendee = new ArrayList<EventsEntity>();
        ArrayList<EventsEntity> volunteer = new ArrayList<EventsEntity>();

        // Splits all of the events a user is attending based on whether they are violunteering or just attending
        for (UserattendingEntity u : attending) {
            if (u.getIsVolunteer() == 1) volunteer.add(EventDao.getExact(u.getEventID(), "eventID").get(0));
            if (u.getIsVolunteer() == 0) attendee.add(EventDao.getExact(u.getEventID(), "eventID").get(0));
        }

        // replaces userID field(having ID number) with their full name
        for (EventsEntity e : volunteer) {
            if (!e.getCreator().equals("evdb")) {
                e.setCreator(UsersDao.getExact(e.getCreator(), "userID").get(0).getFullName());
            }
        }

        // replaces userID field(having ID number) with their full name
        for (EventsEntity e : attendee) {
            if (!e.getCreator().equals("evdb")) {
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


    @RequestMapping("/eventcreated")
    public ModelAndView addNewEvent(@RequestParam("title") String title,
                                    @RequestParam("date") String date,
                                    @RequestParam("where") String location,
                                    @RequestParam("description") String description,
                                    @RequestParam("skillsneeded") String skills,
                                    @RequestParam("wheelchair") byte choiceW,
                                    @RequestParam("family") byte choiceF,
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
        newEvent.setLocation(location);
        newEvent.setDescription(description);
        newEvent.setSkillsneeded(skills);

        newAccess.setEventID(eventID);
        byte wheelchair = valueOf(choiceW);
        newAccess.setWheelchair(wheelchair);
        byte family = valueOf(choiceF);
        newAccess.setFamily(family);
        byte servicedog = valueOf(choiceS);
        newAccess.setServicedog(servicedog);
        byte blind = valueOf(choiceB);
        newAccess.setBlind(blind);

        EventDao.add(newEvent);
        AccessibilityDao.add(newAccess);

        model.addAttribute("newEvent", newEvent);
        model.addAttribute("newAccess", newAccess);

        if (isLoggedIn(request.getCookies())) {
            return new ModelAndView("eventcreated", "status", "You are now welcome to creat an event!");
        }
        return new ModelAndView("welcome", "status", "Please Login First");
    }

    /**
     * confirms you're attending after you click 'attend' on an event in searchresults.
     * return event details on the page so user knows what event they just registered for.
     * @param model - model to add userattending stuff to display in the confirmationpage.
     * @param eventID - eventID to match up with in Database.
     * @param request - session to request cookies.
     * @return confirmationpage.jsp that has a confirmation for whatever event you just signed up for.
     */
    @RequestMapping("/addAttendee")
    public String attend(Model model, @RequestParam("id") String eventID, HttpServletRequest request) {

        UserattendingEntity attendee = new UserattendingEntity();

        UsersEntity currentUser = UsersDao.getExact(userCookie(request).getValue(), "userID").get(0);
        EventsEntity event = EventDao.getExact(eventID, "eventID").get(0);
        AccessibilityEntity accessibility = new AccessibilityEntity();

        //a check to confirm that the event is in the accessibility table which means that accessibility
        //has been previously defined
        if (AccessibilityDao.getExact(eventID, "eventID").size() > 0) {
            accessibility = AccessibilityDao.getExact(eventID, "eventID").get(0);
        }

        if (UserattendingDao.getExact(eventID, "eventID").size() > 0) {

            UserattendingEntity userAttending = UserattendingDao.getExact(eventID, "eventID").get(0);
            if (userAttending.getUserID().equals(currentUser.getUserID()) && userAttending.getIsVolunteer() == 0) {
                model.addAttribute("message", "You've already signed up to attend.");
            }
        }

        //this is putting the user down for attending the event
        attendee.setEventID(eventID);
        attendee.setUserID(userCookie(request).getValue());
        attendee.setIsVolunteer((byte) 0);
        UserattendingDao.add(attendee);

        //this actually prints the conversation
        model.addAttribute("event", event);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("attendee", attendee);
        model.addAttribute("accessibility", accessibility);
        return "confirmationpage";
    }
    /**
     * confirms you're volunteering after clicking 'volunteer' on an event in searchresults.
     * return event details on the page so user knows what event they just registered for.
     * @param model - model to add userattending stuff to display in the confirmationpage.
     * @param eventID - eventID to match up with in Database.
     * @param request - session to request cookies.
     * @return confirmationpage.jsp that has a confirmation for whatever event you just signed up for.
     */
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

                //this sets the life span of the cookie to 0, so now it expires immediately and
                //therefore logs you out of the system
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        return "welcome";
    }
}
