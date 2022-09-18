package utilities;

import entities.User;
import jakarta.servlet.http.Cookie;
import java.util.Date;
import java.util.HashMap;
import models.UserModel;
import org.json.JSONObject;

public class Authentication {

    public static String getTokenFromCookies(Object cookies) {
        if (cookies == null) {
            return null;
        }

        for (Cookie cookie : (Cookie[]) cookies) {
            if (cookie.getName().equals("token")) {
                return cookie.getValue();
            }
        }
        return null;
    }

    public static Cookie createTokenCookie(Long uid, Integer expiryTime) {
        HashMap<String, Object> data = new HashMap<>();

        data.put("uid", uid);
        data.put("expiry", new Date().getTime() + expiryTime * 1000);

        String token = TokenGenerator.generate(data, GlobalConstants.AUTH_SECRET_KEY);

        Cookie c = new Cookie("token", token);
        c.setMaxAge(expiryTime);

        return c;
    }

    public static User getUserInformationByToken(String token) throws Exception {
        if (!TokenGenerator.validCheck(token, GlobalConstants.AUTH_SECRET_KEY)) {
            throw new Exception("Invalid token: Token is corrupted");
        }

        JSONObject json = TokenGenerator.decrypt(token);

        Long expiry = json.getLong("expiry");
        Long current = new Date().getTime();

        if (expiry < current) {
            throw new Exception("Invalid token: Token is expired");
        }

        Long uid = json.getLong("uid");

        return new UserModel().get(uid);
    }
}
