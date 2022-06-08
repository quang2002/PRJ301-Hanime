/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package routes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import utilities.GlobalConstants;
import utilities.GoogleReCaptcha;

/**
 *
 * @author yuyu2
 */
public class SignupServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");

            String captcha = request.getParameter("g-recaptcha-response");

            GoogleReCaptcha gcaptcha = new GoogleReCaptcha(GlobalConstants.GOOGLE_RECAPTCHA_SECRET_KEY);

            if (!gcaptcha.checkCaptcha(captcha)) {
                throw null;
            }

            try ( PreparedStatement stmt = models.ModelBase.createStatement(
                    "EXEC [sp_create_account] ?, ?, ?, ?",
                    username, password, email, gender.equals("m")
            )) {
                stmt.execute();
            }
        } catch (Exception e) {
            doGet(request, response);
            return;
        }
        response.sendRedirect(request.getContextPath());
    }
}
