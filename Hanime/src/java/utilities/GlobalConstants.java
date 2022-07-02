package utilities;

public class GlobalConstants {

    // Misc
    public static final int EXP_PER_LEVEL = 100;

    // Google ReCaptcha
    public static final String GOOGLE_RECAPTCHA_SITE_KEY = "6LddfV4gAAAAALisBaSxK2pPSpzxE4YxdkXFXTWJ";
    public static final String GOOGLE_RECAPTCHA_SECRET_KEY = "6LddfV4gAAAAAOwwspAtnux6ReBkyfVf5W4_MNY8";

    // Hanime Authentication Secret Key for HMAC Algorithm
    public static final String AUTH_SECRET_KEY = "50rrY_14m_G4y";

    // SMTP Account
    public static final String SMTP_ACCOUNT_EMAIL = "prj301-hanime@outlook.com";
    public static final String SMTP_ACCOUNT_PASSWORD = "/>B89,S5AUZnZh4V";

    // SQL Authentication
    public static final String SQL_SERVER_NAME = "localhost";
    public static final String SQL_DATABASE_NAME = "Hanime";
    public static final String SQL_USERNAME = "sa";
    public static final String SQL_PASSWORD = "271102";

    // Deployment
    public static final String DOMAIN = "localhost";
    public static final Integer PORT = 9999;

    public static final String HOST = DOMAIN + ":" + PORT + "/Hanime";
    public static final String COMMENT_WSPATH = "/comment";
}
