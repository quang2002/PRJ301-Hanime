/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

/**
 *
 * @author quang2002
 */
public class Auth extends EntityBase {

    private String username;
    private String password;
    private Boolean isAdmin;

    public Auth() {
    }

    public Auth(long id, String username, String password, Boolean isAdmin) {
        super(id);
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean isAdmin() {
        return isAdmin;
    }

    public void setRoleAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
}
