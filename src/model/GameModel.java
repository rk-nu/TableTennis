package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Player;
import util.DatabaseConnection;

public class GameModel {

	/**
	 * This method takes in winner and looser ids and updates their wins and looses accordingly
	 * @param winnerId winning player ID
	 * @param looserId loosing player ID
	 * @throws SQLException
	 */
	public void updatePlayerStats(int winnerId, int looserId) throws SQLException {
		Connection connection = null;
		PreparedStatement statement1 = null;
		PreparedStatement statement2 = null;

		try {
			// connect to database
			connection = DatabaseConnection.getConnection();
			String query = "update pingpong.player set win = win + 1 where id = ?";
			statement1 = connection.prepareStatement(query);
			statement1.setInt(1, winnerId);
			statement1.executeUpdate();
			
			String query1 = "update pingpong.player set loss = loss + 1 where id = ?";
			statement2 = connection.prepareStatement(query1);
			statement2.setInt(1, looserId);
			statement2.executeUpdate();

		} catch (SQLException e) {
			throw e;
		}  finally {
			try {
				
				if (statement1 != null)
						statement1.close();
				
				if (statement2 != null)
					statement2.close();
					
				if (connection != null)					
						connection.close();
			}
			 catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
	}
	
	/** 
	 * This method takes in 2 players ids and provides their details from database
	 * @param player1Id player 1 ID
	 * @param player2Id player 2 ID
	 * @return List of Players
	 * @throws Exception
	 */
	public List<Player> getPlayerStats(int player1Id, int player2Id) throws Exception {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		List<Player> players = new ArrayList<Player>();
		try {
			// connect to database
			connection = DatabaseConnection.getConnection();
			String query = "select * from pingpong.player where id in (?, ?)";
			statement = connection.prepareStatement(query);
			statement.setInt(1, player1Id);
			statement.setInt(2, player2Id);
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
			throw e;
		} finally {
			try {
				if (resultSet != null)			
					resultSet.close();
				
				if (statement != null)
						statement.close();
					
				if (connection != null)					
						connection.close();
			}
			 catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return players;
	}

}
