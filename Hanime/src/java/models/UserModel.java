/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import entities.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author quang2002
 */
public class UserModel extends ModelBase<User> {

    @Override
    public int add(User obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement(
                "INSERT INTO [User] VALUES (?, ?, ?, ?, ?, ?, ? ,?, ?, ?, ?, ?)",
                obj.getId(),
                obj.getAvatarUrl(),
                obj.getFullname(),
                obj.getEmail(),
                obj.getAddress(),
                obj.getDob(),
                obj.getGender(),
                obj.getPhone(),
                obj.isNotifyVideoUpload(),
                obj.isNotifyFriendRequest(),
                obj.isNotifyNews(),
                obj.isNotifyUpdates()
        )) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public int update(User obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement(
                "UPDATE [User] SET [AvatarURL] = ?, [Fullname] = ?, [Email] = ?, [Address] = ?, [DOB] = ?, [Gender] = ?, [Phone] = ?, [NotifyVideoUpload] = ?, [NotifyFriendRequest] = ?, [NotifyNews] = ?, [NotifyUpdates] = ? WHERE [ID] = ?",
                obj.getAvatarUrl(),
                obj.getFullname(),
                obj.getEmail(),
                obj.getAddress(),
                obj.getDob(),
                obj.getGender(),
                obj.getPhone(),
                obj.isNotifyVideoUpload(),
                obj.isNotifyFriendRequest(),
                obj.isNotifyNews(),
                obj.isNotifyUpdates(),
                obj.getId()
        )) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public int remove(User obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement("DELETE FROM [User] WHERE [ID] = ? ", obj.getId())) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public Map<Long, User> getall() throws SQLException {
        try ( PreparedStatement stmt = createStatement("SELECT * FROM [User]")) {
            Map<Long, User> result = new HashMap<>();

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
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

                result.put(id, new User(id, avatarUrl, fullname, email, address, dob, gender, phone, notifyVideoUpload, notifyFriendRequest, notifyNews, notifyUpdates));
            }

            return result;
        }
    }

    public User getByUsername(String username) throws SQLException {
        try ( PreparedStatement stmt = createStatement("SELECT [User].* FROM [User], [Auth] WHERE [User].[ID] = [Auth].[ID] AND [Username] = ?", username)) {
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
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

                return new User(id, avatarUrl, fullname, email, address, dob, gender, phone, notifyVideoUpload, notifyFriendRequest, notifyNews, notifyUpdates);
            }
        }
        return null;
    }

    @Override
    public User get(Long id) throws SQLException {
        try ( PreparedStatement stmt = createStatement("SELECT * FROM [User] WHERE [ID] = ?", id);  ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
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

                return new User(id, avatarUrl, fullname, email, address, dob, gender, phone, notifyVideoUpload, notifyFriendRequest, notifyNews, notifyUpdates);
            }

            return null;
        }
    }
}
