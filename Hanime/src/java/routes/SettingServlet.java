/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package routes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import entities.Auth;
import entities.User;
import jakarta.servlet.annotation.WebServlet;
import java.sql.Date;
import java.text.SimpleDateFormat;
import models.AuthModel;
import models.UserModel;
import utilities.Authentication;

/**
 *
 * @author yuyu2
 */
@WebServlet(urlPatterns = {"/setting"})
public class SettingServlet extends RequireAuthServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("setting.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String avatar = request.getParameter("avatar");
            String fullname = request.getParameter("fullname");
            Boolean gender = request.getParameter("gender").equals("male");
            String dob = request.getParameter("birthdate");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            String oldPassword = request.getParameter("old-password");
            String newPassword = request.getParameter("new-password");

            String notifyVideoUpload = request.getParameter("notify-video-upload");
            String notifyFriendRequest = request.getParameter("notify-friend-request");
            String notifyNews = request.getParameter("notify-news");
            String notifyUpdates = request.getParameter("notify-updates");

            String token = Authentication.getTokenFromCookies(request.getCookies());

            User user = Authentication.getUserInformationByToken(token);

            if (!avatar.isEmpty()) {
                user.setAvatarUrl(avatar);
            }

            user.setFullname(fullname);
            user.setGender(gender);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Long timestamp = sdf.parse(dob).getTime();
            user.setDob(new Date(timestamp));

            user.setEmail(email);
            user.setAddress(address);
            user.setPhone(phone);

            user.setNotifyVideoUpload(notifyVideoUpload != null);
            user.setNotifyFriendRequest(notifyFriendRequest != null);
            user.setNotifyNews(notifyNews != null);
            user.setNotifyUpdates(notifyUpdates != null);

            new UserModel().update(user);

            if (!oldPassword.isEmpty() && !newPassword.isEmpty()) {
                Auth auth = new AuthModel().get(user.getId());

                if (auth.getPassword().equals(oldPassword)) {
                    auth.setPassword(newPassword);

                    new AuthModel().update(auth);
                } else {
                    throw new Exception("Invalid input: Wrong password");
                }
            }

            response.sendRedirect(".");
            return;
        } catch (Exception e) {
            System.err.println(e);
            request.setAttribute("error", e.getMessage());
        }
        doGet(request, response);
    }
}
