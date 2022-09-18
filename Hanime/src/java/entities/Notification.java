package entities;

import com.yuyu.annotations.SQLColumn;
import com.yuyu.annotations.SQLTable;
import java.sql.Time;

@SQLTable(table = "Notification")
public class Notification {

    @SQLColumn(column = "Content")
    public String content;

    @SQLColumn(column = "UserID")
    public Long userId;

    @SQLColumn(column = "Time")
    public Time time;

    @SQLColumn(column = "NavLink")
    public String navLink;

    public Notification() {
    }

    public Notification(String content, Long userId, Time time, String navLink) {
        this.content = content;
        this.userId = userId;
        this.time = time;
        this.navLink = navLink;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public String getNavLink() {
        return navLink;
    }

    public void setNavLink(String navLink) {
        this.navLink = navLink;
    }
}
