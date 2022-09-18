package routes;

import entities.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import utilities.Authentication;

public class RequireAuthServlet extends HttpServlet {

    protected User getUser(HttpServletRequest request) {
        try {
            String token = Authentication.getTokenFromCookies(request.getCookies());
            return Authentication.getUserInformationByToken(token);
        } catch (Exception ex) {
            return null;
        }
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (getUser(request) == null) {
            //response.sendError(403);
            response.sendRedirect("signin");
            return;
        }
        super.service(request, response);
    }
}
