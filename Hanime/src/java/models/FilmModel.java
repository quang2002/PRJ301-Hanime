package models;

import entities.Film;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.javatuples.Septet;

public class FilmModel extends ModelBase<Film> {

    public FilmModel() throws Exception {
        super(Film.class);
    }

    public boolean clearCategoryByFilmID(Long id) throws Exception {
        return getConnection().executeUpdate("DELETE FROM [FilmCategory] WHERE [FilmID] = ?", id) > 0;
    }

    public List<Map.Entry<Film, Integer>> getTrendingFilms(Integer top) {
        try ( ResultSet rs = getConnection().executeQuery("SELECT TOP " + top + " *, (SELECT SUM([View]) FROM [Video] WHERE [FilmID] = [Film].[ID]) AS [View] FROM [Film] ORDER BY [View] DESC")) {
            List<Map.Entry<Film, Integer>> result = new ArrayList<>();

            while (rs.next()) {
                result.add(new AbstractMap.SimpleEntry<>(
                        new Film(rs.getLong("ID"), rs.getNString("Name"), rs.getNString("Description"), rs.getString("ThumbnailUrl")),
                        rs.getInt("View")
                ));
            }

            return result;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            return null;
        }
    }

    public Double getRate(Long filmId) {
        try ( ResultSet rs = getConnection().executeQuery("SELECT AVG(CAST([Rate] AS REAL)) FROM [Rate], [Video] WHERE [VideoID] = [Video].[ID] AND [FilmID] = ?", filmId)) {
            if (rs.next()) {
                return Math.round(rs.getDouble(1) * 100) / 100.0;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public Integer getView(Long filmId) {
        try ( ResultSet rs = getConnection().executeQuery("SELECT SUM([View]) FROM [Video] WHERE [FilmID] = ?", filmId)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    public Boolean isUserFollowed(Long uid, Long fid) throws Exception {
        try ( ResultSet rs = getConnection().executeQuery("SELECT * FROM [Follow] WHERE [UserID] = ? AND [FilmID] = ?", uid, fid)) {
            if (rs.next()) {
                return true;
            }
        }
        return false;
    }

    public List<Map.Entry<Film, Integer>> getTrendingFilmsByCategory(Integer top, Long cid) {
        try ( ResultSet rs = getConnection().executeQuery("SELECT TOP " + top + " *, (SELECT SUM([View]) FROM [Video] WHERE [FilmID] = [Film].[ID]) AS [View] FROM [Film] WHERE [Film].[ID] IN (SELECT [FilmID] FROM [FilmCategory] WHERE [CategoryID] = ?) ORDER BY [View] DESC", cid)) {
            List<Map.Entry<Film, Integer>> result = new ArrayList<>();

            while (rs.next()) {
                result.add(new AbstractMap.SimpleEntry<>(
                        new Film(rs.getLong("ID"), rs.getNString("Name"), rs.getNString("Description"), rs.getString("ThumbnailUrl")),
                        rs.getInt("View")
                ));
            }

            return result;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            return null;
        }
    }

    public List<Septet<Integer, String, Integer, Integer, Double, Integer, Double>> getTopFilms(int top) throws SQLException {
        String sql
                = "WITH [a] AS\n"
                + "(SELECT [Video].[Name],\n"
                + "[Film].[Name] AS [Film],\n"
                + "[Film].[ID] AS [FilmID],\n"
                + "[Video].[View], \n"
                + "(SELECT (AVG(CAST([Rate].[Rate] AS REAL))) FROM [Rate] WHERE [Rate].[VideoID] = [Video].[ID]) AS [Rate]\n"
                + "FROM [Video], [Film]\n"
                + "WHERE [Video].[FilmID] = [Film].[ID])\n"
                + "SELECT [a].[Film], [a].[FilmID], SUM([a].[View]) as [View], SUM([a].[Rate]) as [Rate] , COUNT([Rate]) AS [RateCount]  --, ISNULL(SUM([a].[View]+[a].[Rate]*3),0) as Score \n"
                + "INTO [temp] FROM [a]\n"
                + "GROUP BY [a].[Film], [a].[FilmID];\n"
                + "\n"
                + "WITH [t] AS\n"
                + "(SELECT [temp].*, COUNT([Follow].[FilmID]) AS [Follow] FROM [temp] LEFT JOIN [Follow] ON [temp].[FilmID] = [Follow].[FilmID]\n"
                + "GROUP BY [temp].[Film],[temp].[FilmID],[temp].[Rate], [temp].[RateCount], [temp].[View] --, [temp].[Score]\n"
                + ") SELECT TOP "+top +" [t].[Film], [t].[View], ROUND(ISNULL([t].[Rate]/[t].[RateCount],0),2) AS [Rate], [t].[RateCount], [t].[Follow],\n"
                + "ROUND(ISNULL([t].[View]+[t].[Follow]*2 + [t].[Rate]/[t].[RateCount]*3,0),2) AS [Score] FROM [t]\n"
                + "ORDER BY [Score] DESC\n"
                + "\n"
                + "drop table [temp]";
        try ( ResultSet rs = getConnection().executeQuery(sql)) {
            List<Septet<Integer, String, Integer, Integer, Double, Integer, Double>> list = new ArrayList<>();
            int topOnBoard = 1;
            while (rs.next()) {
                list.add(
                        new Septet<>(
                                topOnBoard++,
                                rs.getString("Film"),
                                rs.getInt("View"),
                                rs.getInt("Follow"),
                                rs.getDouble("Rate"),
                                rs.getInt("RateCount"),
                                rs.getDouble("Score")
                        )
                );
            }
            return list;
        }

    }
}
