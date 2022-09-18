package entities;

import com.yuyu.annotations.SQLColumn;
import com.yuyu.annotations.SQLTable;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.json.JSONObject;

@SQLTable(table = "Comment")
public class Comment extends EntityBase {

    @SQLColumn(column = "VideoID")
    public Long videoId;

    @SQLColumn(column = "UserID")
    public Long userId;

    @SQLColumn(column = "Content")
    public String content;
    
    @SQLColumn(column = "ReportedTime")
    public int reportedTime;

    public Comment() {
    }

    public Comment(ResultSet rs) throws SQLException {
        this(rs.getLong("ID"), rs.getLong("VideoID"), rs.getLong("UserID"), rs.getNString("Content"), rs.getInt("ReportedTime"));
    }

    public Comment(Long id, Long videoId, Long userId, String content, Integer reportedTime) {
        super(id);
        this.videoId = videoId;
        this.userId = userId;
        this.content = content;
        this.reportedTime = reportedTime;
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
    
    public int getReportedTime(){
        return this.reportedTime;
    }

    public JSONObject toJSON() {
        if(this.reportedTime!=0) return null;
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
