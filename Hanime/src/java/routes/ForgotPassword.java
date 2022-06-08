 /*ffffffffffff
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package routes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import models.UserModel;
import org.json.JSONException;
import org.json.JSONObject;
import utilities.GlobalConstants;
import utilities.GoogleReCaptcha;
import utilities.SMTP;
import utilities.TokenGenerator;

/**
 *
 * @author yuyu2
 */
public class ForgotPassword extends HttpServlet {

    private UserModel user;
    private SMTP smtp;

    private static boolean isValidToken(String token) {
        try {
            if (!TokenGenerator.validCheck(token, GlobalConstants.RECOVERY_SECRET_KEY)) {
                return false;
            }

            JSONObject json = TokenGenerator.decrypt(token);

            return new Date().before(new Date(json.getLong("expired")));
        } catch (JSONException e) {
            return false;
        }
    }

    @Override
    public void init() throws ServletException {
        user = new UserModel();
        smtp = new SMTP("smtp-mail.outlook.com", "587", "yuyu2711@outlook.com", "Qu@ng2002");
        smtp.connect();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");

        if (token == null) {
            request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
        } else if (isValidToken(token)) {
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String captcha = request.getParameter("g-recaptcha-response");

            GoogleReCaptcha grecaptcha = new GoogleReCaptcha(GlobalConstants.GOOGLE_RECAPTCHA_SECRET_KEY);

            if (!grecaptcha.checkCaptcha(captcha)) {
                throw null;
            }

            entities.User u = user.getByUsername(username);

            if (u != null && u.getEmail() != null) {
                HashMap<String, Object> data = new HashMap<>();
                data.put("username", username);
                data.put("expired", new Date().getTime() + 1000 * 60 * 30); // 30 minutes

                String text = "Vui lòng truy cập đường dẫn sau để cài đặt mật khẩu mới (hiệu lực trong 30 phút): http://localhost:9999/Hanime/recovery?token=" + TokenGenerator.generate(data, GlobalConstants.RECOVERY_SECRET_KEY);

                smtp.sendMimeMessage("Hanime (No-Reply)", u.getEmail(), "[Hanime] Password Recovery", text);
            } else {
                throw null;
            }
        } catch (Exception e) {
            doGet(request, response);
            return;
        }
        response.sendRedirect(request.getContextPath());
    }
}
