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

@Controller
public class HomeController {

    Dao dao = DaoFactory.getInstance(DaoFactory.HIBERNATE);
    HttpClient http = HttpClientBuilder.create().build();

    @RequestMapping("/")

    public ModelAndView helloWorld() {
        return new ModelAndView("welcome", "message", "Hello World");
    }

    @RequestMapping(value = {"getjson"}, method = RequestMethod.GET)
    public ModelAndView getJSON(Model model) {

        try {
            String apiKey = "9jgSrPMqWvRQm37Q";
            String oAuthConsumerKey = "b0a69fd8c5696e3c7221";
            String oAuthConsumerSecret = "161e1240e25025e9619e";
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
        return new ModelAndView("jsonData", "message", model);
    }

    @RequestMapping("/page2")
    public String hello(Model model) {
        model.addAttribute("message", "Please Login");
        //this is a test comment
        return "loginpage";
    }

    @RequestMapping("/page3")
    public String homePage(Model model) {

        return "homepage";
    }

    @RequestMapping("/profile")
    public String profilePage(Model model) {

        return "profile";
    }

    @RequestMapping("/createevent")
    public String createEventPage(Model model) {

        return "createevent";
    }

    @RequestMapping("/searchresults")
    public String searchResultsPage(Model model) {

        return "searchresults";
    }

    @RequestMapping("/feedbackpage")
    public String feedbackPage(Model model) {

        return "feedbackpage";
    }

    @RequestMapping("/eventdetails")
    public String eventDetails(Model model) {

        return "eventdetails";
    }

    @RequestMapping("/attendorvolunteer")
    public String attendOrVolunteer(Model model) {

        return "attendorvolunteer";
    }

    @RequestMapping("/confirmationpage")
    public String confirmation(Model model) {

        return "confirmationpage";
    }
}
