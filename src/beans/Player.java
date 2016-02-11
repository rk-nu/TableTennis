package beans;

public class Player {
	private int id;
	private String playerName;
	private int wins;
	private int losses;
	
		
	public Player() {
		super();
		id = -1;
		playerName = null;
		wins = -1;
		losses = -1;
	}


	public Player(int id, String playerName, int wins, int losses) {
		super();
		this.id = id;
		this.playerName = playerName;
		this.wins = wins;
		this.losses = losses;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	public int getWins() {
		return wins;
	}
	public void setWins(int wins) {
		this.wins = wins;
	}
	public int getLosses() {
		return losses;
	}
	public void setLosses(int losses) {
		this.losses = losses;
	}	
}
