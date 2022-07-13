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
import utilities.Crypto;

@WebServlet(urlPatterns = {"/setting"})
public class SettingServlet extends RequireAuthServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("setting.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String avatar = request.getParameter("avatar").trim();
            String fullname = request.getParameter("fullname").trim();
            Boolean gender = request.getParameter("gender").equals("male");
            String dob = request.getParameter("birthdate").trim();
            String phone = request.getParameter("phone").trim();
            String email = request.getParameter("email").trim();
            String address = request.getParameter("address").trim();

            String oldPassword = request.getParameter("old-password").trim();
            String newPassword = request.getParameter("new-password").trim();

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

            if (!dob.isEmpty()) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Long timestamp = sdf.parse(dob).getTime();
                user.setDob(new Date(timestamp));
            }

            user.setEmail(email);
            user.setAddress(address);
            user.setPhone(phone);

            user.setNotifyVideoUpload(notifyVideoUpload != null);
            user.setNotifyFriendRequest(notifyFriendRequest != null);
            user.setNotifyNews(notifyNews != null);
            user.setNotifyUpdates(notifyUpdates != null);

            new UserModel().update(user);

            if (!oldPassword.isEmpty() && !newPassword.isEmpty()) {
                oldPassword = Crypto.SHA256(oldPassword);
                newPassword = Crypto.SHA256(newPassword);

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
