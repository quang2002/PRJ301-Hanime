/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import com.yuyu.annotations.SQLColumn;
import com.yuyu.annotations.SQLTable;

/**
 *
 * @author yuyu2
 */
@SQLTable(table = "FilmCategory")
public class Follow {

    @SQLColumn(column = "FilmID")
    public Long filmId;

    @SQLColumn(column = "UserID")
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
