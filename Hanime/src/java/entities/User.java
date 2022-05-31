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
public class User {

    private long id;
    private String email;
    private String address;
    private Date dob;
    private boolean gender;
    private String phone;

    public User() {
    }

    public User(long id, String email, String address, Date dob, boolean gender, String phone) {
        this.id = id;
        this.email = email;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.phone = phone;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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

    public boolean getGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", email=" + email + ", address=" + address + ", dob=" + dob + ", gender=" + gender + ", phone=" + phone + '}';
    }
}
