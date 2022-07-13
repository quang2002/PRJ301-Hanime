package entities;

import com.yuyu.annotations.SQLColumn;
import java.io.Serializable;

public abstract class EntityBase implements Serializable {

    @SQLColumn(column = "ID", isAutoIncrement = true, isPrimaryKey = true)
    public Long id;

    public EntityBase() {
    }

    public EntityBase(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
