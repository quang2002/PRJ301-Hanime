/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utilities;

import java.util.Base64;
import java.util.HashMap;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author yuyu2
 */
public class TokenGenerator {

    public static String generate(HashMap<String, Object> data, String key) {
        try {
            String json = new JSONObject(data).toString();

            String dataPart = Crypto.encode64(json);
            String signaturePart = Crypto.encode64(Crypto.HMACSHA256(json, key));

            return Crypto.encode64(dataPart + "." + signaturePart);
        } catch (Exception e) {
            return null;
        }
    }

    public static boolean validCheck(String token, String key) {
        try {
            String[] data = Crypto.decode64(token).split("\\.");

            return Crypto.HMACSHA256(
                    Crypto.decode64(data[0]),
                    key
            ).equals(Crypto.decode64(data[1]));
        } catch (Exception e) {
            return false;
        }
    }

    public static JSONObject decrypt(String token) {
        try {
            String[] data = Crypto.decode64(token).split("\\.");
            return new JSONObject(Crypto.decode64(data[0]));
        } catch (JSONException e) {
            return null;
        }
    }
}
