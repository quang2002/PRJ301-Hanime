/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Set;

/**
 *
 * @author quang2002
 * @param <T>
 */
public abstract class ModelBase<T> {

    private static final Connection connection;

    static {
        final String serverName = "localhost";
        final String databaseName = "Hanime";
        final String username = "sa";
        final String password = "271102";
        
        connection = ModelBase.createConnection("jdbc:sqlserver://" + serverName + ";databaseName=" + databaseName + ";encrypt=true;trustServerCertificate=true", username, password);
    }

    public static Connection createConnection(String query, String username, String password) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(query, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            return null;
        }
    }

    public static Connection getConnection() {
        return connection;
    }

    public static PreparedStatement createStatement(String sql, Object... params) throws SQLException {
        PreparedStatement ps = getConnection().prepareStatement(sql);

        for (int i = 0; i < params.length; i++) {
            Object param = params[i];
            ps.setObject(i + 1, param);
        }

        return ps;
    }

    public abstract int add(T obj) throws SQLException;

    public abstract int update(T obj) throws SQLException;

    public abstract int remove(T obj) throws SQLException;

    public abstract Set<T> getall() throws SQLException;
}
