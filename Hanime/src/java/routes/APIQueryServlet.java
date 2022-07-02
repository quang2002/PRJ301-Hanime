/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package routes;

import entities.Rate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import models.RateModel;
import models.UserModel;
import models.VideoModel;

/**
 *
 * @author yuyu2
 */
@WebServlet(urlPatterns = {"/api/*"})
public class APIQueryServlet extends HttpServlet {

    public interface APIProcessCallback {

        public void process(HttpServletRequest request, PrintWriter response) throws Exception;
    }

    private HashMap<String, APIProcessCallback> routes;

    private void initRoutes() {
        routes = new HashMap<>();

        routes.put("is-user-exist", APIQueryServlet::isUserExist);
        routes.put("inc-user-exp", APIQueryServlet::incUserExp);
        routes.put("inc-video-view", APIQueryServlet::incVideoView);
        routes.put("rate-video", APIQueryServlet::rateVideo);
    }

    public static void isUserExist(HttpServletRequest request, PrintWriter response) throws Exception {
        String username = request.getParameter("username");
        response.print(new UserModel().getByUsername(username) != null);
    }

    public static void incUserExp(HttpServletRequest request, PrintWriter response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        Integer exp = Integer.parseInt(request.getParameter("exp"));

        response.print(new UserModel().increaseUserExp(id, exp));
    }

    public static void incVideoView(HttpServletRequest request, PrintWriter response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        response.print(new VideoModel().increaseVideoView(id));
    }

    public static void rateVideo(HttpServletRequest request, PrintWriter response) throws Exception {
        Long uid = Long.parseLong(request.getParameter("uid"));
        Long vid = Long.parseLong(request.getParameter("vid"));
        Integer rate = Integer.parseInt(request.getParameter("rate"));

        response.print(new RateModel().rate(new Rate(null, vid, uid, rate)));
    }

    @Override
    public void init() throws ServletException {
        super.init();

        initRoutes();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain; charset=utf-8");

        try ( PrintWriter out = response.getWriter()) {
            try {
                String uri = request.getRequestURI();

                Pattern pattern = Pattern.compile("^\\" + request.getContextPath() + "\\/api/([^\\/]+)(\\?.*)?$");

                Matcher matcher = pattern.matcher(uri);

                if (!matcher.matches()) {
                    out.print("Invalid request");
                    return;
                }

                routes.get(matcher.group(1)).process(request, out);
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        }
    }
}
