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
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author quang2002
 */
public class UserModel extends ModelBase<User> {

    @Override
    public int add(User obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement(
                "INSERT INTO [Users] VALUES (?, ?, ?, ?, ?, ?)",
                obj.getId(),
                obj.getEmail(),
                obj.getAddress(),
                obj.getDob(),
                obj.getGender(),
                obj.getPhone()
        )) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public int update(User obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement(
                "UPDATE [Users] SET [Email] = ?, [Address] = ?, [DOB] = ?, [Gender] = ?, [Phone] = ? WHERE [ID] = ?",
                obj.getEmail(),
                obj.getAddress(),
                obj.getDob(),
                obj.getGender(),
                obj.getPhone(),
                obj.getId()
        )) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public int remove(User obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement("DELETE FROM [Users] WHERE [ID] = ? ", obj.getId())) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public Set<User> getall() throws SQLException {
        try ( PreparedStatement stmt = createStatement("SELECT * FROM [Users]")) {
            Set<User> result = new HashSet<>();

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Long id = rs.getLong("ID");
                String email = rs.getNString("Email");
                String address = rs.getNString("Address");
                Date dob = rs.getDate("DOB");
                boolean gender = rs.getBoolean("Gender");
                String phone = rs.getString("Phone");

                result.add(new User(id, email, address, dob, gender, phone));
            }

            return result;
        }
    }

    public User getByUsername(String username) throws SQLException {
        try ( PreparedStatement stmt = createStatement("SELECT [Users].* FROM [Users], [Auth] WHERE [Users].[ID] = [Auth].[ID] AND [Username] = ?", username)) {
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Long id = rs.getLong("ID");
                String email = rs.getNString("Email");
                String address = rs.getNString("Address");
                Date dob = rs.getDate("DOB");
                boolean gender = rs.getBoolean("Gender");
                String phone = rs.getString("Phone");

                return new User(id, email, address, dob, gender, phone);
            }
        }
        return null;
    }

    @Override
    public User get(Long id) throws SQLException {
        try ( PreparedStatement stmt = createStatement("SELECT * FROM [Users] WHERE [ID] = ?", id);  ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                String email = rs.getNString("Email");
                String address = rs.getNString("Address");
                Date dob = rs.getDate("DOB");
                boolean gender = rs.getBoolean("Gender");
                String phone = rs.getString("Phone");

                return new User(id, email, address, dob, gender, phone);
            }

            return null;
        }
    }
}
