package entities;

import com.yuyu.annotations.SQLColumn;
import com.yuyu.annotations.SQLTable;

@SQLTable(table = "FilmCategory")
public class FilmCategory {

    @SQLColumn(column = "FilmID", isPrimaryKey = true)
    public Long filmId;

    @SQLColumn(column = "CategoryID", isPrimaryKey = true)
    public Long categoryId;

    public FilmCategory() {
    }

    public FilmCategory(Long filmId, Long categoryId) {
        this.filmId = filmId;
        this.categoryId = categoryId;
    }

    public Long getFilmId() {
        return filmId;
    }

    public void setFilmId(Long filmId) {
        this.filmId = filmId;
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }
}
