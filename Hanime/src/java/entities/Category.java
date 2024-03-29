package entities;

import com.yuyu.annotations.SQLColumn;
import com.yuyu.annotations.SQLTable;

@SQLTable(table = "Category")
public class Category extends EntityBase {

    @SQLColumn(column = "Name")
    public String name;

    @SQLColumn(column = "Description")
    public String description;

    public Category() {
    }

    public Category(Long id, String name, String description) {
        super(id);
        this.name = name;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
