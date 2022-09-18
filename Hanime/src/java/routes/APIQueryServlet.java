package routes;

import entities.Follow;
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
import models.FollowModel;
import models.RateModel;
import models.UserModel;
import models.VideoModel;
import org.json.JSONArray;
import org.json.JSONObject;

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

        routes.put("toggle-follow", APIQueryServlet::toggleFollow);
        routes.put("chart-data", APIQueryServlet::chartData);
    }

    public static void chartData(HttpServletRequest request, PrintWriter response) throws Exception {
        JSONObject result = new JSONObject();
        JSONObject view = new JSONObject();
        JSONObject rate = new JSONObject();
        JSONObject comment = new JSONObject();
        JSONArray labels = new JSONArray(new String[]{"2020", "2021", "2022"});
        JSONArray datasets = new JSONArray(new JSONObject[]{view, rate, comment});

        view.put("label", "View");
        view.put("backgroundColor", "rgba(235, 22, 22, .7)");
        view.put("data", new int[] {1, 2, 3});

        rate.put("label", "Rate");
        rate.put("backgroundColor", "rgba(235, 22, 22, .5)");
        rate.put("data", new int[] {5, 5, 9});

        comment.put("label", "Comment");
        comment.put("backgroundColor", "rgba(235, 22, 22, .3)");
        comment.put("data", new int[] {1, 3, 2});

        result.put("labels", labels);
        result.put("datasets", datasets);
        response.print(result);
    }

    public static void toggleFollow(HttpServletRequest request, PrintWriter response) throws Exception {
        Long uid = Long.parseLong(request.getParameter("uid"));
        Long fid = Long.parseLong(request.getParameter("fid"));

        try {
            new FollowModel().insert(new Follow(fid, uid));
            response.print("follow");
        } catch (Exception e) {
            new FollowModel().delete(new Follow(fid, uid));
            response.print("unfollow");
        }
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
