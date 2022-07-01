/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import entities.Film;
import entities.Video;
import java.sql.ResultSet;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author yuyu2
 */
public class VideoModel extends ModelBase<Video> {

    private final FilmModel filmModel;

    public VideoModel() throws Exception {
        super(Video.class);

        filmModel = new FilmModel();
    }

    public Map.Entry<Film, List<Video>> getVideosByFilmID(Long filmId) throws Exception {
        Film film = filmModel.get(filmId);

        if (film == null) {
            return null;
        }

        List<Video> videos = new ArrayList<>();
        Map.Entry<Film, List<Video>> result = new AbstractMap.SimpleEntry<>(film, videos);

        try ( ResultSet rs = getConnection().executeQuery("SELECT * FROM [Video] WHERE [FilmID] = ?", filmId)) {
            while (rs.next()) {

                Video video = new Video(
                        rs.getLong("ID"),
                        rs.getNString("Name"),
                        rs.getString("ThumbnailURL"),
                        rs.getString("VideoURL"),
                        rs.getDate("ReleaseDate"),
                        rs.getInt("Length"),
                        rs.getLong("View"),
                        filmId
                );

                if (video.getThumbnailUrl() == null) {
                    video.setThumbnailUrl(film.getThumbnailUrl());
                    update(video);
                }

                videos.add(video);
            }
        }

        return result;
    }

    public Long increaseVideoView(Long uid) throws Exception {
        Video video = get(uid);
        video.setView(video.getView() + 1);
        update(video);

        return video.getView();
    }

    @Override
    public List<Video> getall() throws Exception {
        List<Video> videos = super.getall();

        if (videos != null) {
            for (Video video : videos) {
                if (video.getThumbnailUrl() == null) {
                    Film film = filmModel.get(video.getFilmId());

                    if (film != null) {
                        video.setThumbnailUrl(film.getThumbnailUrl());
                        update(video);
                    }
                }
            }
        }

        return videos;
    }

    @Override
    public Video get(Object... primaryKeys) throws Exception {
        Video video = super.get(primaryKeys);

        if (video != null && video.getThumbnailUrl() == null) {
            Film film = filmModel.get(video.getFilmId());

            if (film != null) {
                video.setThumbnailUrl(film.getThumbnailUrl());
                update(video);
            }
        }

        return video;
    }
}
