/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package routes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import models.AuthModel;
import utilities.TokenGenerator;

/**
 *
 * @author yuyu2
 */
public class SigninServlet extends HttpServlet {

    private AuthModel auth;
    private static final String AUTH_SECRET_KEY = "50rrY_14m_G4y";

    @Override
    public void init() throws ServletException {
        super.init();
        auth = new AuthModel();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("signin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (auth.check(username, password)) {
                HashMap<String, Object> data = new HashMap<>();

                data.put("user", username);
                data.put("expired", new Date().getTime());

                String token = TokenGenerator.generate(data, AUTH_SECRET_KEY);

                response.addCookie(new Cookie("token", token));
                response.sendRedirect(request.getContextPath());
                return;
            }
        } catch (Exception e) {
        }
        doGet(request, response);
    }
}
