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
import jakarta.servlet.annotation.WebServlet;
import models.AuthModel;
import org.json.JSONObject;
import utilities.TokenGenerator;

/**
 *
 * @author yuyu2
 */
@WebServlet(urlPatterns = {"/reset"})
public class ResetPasswordServlet extends HttpServlet {

    private static boolean isValidToken(String token) {
        try {
            JSONObject json = TokenGenerator.decrypt(token);

            Long uid = json.getLong("uid");

            if (new Date().after(new Date(json.getLong("expiry")))) {
                return false;
            }

            return TokenGenerator.validCheck(token, new AuthModel().get(uid).getPassword());
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        if (!isValidToken(token)) {
            response.sendError(403);
            return;
        }
        request.getRequestDispatcher("reset-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String password = request.getParameter("password");
            String token = request.getParameter("token");

            if (!isValidToken(token)) {
                response.sendError(403);
                return;
            }

            Long uid = TokenGenerator.decrypt(token).getLong("uid");
            AuthModel authModel = new AuthModel();

            Auth auth = authModel.get(uid);
            auth.setPassword(password);

            authModel.update(auth);
            response.sendRedirect(".");
        } catch (Exception e) {
            System.err.println(e);
            response.sendError(500);
        }
    }

}
