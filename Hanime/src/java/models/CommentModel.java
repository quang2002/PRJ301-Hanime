/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import entities.User;
import entities.Comment;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.javatuples.Quintet;

/**
 *
 * @author yuyu2
 */
public class CommentModel extends ModelBase<Comment> {

    public CommentModel() throws Exception {
        super(Comment.class);
    }

    public List<Map.Entry<User, Comment>> getCommentsByPage(Long videoId, int page, int size) throws SQLException {
        String sql
                = "SELECT * FROM [Comment], [User] \n"
                + "WHERE [User].[ID] = [Comment].[UserID] AND [Comment].[VideoID] = " + videoId + "\n"
                + "ORDER BY [Comment].[ID] DESC\n"
                + "OFFSET " + page * size + " ROWS\n"
                + "FETCH NEXT " + size + " ROWS ONLY";

        try ( ResultSet rs = getConnection().executeQuery(sql)) {
            List<Map.Entry<User, Comment>> comments = new ArrayList<>();

            while (rs.next()) {
                comments.add(new AbstractMap.SimpleEntry<>(new User(rs), new Comment(rs)));
            }

            return comments;
        }
    }

    public Long getCommentCount(Long videoId) throws SQLException {
        try ( ResultSet rs = getConnection().executeQuery("SELECT COUNT(*) FROM [Comment] WHERE [VideoID] = ?", videoId)) {
            if (rs.next()) {
                return rs.getLong(1);
            }
        }
        return null;
    }
    public List<Quintet<String,String,String,String,String>> getRecentComments(int top) throws SQLException{
        String sql
            = "SELECT TOP " + top 
            + " [User].[Fullname] as Name, [User].[Email], [Comment].[Content], [Video].[Name] as Video, [Film].[Name] as Film \n"
            + " FROM [Comment], [User], [Video], [Film] \n"
            + " WHERE [User].[ID] = [Comment].[UserID] \n"
            + " AND [Comment].[VideoID] = [Video].[ID] \n"
            + " AND [Video].[FilmID] = [Film].[ID] \n"
            + " ORDER BY [Comment].[ID] DESC";
        try ( ResultSet rs = getConnection().executeQuery(sql)) {
            List<Quintet<String,String,String,String,String>> comments = new ArrayList<>() ;
                while (rs.next()) {
                    comments.add(new Quintet<String,String,String,String,String>(
                        rs.getString("Name")!=null?rs.getString("Name"):"Unknown", 
                        rs.getString("Email"), 
                        rs.getString("Content"), 
                        rs.getString("Film"), 
                        rs.getString("Video")
                        )
                    );
                }
    
                return comments;
        }
    }
}
