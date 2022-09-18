package models;

import com.yuyu.jdbc.SQLConnection;
import com.yuyu.jdbc.SQLServerModel;
import java.sql.ResultSet;
import utilities.GlobalConstants;

/**
 *
 * @author quang2002
 * @param <T>
 */
public abstract class ModelBase<T> extends SQLServerModel<T> {

    private static SQLConnection connection = null;

    static {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            connection = new SQLConnection(
                    "jdbc:sqlserver://" + GlobalConstants.SQL_SERVER_NAME
                    + ";databaseName=" + GlobalConstants.SQL_DATABASE_NAME
                    + ";encrypt=true;trustServerCertificate=true",
                    GlobalConstants.SQL_USERNAME,
                    GlobalConstants.SQL_PASSWORD
            );
        } catch (Exception e) {
            System.err.println(e);
        }
    }

    public ModelBase(Class<T> entityClass) throws Exception {
        super(connection, entityClass);
    }

    public static SQLConnection connection() {
        return connection;
    }

    public Long getLastestID() {
        try ( ResultSet rs = getConnection().executeQuery("SELECT TOP 1 [ID] FROM [" + getTableName() + "] ORDER BY [ID] DESC")) {
            if (rs.next()) {
                return rs.getLong(1);
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }
}
