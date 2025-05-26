package Models.DAO;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

public abstract class BaseDAO<VO> implements BaseInterDAO<VO> {
    private static Connection connection = null;
    private static final String url = "jdbc:postgresql://localhost:5432/meu_banco";
    private static final String user = "meu_usuario";
    private static final String password = "minha_senha";

    public static Connection getConnection() throws SQLException {
        if (connection == null) {
            connection = DriverManager.getConnection(url, user, password);
        }

        return connection;
    }

    public static void closeConnection() throws SQLException {
        if(connection != null) {
            connection.close();
        }
    }
}