/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package routes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import utilities.Authentication;

/**
 *
 * @author yuyu2
 */
public class RequireAuthServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String token = Authentication.getTokenFromCookies(request.getCookies());

            if (Authentication.getUserInformationByToken(token) == null) {
                throw null;
            }
        } catch (Exception e) {
            response.sendError(403);
            return;
        }
        super.service(request, response);
    }
}
