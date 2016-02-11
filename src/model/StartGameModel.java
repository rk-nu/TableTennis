package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Player;
import util.DatabaseConnection;

public class StartGameModel {
	
	List<Player> players;
	
	/**
	 *  This method returns list of all players from database
	 * @return All players' list
	 * @throws Exception
	 */
	public List<Player> getAllPlayers() throws Exception {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		players = new ArrayList<Player>();
		try {
			// connect to database
			connection = DatabaseConnection.getConnection();
			String query = "select * from player";
			statement = connection.prepareStatement(query);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Player player = new Player();
				player.setId(resultSet.getInt("id"));
				player.setPlayerName(resultSet.getString("playerName"));
				player.setWins(resultSet.getInt("win"));
				player.setLosses(resultSet.getInt("loss"));
				players.add(player);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			if (resultSet != null)
				try {
					resultSet.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (statement != null)
				try {
					statement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return players;
	}
}
