package models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utilities.Crypto;

public class Procedures {

    public static Long checkAuth(String username, String password) throws SQLException {
        password = Crypto.SHA256(password);

        try ( ResultSet rs = ModelBase.connection().executeQuery(
                "SELECT [ID] FROM [Auth] WHERE [Username] = ? AND [Password] = ? COLLATE Latin1_General_CS_AS",
                username, password
        )) {
            if (rs.next()) {
                return rs.getLong("ID");
            }
            return null;
        }
    }

    public static void createAccount(String username, String password, String email, Boolean gender, Boolean isAdmin) throws SQLException {
        try ( PreparedStatement stmt = ModelBase.connection().prepareStatement(
                "EXEC [sp_create_account] ?, ?, ?, ?, ?",
                username, Crypto.SHA256(password), email, gender, isAdmin
        )) {
            stmt.execute();
        }
    }
}
