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
    //private static final String CALLBACK_URI = "http://letsroll.us-east-2.elasticbeanstalk.com/homepage";
    //private static final String CALLBACK_URI = "https://letsroll.us-east-2.elasticbeanstalk.com/homepage";
    private static final Iterable<String> SCOPE = Arrays.asList("https://www.googleapis.com/auth/userinfo.profile;https://www.googleapis.com/auth/userinfo.email".split(";"));
    private static final String USER_INFO_URL = "https://www.googleapis.com/oauth2/v1/userinfo";
    private static final JsonFactory JSON_FACTORY = new JacksonFactory();
    private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
    private static String stateToken;
    private static GoogleAuthorizationCodeFlow flow;

    /**
     *
     */
    public static void buildGoogleOAUTH() {
        flow = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT, JSON_FACTORY, CLIENT_ID, CLIENT_SECRET, SCOPE).build();
        generateStateToken();
    }

    public static String buildLoginUrl() {
        final GoogleAuthorizationCodeRequestUrl url = flow.newAuthorizationUrl();
        return url.setRedirectUri(CALLBACK_URI).setState(stateToken).build();
    }

    public static String buildLogoutUrl() {
        return CALLBACK_URI;
    }

    private static void generateStateToken() {
        SecureRandom sr1 = new SecureRandom();
        stateToken = "google;" + sr1.nextInt();
    }

    public static String getStateToken() {
        return stateToken;
    }

    /*public String getUserInfoJson(final String authCode) throws IOException {*/
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