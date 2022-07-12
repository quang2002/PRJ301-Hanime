/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import entities.Film;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.javatuples.Septet;

/**
 *
 * @author yuyu2
 */
public class FilmModel extends ModelBase<Film> {

    public FilmModel() throws Exception {
        super(Film.class);
    }

    public List<Septet<Integer, String, Integer, Integer, Double,Integer, Double>> getTopFilms(int top) throws SQLException {
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
                + "WITH [t] AS\n"
                + "(SELECT [temp].*, COUNT([temp].[Film]) AS [Follow] FROM [temp] LEFT JOIN [Follow] ON [temp].[FilmID] = [Follow].[FilmID]\n"
                + "GROUP BY [temp].[Film],[temp].[FilmID],[temp].[Rate], [temp].[RateCount], [temp].[View] --, [temp].[Score]\n"
                + ") SELECT [t].[Film], [t].[View], ROUND(ISNULL([t].[Rate]/[t].[RateCount],0),2) AS [Rate], [t].[RateCount], [t].[Follow],\n"
                + "ROUND(ISNULL([t].[View]+[t].[Follow]*2 + [t].[Rate]/[t].[RateCount]*3,0),2) AS [Score] FROM [t]\n"
                + "ORDER BY [Score] DESC\n"
                + "drop table [temp]";
        try ( ResultSet rs = getConnection().executeQuery(sql)) {
            List<Septet<Integer, String, Integer, Integer, Double,Integer, Double>> list = new ArrayList<>();
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
