package utilities;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class Crypto {

    public static String bytesToHex(byte[] bytes) {
        String result = "";
        for (byte b : bytes) {
            int data = b;
            if (data < 0) {
                data += 256;
            }

            String hex = Integer.toHexString(data);
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

    public static String SHA256(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            return bytesToHex(md.digest(str.getBytes()));
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
}
