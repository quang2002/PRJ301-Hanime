/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package routes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import models.CategoryModel;
import models.FilmModel;

/**
 *
 * @author yuyu2
 */
@WebServlet(name = "CategoryServlet", urlPatterns = {"/category"})
public class CategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));
            String sTop = request.getParameter("top");

            Integer top = 10;
            if (sTop != null) {
                top = Integer.parseInt(sTop);
            }

            request.setAttribute("category", new CategoryModel().get(id));
            request.setAttribute("top", top);
            request.setAttribute("films", new FilmModel().getTrendingFilmsByCategory(top, id));
            request.getRequestDispatcher("category.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }
}
