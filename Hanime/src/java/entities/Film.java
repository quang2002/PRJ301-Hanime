/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.yuyu.annotations.SQLColumn;
import com.yuyu.annotations.SQLTable;

/**
 *
 * @author yuyu2
 */
@SQLTable(table = "Film")
public class Film extends EntityBase {

    @SQLColumn(column = "Name")
    public String name;

    @SQLColumn(column = "Description")
    public String description;

    @SQLColumn(column = "ThumbnailURL")
    public String thumbnailUrl;

    public Film() {
    }

    public Film(Long id, String name, String description, String thumbnailUrl) {
        super(id);
        this.name = name;
        this.description = description;
        this.thumbnailUrl = thumbnailUrl;
    }

    public Film(ResultSet rs) throws SQLException{
        this(
            rs.getLong("ID"),
            rs.getString("Name"),
            rs.getString("Description"),
            rs.getString("ThumbnailURL")
        );
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;
    }
}
