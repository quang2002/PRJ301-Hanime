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
import models.Procedures;
import utilities.GlobalConstants;
import utilities.TokenGenerator;

/**
 *
 * @author yuyu2
 */
public class SigninServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("signin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            Long uid = Procedures.checkAuth(username, password);
            if (uid != null) {
                HashMap<String, Object> data = new HashMap<>();

                data.put("uid", uid);
                data.put("expiry", new Date().getTime() + 1000 * 60 * 60 * 24); // a day

                String token = TokenGenerator.generate(data, GlobalConstants.AUTH_SECRET_KEY);

                Cookie c = new Cookie("token", token);
                c.setMaxAge(60 * 60 * 24);
                response.addCookie(c);
                response.sendRedirect(request.getContextPath());
                return;
            }
        } catch (Exception e) {
        }
        doGet(request, response);
    }
}
