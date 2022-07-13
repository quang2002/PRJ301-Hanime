package entities;

import com.yuyu.annotations.SQLColumn;
import com.yuyu.annotations.SQLTable;

@SQLTable(table = "Follow")
public class Follow {

    @SQLColumn(column = "FilmID", isPrimaryKey = true)
    public Long filmId;

    @SQLColumn(column = "UserID", isPrimaryKey = true)
    public Long userId;

    public Follow() {
    }

    public Follow(Long filmId, Long userId) {
        this.filmId = filmId;
        this.userId = userId;
    }

    public Long getFilmId() {
        return filmId;
    }

    public void setFilmId(Long filmId) {
        this.filmId = filmId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
