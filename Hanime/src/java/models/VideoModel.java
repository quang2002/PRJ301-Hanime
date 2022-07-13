package models;

import entities.Film;
import entities.Video;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.javatuples.Sextet;

public class VideoModel extends ModelBase<Video> {

    private final FilmModel filmModel;

    public VideoModel() throws Exception {
        super(Video.class);

        filmModel = new FilmModel();
    }

    public int createNewVideo(String name, String thumbnailUrl, String videoUrl, Integer length, Long filmId) throws Exception {
        return getConnection().executeUpdate("INSERT INTO [Video]([Name], [ThumbnailURL], [VideoURL], [Length], [View], [FilmID]) VALUES (?, ?, ?, ?, ?, ?)", name, thumbnailUrl, videoUrl, length, 0, filmId);
    }

    public int update(Long id, String name, String thumbnailUrl, String videoUrl, Integer length, Long filmId) throws Exception {
        return getConnection().executeUpdate("UPDATE [Video] SET [Name] = ?, [ThumbnailURL] = ?, [VideoURL] = ?, [Length] = ?, [FilmID] = ? WHERE [ID] = ?", name, thumbnailUrl, videoUrl, length, filmId, id);
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
                        rs.getTimestamp("ReleaseDate"),
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

    public List<Video> search(String condition, String orderby) {
        List<Video> result = new ArrayList<>();

        String sql
                = "SELECT \n"
                + "*, \n"
                + "(SELECT AVG(CAST([Rate].[Rate] AS REAL)) FROM [Rate] WHERE [Rate].[VideoID] = [Video].[ID]) AS [Rate], \n"
                + "(DATEDIFF(HOUR, [ReleaseDate], GETDATE())) AS [UploadTimeOffset] \n"
                + "FROM [" + getTableName() + "]\n"
                + "WHERE " + condition + "\n"
                + "ORDER BY " + orderby + " DESC";

        try ( ResultSet rs = getConnection().executeQuery(sql)) {
            while (rs.next()) {
                result.add(new Video(
                        rs.getLong("ID"),
                        rs.getNString("Name"),
                        rs.getString("ThumbnailURL"),
                        rs.getString("VideoURL"),
                        rs.getTimestamp("ReleaseDate"),
                        rs.getInt("Length"),
                        rs.getLong("View"),
                        rs.getLong("FilmID")
                ));

                System.out.println(rs.getInt("UploadTimeOffset"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public int getAllView() throws Exception {
        int totalView = 0;
        List<Video> videos = getall();
        for (Video video : videos) {
            totalView += video.view;
        }
        return totalView;
    }
    
    public List<Sextet<Integer, String, String, Integer, Double, Double>> getTopVideos(int top) throws SQLException {
        String sql
                = "WITH [a] AS\n"
                + "(SELECT [Video].[Name],\n"
                + "[Film].[Name] AS [Film],\n"
                + "[Film].[ID] AS [FilmID],\n"
                + "[Video].[View], \n"
                + "(SELECT (AVG(CAST([Rate].[Rate] AS REAL))) FROM [Rate] WHERE [Rate].[VideoID] = [Video].[ID]) AS [Rate]\n"
                + "FROM [Video], [Film]\n"
                + "WHERE [Video].[FilmID] = [Film].[ID])\n"
                + "SELECT TOP " + top + " [a].[Name] AS [Video], [a].[Film], [a].[View], ISNULL([a].[Rate],0) AS [Rate],\n"
                + "ISNULL([a].[View]+[a].[Rate]*3,0) AS [Score]\n"
                + "FROM [a]";
        try ( ResultSet rs = getConnection().executeQuery(sql)) {
            List<Sextet<Integer, String, String, Integer, Double, Double>> list = new ArrayList<>();
            int topOnBoard = 1;
            while (rs.next()) {
                list.add(
                        new Sextet<>(
                                topOnBoard++,
                                rs.getString("Video"),
                                rs.getString("Film"),
                                rs.getInt("View"),
                                rs.getDouble("Rate"),
                                rs.getDouble("Score")
                        )
                );
            }
            return list;
        }
    }
}
