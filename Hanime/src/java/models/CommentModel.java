/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import entities.User;
import entities.Comment;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author yuyu2
 */
public class CommentModel extends ModelBase<Comment> {

    public CommentModel() throws Exception {
        super(Comment.class);
    }

    public List<Object[]> getCommentsByPage(Long videoId, int page, int size) throws SQLException {
        String sql
                = "SELECT * FROM [Comment], [User] \n"
                + "WHERE [User].[ID] = [Comment].[UserID] AND [Comment].[VideoID] = " + videoId + "\n"
                + "ORDER BY [Comment].[ID] DESC\n"
                + "OFFSET " + page * size + " ROWS\n"
                + "FETCH NEXT " + size + " ROWS ONLY";

        try ( ResultSet rs = getConnection().executeQuery(sql)) {
            List<Object[]> comments = new ArrayList<>();

            while (rs.next()) {
                comments.add(new Object[]{new User(rs), new Comment(rs)});
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
}