/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import entities.Auth;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author quang2002
 */
public class AuthModel extends ModelBase<Auth> {

    @Override
    public int add(Auth obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement("INSERT INTO [Auth]([Username], [Password], [IsAdmin]) VALUES (?, ?, ?)", obj.getUsername(), obj.getPassword(), obj.isAdmin())) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public int update(Auth obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement("UPDATE [Auth] SET [Username] = ?, [Password] = ?, [isAdmin] = ? WHERE [ID] = ?", obj.getUsername(), obj.getPassword(), obj.isAdmin(), obj.getId())) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public int remove(Auth obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement("DELETE FROM [Auth] WHERE [ID] = ?", obj.getId())) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public Set<Auth> getall() throws SQLException {
        try ( PreparedStatement stmt = createStatement("SELECT * FROM [Auth]")) {
            Set<Auth> result = new HashSet<>();

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Long id = rs.getLong("ID");
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                Boolean isAdmin = rs.getBoolean("IsAdmin");

                result.add(new Auth(id, username, password, isAdmin));
            }

            return result;
        }
    }

    @Override
    public Auth get(Long id) throws SQLException {
        try ( PreparedStatement stmt = createStatement("SELECT * FROM [Auth] WHERE [ID] = ?", id);  ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                String username = rs.getString("Username");
                String password = rs.getString("Password");
                Boolean isAdmin = rs.getBoolean("IsAdmin");

                return new Auth(id, username, password, isAdmin);
            }
            return null;
        }
    }
}
