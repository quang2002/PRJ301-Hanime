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
import java.util.Date;
import entities.Auth;
import models.AuthModel;
import org.json.JSONObject;
import utilities.GlobalConstants;
import utilities.TokenGenerator;

/**
 *
 * @author yuyu2
 */
public class ResetPassword extends HttpServlet {

    private static boolean isValidToken(String token) {
        try {
            if (!TokenGenerator.validCheck(token, GlobalConstants.RECOVERY_SECRET_KEY)) {
                return false;
            }

            JSONObject json = TokenGenerator.decrypt(token);

            return new Date().before(new Date(json.getLong("expiry")));
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        if (!isValidToken(token)) {
            request.getRequestDispatcher("error-pages/404.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String password = request.getParameter("password");
            String token = request.getParameter("token");
            if (isValidToken(token)) {
                Long uid = TokenGenerator.decrypt(token).getLong("uid");
                AuthModel authModel = new AuthModel();

                Auth auth = authModel.get(uid);
                auth.setPassword(password);

                authModel.update(auth);
                response.sendRedirect(request.getContextPath());
            } else {
                request.getRequestDispatcher("error-pages/404.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.err.println(e);
            throw null;
        }
    }

}
