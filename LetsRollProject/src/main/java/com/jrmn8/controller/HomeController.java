package com.jrmn8.controller;

/**
 * Created by Mark on 7/21/2017.
 */

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    //
    @RequestMapping("/")

    public ModelAndView helloWorld()
    {
        return new
                ModelAndView("welcome","message","Hello World");
    }

    @RequestMapping("/page2")
    public String hello(Model model) {
        model.addAttribute("message","Please Login");
        //this is a test comment
        return "loginpage";
    }
    @RequestMapping("/page3")
    public String homePage(Model model){

        return "homepage";
    }
    @RequestMapping("/profile")
    public String profilePage(Model model){

        return "profile";
    }
    @RequestMapping("/createevent")
    public String createEventPage(Model model){

        return "createevent";
    }
    @RequestMapping("/searchresults")
    public String searchResultsPage(Model model){

        return "searchresults";
    }

    @RequestMapping("/feedbackpage")
    public String feedbackPage(Model model){

        return "feedbackpage";
    }

    @RequestMapping("/eventdetails")
    public String eventDetails(Model model){

        return "eventdetails";
    }

    @RequestMapping("/attendorvolunteer")
    public String attendOrVolunteer(Model model){

        return "attendorvolunteer";
    }

    @RequestMapping("/confirmationpage")
    public String confirmation(Model model){

        return "confirmationpage";
    }
}
