/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import entities.Film;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.List;

import org.javatuples.Quintet;

/**
 *
 * @author yuyu2
 */
public class FilmModel extends ModelBase<Film> {

    public FilmModel() throws Exception {
        super(Film.class);
    }

//    public List<Quintet<Integer,String,String,Integer,Integer>> getTopFilms(int top) throws SQLException{
//        String sql
//            =""
//            ;
//            try ( ResultSet rs = getConnection().executeQuery(sql)){
//                
//            }
//    }
}
