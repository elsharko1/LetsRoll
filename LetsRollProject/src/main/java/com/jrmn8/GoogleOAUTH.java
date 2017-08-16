package com.jrmn8;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeRequestUrl;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson.JacksonFactory;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.Arrays;

public final class GoogleOAUTH {

    private static final String CLIENT_ID = "608802918864-3qu5pqf1siefm8vpmq0n7t789boj3g7d.apps.googleusercontent.com";
    private static final String CLIENT_SECRET = "Qp_kGxRUX900xB9XEKIow_lH";
    private static final String CALLBACK_URI = "http://localhost:8080/homepage";
    // private static final String CALLBACK_URI = "http://letsroll.us-east-2.elasticbeanstalk.com/homepage";
    // private static final String CALLBACK_URI = "https://letsroll.us-east-2.elasticbeanstalk.com/homepage";
    private static final Iterable<String> SCOPE = Arrays.asList("https://www.googleapis.com/auth/userinfo.profile;https://www.googleapis.com/auth/userinfo.email".split(";"));
    private static final String USER_INFO_URL = "https://www.googleapis.com/oauth2/v1/userinfo";
    private static final JsonFactory JSON_FACTORY = new JacksonFactory();
    private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
    private static String stateToken;
    private static GoogleAuthorizationCodeFlow flow;

    /**
     * buildGoogleOAUTH() is a publicly accessible void method that builds a "GoogleAuthorizationCodeFlow" object with various parameters:
     * - HTTP_Transport is the object that allows us to communicate with Google's API
     * - JSON_Factory is the "JacksonFactory" object that google will use to return us JSON objects
     * - Client_ID and Client_Secret are the credentials given to us by google to validate that it is us requesting the info
     * - Scope is the exact information that we're trying to get from google.
     *
     * Then we use generateStateToken().
     */
    public static void buildGoogleOAUTH() {
        flow = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT, JSON_FACTORY, CLIENT_ID, CLIENT_SECRET, SCOPE).build();
        generateStateToken();
    }

    /**
     * This requests a login URL from google that our users can log in through.
     *
     * @return
     * url.setRedirectUri(CALLBACK_URI).setState(stateToken).build() - literally the login URL String.
     */
    public static String buildLoginUrl() {
        final GoogleAuthorizationCodeRequestUrl url = flow.newAuthorizationUrl();
        return url.setRedirectUri(CALLBACK_URI).setState(stateToken).build();
    }

    /**
     * Assigns a String value of "google; [SecureRandom.nextInt()]"
     * SecureRandom.nextInt() gives a random integer through the JDK Class
     * and then we append that to google; in order to have a randomized stateToken String.
     */
    private static void generateStateToken() {
        SecureRandom sr1 = new SecureRandom();
        stateToken = "google;" + sr1.nextInt();
    }

    /**
     * @return
     * stateToken - the current stateToken String. Because stateToken is private, we need this getter.
     */
    public static String getStateToken() {
        return stateToken;
    }

    /**
     * This is a JSONObject (specifically from org.json.simple).
     * We instantiate a JSONOBject 'jsonObject' and then do a try/catch.
     * We do all the operations to communicate with Google and finally get a chunk of user information;
     * we then use a parser to actually populate our jsonObject with the information.
     *
     * Additionally, we have a few possible exceptions that we catch and print to the console.
     */
    public static org.json.simple.JSONObject getUserInfoJson(final String authCode) {
        org.json.simple.JSONObject jsonObject = new org.json.simple.JSONObject();
        try {
            final GoogleTokenResponse response = flow.newTokenRequest(authCode).setRedirectUri(CALLBACK_URI).execute();
            final Credential credential = flow.createAndStoreCredential(response, null);
            final HttpRequestFactory requestFactory = HTTP_TRANSPORT.createRequestFactory(credential);
            final GenericUrl url = new GenericUrl(USER_INFO_URL);
            final HttpRequest request = requestFactory.buildGetRequest(url);
            request.getHeaders().setContentType("application/json");

            /*final String jsonIdentity = request.execute().parseAsString();*/
            /*return jsonIdentity;*/
            final String jsonIdentity = request.execute().parseAsString();
            JSONParser parser = new JSONParser();
            jsonObject = (org.json.simple.JSONObject) parser.parse(jsonIdentity);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
}