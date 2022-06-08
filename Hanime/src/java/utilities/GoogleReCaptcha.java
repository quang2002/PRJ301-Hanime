/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utilities;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 *
 * @author yuyu2
 */
public class GoogleReCaptcha {

    private String secret;

    public GoogleReCaptcha() {
    }

    public GoogleReCaptcha(String secret) {
        this.secret = secret;
    }

    public boolean checkCaptcha(String response) {
        HttpURLConnection conn = null;
        try {
            URL url = new URL("https://www.google.com/recaptcha/api/siteverify");

            conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoInput(true);
            conn.setDoOutput(true);

            try ( OutputStream os = conn.getOutputStream()) {
                os.write(("secret=" + secret + "&response=" + response).getBytes());
                os.flush();
            }

            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
                return br.lines().anyMatch((line) -> line.contains("\"success\": true"));
            }
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            if (conn != null) {
                conn.disconnect();
            }
        }
        return false;
    }
}
