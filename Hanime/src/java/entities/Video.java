package entities;

import com.yuyu.annotations.SQLColumn;
import com.yuyu.annotations.SQLTable;
import java.sql.Timestamp;

@SQLTable(table = "Video")
public class Video extends EntityBase {

    @SQLColumn(column = "Name")
    public String name;

    @SQLColumn(column = "ThumbnailURL")
    public String thumbnailUrl;

    @SQLColumn(column = "VideoURL")
    public String videoUrl;

    @SQLColumn(column = "ReleaseDate")
    public Timestamp releaseDate;

    @SQLColumn(column = "Length")
    public Integer length;

    @SQLColumn(column = "View")
    public Long view;

    @SQLColumn(column = "FilmID")
    public Long filmId;

    public Video() {
    }

    public Video(Long id, String name, String thumbnailUrl, String videoUrl, Timestamp releaseDate, Integer length, Long view, Long filmId) {
        super(id);
        this.name = name;
        this.thumbnailUrl = thumbnailUrl;
        this.videoUrl = videoUrl;
        this.releaseDate = releaseDate;
        this.length = length;
        this.view = view;
        this.filmId = filmId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl) {
        this.thumbnailUrl = thumbnailUrl;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public Timestamp getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Timestamp releaseDate) {
        this.releaseDate = releaseDate;
    }

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    public Long getView() {
        return view;
    }

    public void setView(Long view) {
        this.view = view;
    }

    public Long getFilmId() {
        return filmId;
    }

    public void setFilmId(Long filmId) {
        this.filmId = filmId;
    }
}
