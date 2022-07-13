package models;

import entities.User;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserModel extends ModelBase<User> {

    public UserModel() throws Exception {
        super(User.class);
    }

    public User getByUsername(String username) throws SQLException {
        try ( ResultSet rs = getConnection().executeQuery("SELECT [User].* FROM [User], [Auth] WHERE [User].[ID] = [Auth].[ID] AND [Username] = ?", username)) {
            if (rs.next()) {
                Long id = rs.getLong("ID");
                String avatarUrl = rs.getString("AvatarURL");
                String fullname = rs.getNString("Fullname");
                String email = rs.getNString("Email");
                String address = rs.getNString("Address");
                Date dob = rs.getDate("DOB");
                Boolean gender = rs.getBoolean("Gender");
                String phone = rs.getString("Phone");
                Integer exp = rs.getInt("Exp");

                Boolean notifyVideoUpload = rs.getBoolean("NotifyVideoUpload");
                Boolean notifyFriendRequest = rs.getBoolean("NotifyFriendRequest");
                Boolean notifyNews = rs.getBoolean("NotifyNews");
                Boolean notifyUpdates = rs.getBoolean("NotifyUpdates");

                return new User(id, avatarUrl, fullname, email, address, dob, gender, phone, exp, notifyVideoUpload, notifyFriendRequest, notifyNews, notifyUpdates);
            }
        }
        return null;
    }

    public int increaseUserExp(Long uid, int exp) throws Exception {
        User user = get(uid);
        user.setExp(user.getExp() + exp);
        update(user);
        return user.getExp();
    }

    public List<Long> getUserIDHasCondition(String condition, Object... params) {
        try ( ResultSet rs = getConnection().executeQuery("SELECT [ID] FROM [" + getTableName() + "] WHERE " + condition, params)) {
            List<Long> result = new ArrayList<>();
            while (rs.next()) {
                result.add(rs.getLong(1));
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public List<User> getTopUsersByExp(int top) throws SQLException{
        String sql 
                = "SELECT TOP " + top + " * FROM [User]\n"
                + "ORDER BY [Exp] DESC";
        try (ResultSet rs = getConnection().executeQuery(sql)) {
            List<User> list = new ArrayList<>();
            while(rs.next()){
                list.add(new User(rs));
            }
            return list;
        }
    }
}
