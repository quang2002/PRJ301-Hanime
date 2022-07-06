/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import entities.User;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author quang2002
 */
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
    
    public List<User> getTopUsersByExp(int top) throws SQLException{
        String sql 
                = "SELECT TOP " + top + " * FROM [User]"
                + "ORDER BY [Exp] DESC";
        try (ResultSet rs = getConnection().executeQuery(sql)) {
            List<User> list = new ArrayList<>();
            while(rs.next()){
                Long id = rs.getLong("ID");
                String avatarUrl = rs.getString("AvatarURL");
                String fullname = rs.getNString("Fullname");
                String email = rs.getNString("Email");
                String address = rs.getNString("Address");
                Date dob = rs.getDate("DOB");
                Boolean gender = rs.getBoolean("Gender");
                String phone = rs.getString("Phone");

                Boolean notifyVideoUpload = rs.getBoolean("NotifyVideoUpload");
                Boolean notifyFriendRequest = rs.getBoolean("NotifyFriendRequest");
                Boolean notifyNews = rs.getBoolean("NotifyNews");
                Boolean notifyUpdates = rs.getBoolean("NotifyUpdates");
                list.add(new User(id, avatarUrl, fullname, email, address, dob, gender, phone, notifyVideoUpload, notifyFriendRequest, notifyNews, notifyUpdates));
            }
            return list;
        }
    }
}
