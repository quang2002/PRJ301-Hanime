package entities;

import com.yuyu.annotations.SQLColumn;
import com.yuyu.annotations.SQLTable;
import utilities.Crypto;

@SQLTable(table = "Auth")
public class Auth extends EntityBase {

    @SQLColumn(column = "Username")
    public String username;

    @SQLColumn(column = "Password")
    public String password;

    @SQLColumn(column = "IsAdmin")
    public Boolean isAdmin;

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
        this.password = Crypto.SHA256(password);
    }

    public Boolean isAdmin() {
        return isAdmin;
    }

    public void setRoleAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
}
