package routes;

import entities.Category;
import entities.Film;
import entities.Video;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import models.CategoryModel;
import models.FilmModel;
import models.VideoModel;

@WebServlet(name = "FilmServlet", urlPatterns = {"/film"})
public class FilmServlet extends RequireAuthServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));

            Film film = new FilmModel().get(id);
            FilmModel fModel = new FilmModel();
            List<Video> videos = new VideoModel().getVideosByFilmID(id).getValue();

            List<Category> categories = new CategoryModel().getCategoryByFilmID(id);

            request.setAttribute("film", film);
            request.setAttribute("followed", fModel.isUserFollowed(getUser(request).getId(), id));
            request.setAttribute("filmCategories", categories);
            request.setAttribute("videos", videos);
            request.setAttribute("rate", fModel.getRate(id));
            request.setAttribute("view", fModel.getView(id));

            request.getRequestDispatcher("film.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500);
        }
    }
}
