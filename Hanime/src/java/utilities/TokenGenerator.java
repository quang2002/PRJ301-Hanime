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

    private static String bytesToHex(byte[] bytes) {
        String result = "";
        for (byte b : bytes) {
            String hex = Integer.toHexString(b);
            result += (hex.length() == 1 ? "0" : "") + hex;
        }
        return result;
    }

    private static byte[] hexToBytes(String hex) {
        byte[] result = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length() - 1; i += 2) {
            result[i / 2] = Byte.parseByte(hex.substring(i, i + 1), 16);
        }
        return result;
    }

    private static String HMACSHA256(String str, String key) {
        try {
            Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
            SecretKeySpec secret_key = new SecretKeySpec(key.getBytes("UTF-8"), "HmacSHA256");
            sha256_HMAC.init(secret_key);

            return bytesToHex(sha256_HMAC.doFinal(str.getBytes("UTF-8")));
        } catch (Exception e) {
            return null;
        }
    }

    private static String encode64(String data) {
        return new String(Base64.getEncoder().encode(data.getBytes()));
    }

    private static String decode64(String data) {
        return new String(Base64.getDecoder().decode(data.getBytes()));
    }

    public static String generate(HashMap<String, Object> data, String key) {
        try {
            String json = new JSONObject(data).toString();

            String dataPart = encode64(json);
            String signaturePart = encode64(HMACSHA256(json, key));

            return encode64(dataPart + "." + signaturePart);
        } catch (Exception e) {
            return null;
        }
    }

    public static boolean validCheck(String token, String key) {
        try {
            String[] data = decode64(token).split("\\.");

            return HMACSHA256(
                    decode64(data[0]),
                    key
            ).equals(decode64(data[1]));
        } catch (Exception e) {
            return false;
        }
    }

    public static JSONObject decrypt(String token) {
        try {
            String[] data = decode64(token).split("\\.");
            return new JSONObject(decode64(data[0]));
        } catch (JSONException e) {
            return null;
        }
    }
}
