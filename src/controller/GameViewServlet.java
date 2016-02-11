package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Player;
import model.GameModel;

@WebServlet("/gameview")
public class GameViewServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	GameModel game = new GameModel();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int player1ID = Integer.parseInt(request.getParameter("player1Id"));
		int player2ID = Integer.parseInt(request.getParameter("player2Id"));
		List<Player> players = null;
		try {
			players = game.getPlayerStats(player1ID, player2ID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("playerStats", players);
		request.getRequestDispatcher("gameView.jsp").forward(request, response);
	}

}
