/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package routes;

import entities.Video;
import entities.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.CommentModel;
import models.UserModel;
import models.VideoModel;

/**
 *
 * @author golde
 */
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //if isAdmin
        try {
            List<Video> videos = new VideoModel().getall();
            int totalView = 0;
            int totalComment = 0;
            for (Video video : videos) {
                totalView += video.getView();
                totalComment +=new CommentModel().getCommentCount(video.getFilmId());
            }
            List<User> users = new UserModel().getTopUsersByExp(5);
            request.setAttribute("topUsers", users);
            request.setAttribute("totalView", totalView);
            request.setAttribute("totalComment", totalComment);
        } catch (Exception e) {
            System.err.println(e);
        }
        request.getRequestDispatcher("Admin/admin.jsp").forward(request, response);
        // else response.sendRedirect("/error-pages/403.jsp");
    } 
}
