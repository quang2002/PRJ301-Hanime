package routes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import models.Procedures;
import utilities.Authentication;

@WebServlet(urlPatterns = {"/signin"})
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
                response.addCookie(Authentication.createTokenCookie(uid, 60 * 60 * 24));
                response.sendRedirect(".");
                return;
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        doGet(request, response);
    }
}
