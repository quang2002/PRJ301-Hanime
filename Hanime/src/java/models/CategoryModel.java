/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import entities.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import static models.ModelBase.createStatement;

/**
 *
 * @author yuyu2
 */
public class CategoryModel extends ModelBase<Category> {

    @Override
    public Category get(Long id) throws SQLException {
        try ( PreparedStatement stmt = createStatement("SELECT * FROM [Auth] WHERE [ID] = ?", id);  ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                String name = rs.getString("Name");
                String description = rs.getString("Description");

                return new Category(id, name, description);
            }

            return null;
        }
    }

    @Override
    public int add(Category obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement(
                "INSERT INTO [Category]([Name], [Description]) VALUES (?, ?)",
                obj.getName(),
                obj.getDescription()
        )) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public int update(Category obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement(
                "UPDATE [Category] SET [Name] = ?, [Description] = ? WHERE [ID] = ?",
                obj.getName(),
                obj.getDescription(),
                obj.getId()
        )) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public int remove(Category obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement(
                "DELETE FROM [Category] WHERE [ID] = ?",
                obj.getId()
        )) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public Map<Long, Category> getall() throws SQLException {
        try ( PreparedStatement stmt = createStatement("SELECT * FROM [Auth]"); ResultSet rs = stmt.executeQuery()) {
            Map<Long, Category> result = new HashMap<>();

            while (rs.next()) {
                Long id = rs.getLong("ID");
                String name = rs.getString("Name");
                String description = rs.getString("Description");

                result.put(id, new Category(id, name, description));
            }

            return result;
        }
    }
}
