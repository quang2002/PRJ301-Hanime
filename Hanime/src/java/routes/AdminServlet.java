package routes;

import entities.Auth;
import entities.Category;
import entities.Film;
import entities.FilmCategory;
import entities.Notification;
import entities.User;
import entities.Video;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import models.AuthModel;
import models.CategoryModel;
import models.CommentModel;
import models.FilmCategoryModel;
import models.FilmModel;
import models.NotificationModel;
import models.RateModel;
import models.UserModel;
import models.VideoModel;
import utilities.GlobalConstants;
import utilities.SMTP;

@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends RequireAuthServlet {

    public interface ProcessCallback {

        public String process(HttpServletRequest request, HttpServletResponse response) throws Exception;
    }

    private HashMap<String, ProcessCallback> routes;

    @Override
    public void init() throws ServletException {
        routes = new HashMap<>();

        routes.put("create-category", AdminServlet::createCategory);
        routes.put("edit-category", AdminServlet::editCategory);
        routes.put("delete-category", AdminServlet::deleteCategory);

        routes.put("create-film", AdminServlet::createFilm);
        routes.put("edit-film", AdminServlet::editFilm);
        routes.put("edit-film-form", AdminServlet::editFilmForm);
        routes.put("delete-film", AdminServlet::deleteFilm);

        routes.put("create-video-form", AdminServlet::createVideoForm);
        routes.put("create-video", AdminServlet::createVideo);
        routes.put("edit-video-form", AdminServlet::editVideoForm);
        routes.put("edit-video", AdminServlet::editVideo);
        routes.put("delete-video", AdminServlet::deleteVideo);

        routes.put("delete-account", AdminServlet::deleteAccount);
    }

    private static String createCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("name").trim();
        String description = request.getParameter("description").trim();

        new CategoryModel().insert(new Category(null, name, description));

        return "category";
    }

    private static String editCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name").trim();
        String description = request.getParameter("description").trim();

        new CategoryModel().update(new Category(id, name, description));

        return "category";
    }

    private static String deleteCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        new CategoryModel().delete(new Category(id, null, null));

        return "category";
    }

    private static String createFilm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("name").trim();
        String description = request.getParameter("description").trim();
        String thumbnailUrl = request.getParameter("thumbnail-url").trim();
        Boolean notify = request.getParameter("notify") != null;
        String[] rawCategories = request.getParameterValues("category");

        SMTP smtp = new SMTP(GlobalConstants.SMTP_HOST, GlobalConstants.SMTP_PORT, GlobalConstants.SMTP_ACCOUNT_EMAIL, GlobalConstants.SMTP_ACCOUNT_PASSWORD);
        smtp.connect();

        FilmCategoryModel fcModel = new FilmCategoryModel();
        FilmModel fModel = new FilmModel();
        NotificationModel nModel = new NotificationModel(smtp);

        fModel.insert(new Film(null, name, description, thumbnailUrl));

        Long fid = fModel.getLastestID();

        if (rawCategories != null) {
            HashSet<Long> categories = new HashSet<>();

            for (String rawCategory : rawCategories) {
                Long cId = Long.parseLong(rawCategory);

                if (cId != 0 && categories.add(cId)) {
                    fcModel.insert(new FilmCategory(fid, cId));
                }
            }
        }

        if (notify) {
            List<Long> uids = new UserModel().getUserIDHasCondition("[NotifyNews] = 1");

            for (Long uid : uids) {
                nModel.create(new Notification(
                        "New Film: " + name,
                        uid,
                        null,
                        "film?id=" + fid
                ));
            }
        }

        return "film";
    }

    private static String editFilm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name").trim();
        String description = request.getParameter("description").trim();
        String thumbnailUrl = request.getParameter("thumbnail-url").trim();
        String[] rawCategories = request.getParameterValues("category");

        FilmCategoryModel fcModel = new FilmCategoryModel();
        FilmModel fModel = new FilmModel();

        fModel.update(new Film(id, name, description, thumbnailUrl));
        fModel.clearCategoryByFilmID(id);

        if (rawCategories != null) {
            HashSet<Long> categories = new HashSet<>();

            for (String rawCategory : rawCategories) {
                Long cId = Long.parseLong(rawCategory);

                if (cId != 0 && categories.add(cId)) {
                    fcModel.insert(new FilmCategory(id, cId));
                }
            }
        }

        return "film";
    }

    private static String editFilmForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        Film film = new FilmModel().get(id);

        request.setAttribute("editFilm", film);
        request.setAttribute("editFilmCategory", new CategoryModel().getCategoryByFilmID(id));
        return "edit-film";
    }

    private static String deleteFilm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        new FilmModel().delete(new Film(id, null, null, null));

        return "film";
    }

    private static String createVideoForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        request.setAttribute("selectedFilm", new FilmModel().get(id));
        return "create-video";
    }

    private static String createVideo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name").trim();
        String thumbnailUrl = request.getParameter("thumbnail-url").trim();
        String videoUrl = request.getParameter("video-url").trim();
        Integer length = Integer.parseInt(request.getParameter("length"));
        Boolean notify = request.getParameter("notify") != null;

        if (thumbnailUrl.isEmpty()) {
            thumbnailUrl = null;
        }

        SMTP smtp = new SMTP(GlobalConstants.SMTP_HOST, GlobalConstants.SMTP_PORT, GlobalConstants.SMTP_ACCOUNT_EMAIL, GlobalConstants.SMTP_ACCOUNT_PASSWORD);
        smtp.connect();

        NotificationModel nModel = new NotificationModel(smtp);

        new VideoModel().createNewVideo(name, thumbnailUrl, videoUrl, length, id);
        Film film = new FilmModel().get(id);
        Long vid = new VideoModel().getLastestID();

        if (notify) {
            List<Long> uids = new UserModel().getUserIDHasCondition("[NotifyVideoUpload] = 1 AND [ID] IN (SELECT [UserID] FROM [Follow] WHERE [FilmID] = ?)", id);

            for (Long uid : uids) {
                nModel.create(new Notification(
                        film.getName() + " has a new episode, check it!",
                        uid,
                        null,
                        "watch?id=" + vid
                ));
            }
        }

        return "film";
    }

    private static String editVideoForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        request.setAttribute("selectedVideo", new VideoModel().get(id));
        return "edit-video";
    }

    private static String editVideo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        Long filmId = Long.parseLong(request.getParameter("film"));
        String name = request.getParameter("name").trim();
        String thumbnailUrl = request.getParameter("thumbnail-url").trim();
        String videoUrl = request.getParameter("video-url").trim();
        Integer length = Integer.parseInt(request.getParameter("length"));

        if (thumbnailUrl.isEmpty()) {
            thumbnailUrl = null;
        }

        new VideoModel().update(id, name, thumbnailUrl, videoUrl, length, filmId);

        return "film";
    }

    private static String deleteVideo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        new VideoModel().delete(new Video(id, null, null, null, null, null, null, null));
        return "film";
    }

    private static String deleteAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Long id = Long.parseLong(request.getParameter("id"));
        new AuthModel().delete(new Auth(id, null, null, null));
        return "account";
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            User user = getUser(request);
            if (user == null) {
                response.sendRedirect("signin");
                return;
            }

            if (new AuthModel().isAdmin(user.getId())) {
                request.setAttribute("user", user);
                request.setAttribute("topNotis", new NotificationModel().getByUserID(user.getId(), 5));

                super.service(request, response);
            } else {
                response.sendError(403);
            }
        } catch (Exception e) {
            response.sendError(500);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("accounts", new AuthModel().getall());
            request.setAttribute("films", new FilmModel().getall());
            request.setAttribute("categories", new CategoryModel().getall());
            request.setAttribute("recentComments", new CommentModel().getRecentComments(10));
            request.setAttribute("topVideos", new VideoModel().getTopVideos(10));
            request.setAttribute("topFilms", new FilmModel().getTopFilms(10));
            request.setAttribute("users", new UserModel().getall());
            request.setAttribute("topUsers", new UserModel().getTopUsersByExp(10));
            request.setAttribute("totalView", new VideoModel().getAllView());
            request.setAttribute("totalRate", new RateModel().getall().size());
            request.setAttribute("totalComment", new CommentModel().getall().size());

            request.getRequestDispatcher("admin.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            String startupTab = routes.get(action).process(request, response);
            request.setAttribute("startupTab", startupTab);
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500);
        }
    }
}
