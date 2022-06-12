/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import java.sql.Date;

/**
 *
 * @author yuyu2
 */
public class Film extends EntityBase {

    private String name;
    private String description;
    private String thumbnailUrl;
    private String videoUrl;
    private Date releaseDate;
    private Integer length;
    private Long view;

    public Film() {
    }

    public Film(Long id, String name, String description, String thumbnailUrl, String videoUrl, Date releaseDate, Integer length, Long view) {
        super(id);
        this.name = name;
        this.description = description;
        this.thumbnailUrl = thumbnailUrl;
        this.videoUrl = videoUrl;
        this.releaseDate = releaseDate;
        this.length = length;
        this.view = view;
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

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
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
}
