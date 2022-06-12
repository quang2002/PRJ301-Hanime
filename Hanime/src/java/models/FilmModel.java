/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import entities.Film;
import java.sql.Date;
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
public class FilmModel extends ModelBase<Film> {

    @Override
    public Film get(Long id) throws SQLException {
        try ( PreparedStatement stmt = createStatement("SELECT * FROM [Film] WHERE [ID] = ?", id);  ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                String name = rs.getString("Name");
                String description = rs.getString("Description");
                String thumnailUrl = rs.getString("ThumbnailURL");
                String videoUrl = rs.getString("VideoURL");
                Date releaseDate = rs.getDate("ReleaseDate");
                Integer length = rs.getInt("Length");
                Long view = rs.getLong("View");

                return new Film(id, name, description, thumnailUrl, videoUrl, releaseDate, length, view);
            }

            return null;
        }
    }

    @Override
    public int add(Film obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement(
                "INSERT INTO [Film]([Name], [Description], [ThumbnailURL], [VideoURL], [ReleaseDate], [Length], [View]) VALUES (?, ?, ?, ?, ? ,?, ?)",
                obj.getName(),
                obj.getDescription(),
                obj.getThumbnailUrl(),
                obj.getVideoUrl(),
                obj.getReleaseDate(),
                obj.getLength(),
                obj.getView()
        )) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public int update(Film obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement(
                "UPDATE [Film] SET [Name] = ?, [Description] = ?, [ThumbnailURL] = ?, [VideoURL] = ?, [ReleaseDate] = ?, [Length] = ?, [View] = ? WHERE [ID] = ?",
                obj.getName(),
                obj.getDescription(),
                obj.getThumbnailUrl(),
                obj.getVideoUrl(),
                obj.getReleaseDate(),
                obj.getLength(),
                obj.getView(),
                obj.getId()
        )) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public int remove(Film obj) throws SQLException {
        try ( PreparedStatement stmt = createStatement(
                "DELETE FROM [Film] WHERE [ID] = ?",
                obj.getId()
        )) {
            return stmt.executeUpdate();
        }
    }

    @Override
    public Map<Long, Film> getall() throws SQLException {
        try ( PreparedStatement stmt = createStatement("SELECT * FROM [Film]");  ResultSet rs = stmt.executeQuery()) {
            Map<Long, Film> result = new HashMap<>();

            while (rs.next()) {
                Long id = rs.getLong("ID");
                String name = rs.getString("Name");
                String description = rs.getString("Description");
                String thumnailUrl = rs.getString("ThumbnailURL");
                String videoUrl = rs.getString("VideoURL");
                Date releaseDate = rs.getDate("ReleaseDate");
                Integer length = rs.getInt("Length");
                Long view = rs.getLong("View");

                result.put(id, new Film(id, name, description, thumnailUrl, videoUrl, releaseDate, length, view));
            }
            return result;
        }
    }

}
