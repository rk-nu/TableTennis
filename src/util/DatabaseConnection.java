package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseConnection {

	/**
	 * This method connects to database by taking username and password from Constants file
	 * @return Connection object
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public static Connection getConnection() {
		Connection connection = null;
		Properties props = new Properties();
		try {
			Class.forName(Constants.driverName);
			String dbURL = "jdbc:mysql://localhost:3306/"+ Constants.dbName + "?autoReconnect=true&useSSL=false";
			connection = DriverManager.getConnection(dbURL, Constants.userName, Constants.password);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
}
