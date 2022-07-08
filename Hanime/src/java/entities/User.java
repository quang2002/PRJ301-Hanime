/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import com.yuyu.annotations.SQLColumn;
import com.yuyu.annotations.SQLTable;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.json.JSONObject;
import utilities.GlobalConstants;

/**
 *
 *
 * @author quang2002
 */
@SQLTable(table = "User")
public class User extends EntityBase {

    @SQLColumn(column = "AvatarURL")
    public String avatarUrl;

    @SQLColumn(column = "Fullname")
    public String fullname;

    @SQLColumn(column = "Email")
    public String email;

    @SQLColumn(column = "Address")
    public String address;

    @SQLColumn(column = "DOB")
    public Date dob;

    @SQLColumn(column = "Gender")
    public Boolean gender;

    @SQLColumn(column = "Phone")
    public String phone;

    @SQLColumn(column = "Exp")
    public Integer exp;

    @SQLColumn(column = "NotifyVideoUpload")
    public Boolean notifyVideoUpload;

    @SQLColumn(column = "NotifyFriendRequest")
    public Boolean notifyFriendRequest;

    @SQLColumn(column = "NotifyNews")
    public Boolean notifyNews;

    @SQLColumn(column = "NotifyUpdates")
    public Boolean notifyUpdates;

    public User() {
    }

    public User(ResultSet rs) throws SQLException {
        this(
                rs.getLong("ID"),
                rs.getString("AvatarURL"),
                rs.getNString("Fullname"),
                rs.getNString("Email"),
                rs.getNString("Address"),
                rs.getDate("DOB"),
                rs.getBoolean("Gender"),
                rs.getString("Phone"),
                rs.getInt("Exp"),
                rs.getBoolean("NotifyVideoUpload"),
                rs.getBoolean("NotifyFriendRequest"),
                rs.getBoolean("NotifyNews"),
                rs.getBoolean("NotifyUpdates")
        );
    }

    public User(Long id, String avatarUrl, String fullname, String email, String address, Date dob, Boolean gender, String phone, Integer exp, boolean notifyVideoUpload, boolean notifyFriendRequest, boolean notifyNews, boolean notifyUpdates) {
        super(id);
        this.avatarUrl = avatarUrl;
        this.fullname = fullname;
        this.email = email;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.phone = phone;
        this.exp = exp;
        this.notifyVideoUpload = notifyVideoUpload;
        this.notifyFriendRequest = notifyFriendRequest;
        this.notifyNews = notifyNews;
        this.notifyUpdates = notifyUpdates;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Boolean getGender() {
        return gender;
    }
    
    public String getGenderr(){
        return gender?"Male":"Female";
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isNotifyVideoUpload() {
        return notifyVideoUpload;
    }

    public void setNotifyVideoUpload(boolean notifyVideoUpload) {
        this.notifyVideoUpload = notifyVideoUpload;
    }

    public boolean isNotifyFriendRequest() {
        return notifyFriendRequest;
    }

    public void setNotifyFriendRequest(boolean notifyFriendRequest) {
        this.notifyFriendRequest = notifyFriendRequest;
    }

    public boolean isNotifyNews() {
        return notifyNews;
    }

    public void setNotifyNews(boolean notifyNews) {
        this.notifyNews = notifyNews;
    }

    public boolean isNotifyUpdates() {
        return notifyUpdates;
    }

    public void setNotifyUpdates(boolean notifyUpdates) {
        this.notifyUpdates = notifyUpdates;
    }

    public int getExp() {
        return exp;
    }

    public void setExp(int exp) {
        this.exp = exp;
    }

    public int getLevel() {
        return exp / GlobalConstants.EXP_PER_LEVEL + 1;
    }

    public JSONObject toJSON() {
        try {
            JSONObject object = new JSONObject();

            object.put("id", id);
            object.put("avatar_url", avatarUrl);
            object.put("fullname", fullname);
            object.put("email", email);
            object.put("address", address);
            object.put("dob", dob);
            object.put("gender", gender);
            object.put("phone", phone);
            object.put("exp", exp);
            object.put("level", getLevel());

            object.put("notify_video_upload", notifyVideoUpload);
            object.put("notify_friend_request", notifyFriendRequest);
            object.put("notify_news", notifyNews);
            object.put("notify_updates", notifyUpdates);

            return object;
        } catch (Exception e) {
            return null;
        }
    }
}
