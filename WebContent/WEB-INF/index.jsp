
<%@ page contentType="text/html;charset=UTF-8" language="java"
	import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Start Game</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw=="
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
	var $ = jQuery;
	$(function() {

		$("#choose-player").hide();

		$("#start-game").click(function() {
			var selectedPlayer1Id = $("#player-1").val();
			var selectedPlayer2Id = $("#player-2").val();
			$("#player1Id").attr("value", selectedPlayer1Id);
			$("#player2Id").attr("value", selectedPlayer2Id);

			var player1 = $("#player-1 option:selected").val();
			var player2 = $("#player-2 option:selected").val();
			if (player1 != player2) {
				$("form").attr({
					"action" : "gameview",
					"method" : "post"
				}).submit();
			} else
				$("#choose-player").show();
		});
	});
</script>
</head>
<body>

	<nav class="navbar navbar-default navbar-inverse navbar-static-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<span class="navbar-brand" align="center">Table Tennis
					Scoring App</span>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<h3 align="center"></h3>
		</div>
		<form>
			<input type="hidden" id="player1Id" name="player1Id"> <input
				type="hidden" id="player2Id" name="player2Id">

			<div class="row">
				<div class="col-md-offset-4 col-md-4">
					<div class="panel panel-default">
						<div class="panel-heading" align="center">
							<b>Choose Players</b>
						</div>
						<div class="panel-body">
							<label>PLAYER 1:</label> <select id="player-1"
								class="form-control">
								<c:forEach items="${players}" var="player">
									<option value="${player.id}">${player.playerName}</option>
								</c:forEach>
							</select> <br /> <br /> <label>PLAYER 2:</label> <select id="player-2"
								class="form-control">
								<c:forEach items="${players}" var="player">
									<option value="${player.id}" selected>
										${player.playerName}</option>
								</c:forEach>
							</select> <br /> <br />
							<button id="start-game" class="btn btn-primary">Start
								Game</button>
							<br /> <br />
							<div class="alert alert-warning" id="choose-player" role="alert">
								<p align="center">Please choose different players!</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
