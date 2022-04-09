package mode_utility;

public class Config {

    // for Send Mail
    // OTP_________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
    public static final String OWNER_EMAIL = "mobilestore1022@gmail.com";
    public static final String MAIL_PASSWORD = "projectweb@st";

    public static final int OTP_LIVE= 60; // seconds

    // login with google

    public static final String GOOGLE_CLIENT_ID = "242172289847-s0lpni95bj135eqf5d3dqphvjcpe65qv.apps.googleusercontent.com";
    public static final String GOOGLE_CLIENT_SECRET = "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";
    public static final String GOOGLE_REDIRECT_URI = "http://localhost:8086/login_google";
    public static final String GOOGLE_GRANT_TYPE = "authorization_code";
    public static final String GOOGLE_RESPONSE_TYPE = "code";
    public static final String GOOGLE_SCOPE = "https://www.googleapis.com/auth/userinfo.email";
    public static final String GOOGLE_TOKEN_URL = "https://oauth2.googleapis.com/token";
    public static final String GOOGLE_USERINFO_URL = "https://www.googleapis.com/oauth2/v1/certs";

    // login with facebook

}
