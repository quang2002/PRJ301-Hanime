package routes;

import entities.Film;
import entities.User;
import entities.Video;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import models.RateModel;
import models.VideoModel;

@WebServlet(urlPatterns = {"/watch"})
public class WatchServlet extends RequireAuthServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));

            VideoModel videoModel = new VideoModel();

            Video video = videoModel.get(id);
            User user = getUser(request);

            request.setAttribute("rate", new RateModel().getByVideoAndUser(video.getId(), user.getId()));
            request.setAttribute("video", video);

            if (video.getFilmId() != null) {
                Map.Entry<Film, List<Video>> filmAndVideos = videoModel.getVideosByFilmID(video.getFilmId());

                request.setAttribute("film", filmAndVideos.getKey());
                request.setAttribute("videos", filmAndVideos.getValue());
            }

            request.getRequestDispatcher("watch.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
    }
}
