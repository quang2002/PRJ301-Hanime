package entities;

import com.yuyu.annotations.SQLColumn;
import com.yuyu.annotations.SQLTable;

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
