package routes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import models.VideoModel;

@WebServlet(name = "SearchServlet", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] sUploadDate = request.getParameterValues("upload-date");
        String[] sDuration = request.getParameterValues("duration");
        String[] sSortBy = request.getParameterValues("sort-by");

        try {
            String q = request.getParameter("q");
            Integer uploadDate = sUploadDate != null && sUploadDate.length > 0 ? Integer.parseInt(sUploadDate[sUploadDate.length - 1]) : 0;
            Integer duration = sDuration != null && sDuration.length > 0 ? Integer.parseInt(sDuration[sDuration.length - 1]) : 0;
            Integer sortBy = sSortBy != null && sSortBy.length > 0 ? Integer.parseInt(sSortBy[sSortBy.length - 1]) : 0;

            String condition = "[Video].[Name] LIKE N'%" + q + "%'", orderby = "[UploadTimeOffset]";

            switch (uploadDate) {
                case 1:
                    condition += " AND DATEDIFF(HOUR, [ReleaseDate], GETDATE()) <= 1";
                    break;
                case 2:
                    condition += " AND DATEDIFF(HOUR, [ReleaseDate], GETDATE()) <= 24";
                    break;
                case 3:
                    condition += " AND DATEDIFF(HOUR, [ReleaseDate], GETDATE()) <= 168";
                    break;
                case 4:
                    condition += " AND DATEDIFF(HOUR, [ReleaseDate], GETDATE()) <= 720";
                    break;
                case 5:
                    condition += " AND DATEDIFF(HOUR, [ReleaseDate], GETDATE()) <= 8640";
                    break;
            }

            switch (duration) {
                case 1:
                    condition += " AND [Length] < 30";
                    break;
                case 2:
                    condition += " AND [Length] BETWEEN 30 AND 60";
                    break;
                case 3:
                    condition += " AND [Length] > 60";
                    break;
            }

            switch (sortBy) {
                case 0:
                    orderby = "[UploadTimeOffset]";
                    break;
                case 1:
                    orderby = "[View]";
                    break;
                case 2:
                    orderby = "[Rate]";
                    break;
            }

            request.setAttribute("searchQueryString", q);
            request.setAttribute("searchUploadDate", uploadDate);
            request.setAttribute("searchDuration", duration);
            request.setAttribute("searchSortBy", sortBy);

            request.setAttribute("result", new VideoModel().search(condition, orderby));
            request.getRequestDispatcher("search.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(404);
        }
    }
}
