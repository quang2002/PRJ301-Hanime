/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import com.yuyu.annotations.SQLColumn;
import com.yuyu.annotations.SQLTable;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.json.JSONObject;

/**
 *
 * @author yuyu2
 */
@SQLTable(table = "Comment")
public class Comment extends EntityBase {

    @SQLColumn(column = "VideoID")
    public Long videoId;

    @SQLColumn(column = "UserID")
    public Long userId;

    @SQLColumn(column = "Content")
    public String content;

    public Comment() {
    }

    public Comment(ResultSet rs) throws SQLException {
        this(rs.getLong("ID"), rs.getLong("VideoID"), rs.getLong("UserID"), rs.getNString("Content"));
    }

    public Comment(Long id, Long videoId, Long userId, String content) {
        super(id);
        this.videoId = videoId;
        this.userId = userId;
        this.content = content;
    }

    public Long getVideoId() {
        return videoId;
    }

    public void setVideoId(Long videoId) {
        this.videoId = videoId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public JSONObject toJSON() {
        try {
            JSONObject object = new JSONObject();

            object.put("id", id);
            object.put("video_id", videoId);
            object.put("user_id", userId);
            object.put("content", content);

            return object;
        } catch (Exception e) {
            return null;
        }
    }
}
