package models;

import entities.Category;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryModel extends ModelBase<Category> {

    public CategoryModel() throws Exception {
        super(Category.class);
    }

    public List<Category> getCategoryByFilmID(Long filmId) {
        try ( ResultSet rs = getConnection().executeQuery("SELECT [Category].* FROM [Category], [FilmCategory] WHERE [Category].[ID] = [CategoryID] AND [FilmID] = ?", filmId)) {
            List<Category> result = new ArrayList<>();

            while (rs.next()) {
                result.add(new Category(rs.getLong("ID"), rs.getNString("Name"), rs.getNString("Description")));
            }

            return result;
        } catch (Exception e) {
            return null;
        }
    }
}
