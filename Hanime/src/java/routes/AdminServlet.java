/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package routes;

import entities.Video;
import entities.User;
import entities.Comment;
import entities.Rate;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.CommentModel;
import models.RateModel;
import models.UserModel;
import models.VideoModel;

/**
 *
 * @author golde
 */
@WebServlet(urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //if isAdmin
        try {
            List<User> users = new UserModel().getall();
            List<Video> videos = new VideoModel().getall();
            List<Comment> comments = new CommentModel().getall();
            List<Rate> rates = new RateModel().getall();
            List<User> topUsers = new UserModel().getTopUsersByExp(5);
            int totalView = new VideoModel().getAllView();
            request.setAttribute("videos", videos);
            request.setAttribute("topUsers", topUsers);
            request.setAttribute("totalUser", users.size());
            request.setAttribute("totalView", totalView);
            request.setAttribute("totalComment", comments.size());
            request.setAttribute("totalRate", rates.size());
        } catch (Exception e) {
            System.err.println(e);
        }
        request.getRequestDispatcher("Admin/admin.jsp").forward(request, response);
        // else response.sendRedirect("/error-pages/403.jsp");
    } 
}
