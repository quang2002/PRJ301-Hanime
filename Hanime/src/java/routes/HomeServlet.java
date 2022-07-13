package routes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import models.FilmModel;

@WebServlet(urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List films = new FilmModel().getTrendingFilms(50);
            request.setAttribute("films", films);
        } catch (Exception e) {
            System.err.println(e);
        }

        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
