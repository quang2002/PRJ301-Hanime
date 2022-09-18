package models;

import entities.Notification;
import entities.User;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import utilities.SMTP;

public class NotificationModel extends ModelBase<Notification> {

    private final SMTP smtp;

    public NotificationModel() throws Exception {
        this(null);
    }

    public NotificationModel(SMTP smtp) throws Exception {
        super(Notification.class);
        this.smtp = smtp;
    }

    public int insertCurrentTime(Notification notification) throws Exception {
        return getConnection().executeUpdate(
                "INSERT INTO [" + getTableName() + "]([Content], [UserID], [NavLink]) VALUES (?, ?, ?)",
                notification.getContent(),
                notification.getUserId(),
                notification.getNavLink()
        );
    }

    public boolean create(Notification notification) {
        try {
            if (notification.getTime() != null) {
                insert(notification);
            } else {
                insertCurrentTime(notification);
            }

            if (smtp == null) {
                return true;
            }

            if (notification.getUserId() != null) {
                User user = new UserModel().get(notification.getUserId());

                smtp.sendMimeMessageWithThread("Hanime (Notify)", user.getEmail(), notification.getContent(), "");
            } else {
                for (User user : new UserModel().getall()) {
                    smtp.sendMimeMessageWithThread("Hanime (Notify)", user.getEmail(), notification.getContent(), "");
                }
            }
        } catch (Exception e) {
            return false;
        }

        return true;
    }

    public List<Notification> getByUserID(Long uid) {
        List<Notification> result = new ArrayList<>();

        try ( ResultSet rs = getConnection().executeQuery("SELECT * FROM [Notification] WHERE [UserID] = ? OR [UserID] IS NULL ORDER BY [Time] DESC", uid)) {
            while (rs.next()) {
                result.add(new Notification(
                        rs.getNString("Content"),
                        rs.getLong("UserID"),
                        new Time(rs.getTimestamp("Time").getTime()),
                        rs.getString("NavLink")
                ));
            }
        } catch (Exception ex) {
            return null;
        }

        return result;
    }

    public List<Notification> getByUserID(Long uid, Integer top) {
        List<Notification> result = new ArrayList<>();

        try ( ResultSet rs = getConnection().executeQuery("SELECT TOP " + top + " * FROM [Notification] WHERE [UserID] = ? OR [UserID] IS NULL ORDER BY [Time] DESC", uid)) {
            while (rs.next()) {
                result.add(new Notification(
                        rs.getNString("Content"),
                        rs.getLong("UserID"),
                        new Time(rs.getTimestamp("Time").getTime()),
                        rs.getString("NavLink")
                ));
            }
        } catch (Exception ex) {
            return null;
        }

        return result;
    }

    public void clean() {
        try {
            // Delete notifications after a month
            getConnection().execute("EXEC [sp_delete_expired_notications] 30");
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
