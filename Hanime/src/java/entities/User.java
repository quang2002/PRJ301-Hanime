/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import java.sql.Date;

/**
 *
 * @author quang2002
 */
public class User extends EntityBase {

    private String avatarUrl;
    private String fullname;
    private String email;
    private String address;
    private Date dob;
    private Boolean gender;
    private String phone;

    private boolean notifyVideoUpload;
    private boolean notifyFriendRequest;
    private boolean notifyNews;
    private boolean notifyUpdates;

    public User() {
    }

    public User(Long id, String avatarUrl, String fullname, String email, String address, Date dob, Boolean gender, String phone, boolean notifyVideoUpload, boolean notifyFriendRequest, boolean notifyNews, boolean notifyUpdates) {
        super(id);
        this.avatarUrl = avatarUrl;
        this.fullname = fullname;
        this.email = email;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.phone = phone;
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
}
