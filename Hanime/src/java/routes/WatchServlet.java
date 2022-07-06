/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package routes;

import entities.Film;
import entities.Video;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import models.VideoModel;

/**
 *
 * @author yuyu2
 */
@WebServlet(urlPatterns = {"/watch"})
public class WatchServlet extends RequireAuthServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
            if (id == null) {
                throw null;
            }

            VideoModel videoModel = new VideoModel();

            Video video = videoModel.get(id);

//            video.view += 1;
//
//            videoModel.update(video);

            request.setAttribute("video", video);

            if (video.getFilmId() != null) {
                Map.Entry<Film, List<Video>> filmAndVideos = videoModel.getVideosByFilmID(video.getFilmId());

                request.setAttribute("film", filmAndVideos.getKey());
                request.setAttribute("videos", filmAndVideos.getValue());
            }

            request.getRequestDispatcher("watch.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
    }
}
