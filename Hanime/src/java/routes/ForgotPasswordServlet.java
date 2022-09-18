/*ffffffffffff
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package routes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import entities.User;
import models.AuthModel;
import models.UserModel;
import utilities.GlobalConstants;
import utilities.GoogleReCaptcha;
import utilities.SMTP;
import utilities.TokenGenerator;

@WebServlet(urlPatterns = {"/forgot-password"})
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
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

            SMTP smtp = new SMTP(GlobalConstants.SMTP_HOST, GlobalConstants.SMTP_PORT, GlobalConstants.SMTP_ACCOUNT_EMAIL, GlobalConstants.SMTP_ACCOUNT_PASSWORD);
            smtp.connect();

            UserModel user = new UserModel();

            User u = user.getByUsername(username);

            if (u == null) {
                throw null;
            }

            String oldPassword = new AuthModel().get(u.getId()).getPassword();

            HashMap<String, Object> data = new HashMap<>();
            data.put("uid", u.getId());
            data.put("expiry", new Date().getTime() + 1000 * 60 * 30); // 30 minutes

            String text = "Vui lòng truy cập đường dẫn sau để cài đặt mật khẩu mới (hiệu lực trong 30 phút): \nhttp://" + GlobalConstants.HOST + "/reset?token=" + TokenGenerator.generate(data, oldPassword);

            smtp.sendMimeMessageWithThread("Hanime (No-Reply)", u.getEmail(), "[Hanime] Password Recovery", text);
        } catch (Exception e) {
            doGet(request, response);
            return;
        }
        response.sendRedirect(".");
    }
}
