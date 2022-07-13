package entities;

import com.yuyu.annotations.SQLColumn;
import com.yuyu.annotations.SQLTable;

@SQLTable(table = "Rate")
public class Rate extends EntityBase {

    @SQLColumn(column = "VideoID")
    public Long videoId;

    @SQLColumn(column = "UserID")
    public Long userId;

    @SQLColumn(column = "Rate")
    public Integer rate;

    public Rate() {
    }

    public Rate(Long id, Long videoId, Long userId, Integer rate) {
        super(id);
        this.videoId = videoId;
        this.userId = userId;
        this.rate = rate;
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

    public Integer getRate() {
        return rate;
    }

    public void setRate(Integer rate) {
        this.rate = rate;
    }
}
