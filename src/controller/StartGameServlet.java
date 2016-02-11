package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Player;
import model.StartGameModel;

public class StartGameServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	StartGameModel getData = new StartGameModel();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		List<Player> players = null ; 
		try {
			players = getData.getAllPlayers();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("players", players);
		request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	}
}
