/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import entities.Rate;
import entities.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author yuyu2
 */
public class RateModel extends ModelBase<Rate> {

    public RateModel() throws Exception {
        super(Rate.class);
    }
    public List<Rate> getRecentRates(int top) throws SQLException{
        String sql 
                = "SELECT TOP " + top + " * FROM [User]"
                + "ORDER BY [ID] DESC";
        try (ResultSet rs = getConnection().executeQuery(sql)) {
            List<Rate> list = new ArrayList<>();
            while(rs.next()){
                list.add(new Rate(rs));
            }
            return list;
        }
    }
}
