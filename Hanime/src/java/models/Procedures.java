/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static models.ModelBase.createStatement;
import utilities.Crypto;

/**
 *
 * @author yuyu2
 */
public class Procedures {

    public static Long checkAuth(String username, String password) throws SQLException {
        password = Crypto.SHA256(password);

        try ( PreparedStatement stmt = createStatement(
                "SELECT [ID] FROM [Auth] WHERE [Username] = ? AND [Password] = ? COLLATE Latin1_General_CS_AS",
                username, password
        );  ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getLong("ID");
            }
            return null;
        }
    }

    public static void createAccount(String username, String password, String email, Boolean gender, Boolean isAdmin) throws SQLException {
        try ( PreparedStatement stmt = createStatement(
                "EXEC [sp_create_account] ?, ?, ?, ?, ?",
                username, Crypto.SHA256(password), email, gender, isAdmin
        )) {
            stmt.execute();
        }
    }
}
