package models;

import entities.Rate;
import java.sql.ResultSet;

public class RateModel extends ModelBase<Rate> {

    public RateModel() throws Exception {
        super(Rate.class);
    }

    public boolean rate(Rate data) {
        try {
            insert(data);
        } catch (Exception ex1) {
            return updateByVideoAndUser(data);
        }
        return true;
    }

    public Rate getByVideoAndUser(Long vid, Long uid) throws Exception {
        try ( ResultSet rs = getConnection().executeQuery("SELECT * FROM [Rate] WHERE [VideoID] = ? AND [UserID] = ?", vid, uid)) {
            if (rs.next()) {
                return new Rate(
                        rs.getLong("ID"),
                        rs.getLong("VideoID"),
                        rs.getLong("UserID"),
                        rs.getInt("Rate")
                );
            }
        }
        return null;
    }

    public boolean updateByVideoAndUser(Rate data) {
        try {
            return getConnection().executeUpdate("UPDATE [Rate] SET [Rate] = ? WHERE [VideoID] = ? AND [UserID] = ?", data.getRate(), data.getVideoId(), data.getUserId()) > 0;
        } catch (Exception e) {
            return false;
        }
    }
}
