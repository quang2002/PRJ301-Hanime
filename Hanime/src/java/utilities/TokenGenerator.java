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

    public static String SHA256(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] encoded = md.digest(str.getBytes());
            return bytesToHex(encoded);
        } catch (NoSuchAlgorithmException e) {
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
        String signaturePart = encode64(SHA256(json));

        return dataPart + "." + signaturePart;
    }

    public static boolean validCheck(String token) {
        String[] data = token.split("\\.");

        return SHA256(decode64(data[0])).equals(decode64(data[1]));
    }
}
