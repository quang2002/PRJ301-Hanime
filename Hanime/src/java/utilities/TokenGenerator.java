/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utilities;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/**
 *
 * @author yuyu2
 */
public class TokenGenerator {

    public static String bytesToHex(byte[] bytes) {
        String result = "";
        for (byte b : bytes) {
            String hex = Integer.toHexString(b);
            result += (hex.length() == 1 ? "0" : "") + hex;
        }
        return result;
    }

    public static byte[] hexToBytes(String hex) {
        byte[] result = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length() - 1; i += 2) {
            result[i / 2] = Byte.parseByte(hex.substring(i, i + 1), 16);
        }
        return result;
    }

    public static String HMACSHA256(String str, String key) {
        try {
            Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
            SecretKeySpec secret_key = new SecretKeySpec(key.getBytes("UTF-8"), "HmacSHA256");
            sha256_HMAC.init(secret_key);

            return bytesToHex(sha256_HMAC.doFinal(str.getBytes("UTF-8")));
        } catch (Exception e) {
            return null;
        }
    }

    public static String encode64(String data) {
        return new String(Base64.getEncoder().encode(data.getBytes()));
    }

    public static String decode64(String data) {
        return new String(Base64.getDecoder().decode(data.getBytes()));
    }

    public static String generate(HashMap<String, Object> data, String key) {
        String json = "";
        for (Map.Entry<String, Object> entry : data.entrySet()) {
            json += ",\"" + entry.getKey() + "\":\"" + entry.getValue().toString() + "\"";
        }

        if (!json.isEmpty()) {
            json = "{" + json.substring(1) + "}";
        }

        String dataPart = encode64(json);
        String signaturePart = encode64(HMACSHA256(json, key));

        return dataPart + "." + signaturePart;
    }

    public static boolean validCheck(String token, String key) {
        String[] data = token.split("\\.");

        return HMACSHA256(
                decode64(data[0]),
                key
        ).equals(decode64(data[1]));
    }
}
