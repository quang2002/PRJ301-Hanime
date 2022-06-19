/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import com.yuyu.annotations.SQLColumn;
import java.io.Serializable;

/**
 *
 * @author yuyu2
 */
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
