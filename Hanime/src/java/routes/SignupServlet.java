package routes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import models.Procedures;
import utilities.GlobalConstants;
import utilities.GoogleReCaptcha;

@WebServlet(urlPatterns = {"/signup"})
public class SignupServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username").trim();
            String password = request.getParameter("password").trim();
            String email = request.getParameter("email").trim();
            String gender = request.getParameter("gender").trim();

            String captcha = request.getParameter("g-recaptcha-response");

            if (username.length() <= 8 || password.length() <= 8) {
                throw new Exception("Username and password length must be greater or equal to 8");
            }

            GoogleReCaptcha gcaptcha = new GoogleReCaptcha(GlobalConstants.GOOGLE_RECAPTCHA_SECRET_KEY);

            if (!gcaptcha.checkCaptcha(captcha)) {
                throw new Exception("Wrong captcha");
            }

            Procedures.createAccount(username, password, email, gender.equals("male"), false);
        } catch (Exception e) {
            System.err.println(e);
            doGet(request, response);
            return;
        }
        response.sendRedirect(".");
    }
}
