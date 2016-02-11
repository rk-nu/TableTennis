package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GameModel;

@WebServlet("/updateStats")
public class UpdateStatsServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	GameModel game = new GameModel();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int winnerId = Integer.parseInt(request.getParameter("winnerId"));
		int looserId = Integer.parseInt(request.getParameter("looserId"));
		try {
			game.updatePlayerStats(winnerId, looserId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
