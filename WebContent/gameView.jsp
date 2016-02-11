<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
<head>
<title>Game View</title>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw=="
	crossorigin="anonymous">
<style>
.player-label {
	margin-bottom: 50px;
}

.wins-board {
	margin-top: 20px;
}

.wins-board span {
	margin-right: 30px;
}

.wins-label {
	margin-top: 10px;
}

.wins-label span {
	margin-right: 40px;
}

.add-score {
	margin-left: 13px;
}

.circle {
	width: 200px;
	height: 200px;
	text-align: center;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
	font-size: 20px;
	padding: 12px;
}

.wins {
	background-color: #5cb85c;
	margin-right: 40px;
}

.loss {
	background-color: #d9534f;
}

.score {
	background-color: #2e6da4;
}

.score-label {
	font-size: 16px;
}
</style>

<script src="https://code.jquery.com/jquery-2.1.4.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	var $ = jQuery;
	$(function() {

		var firstPlayerScore = 0;
		var secondPlayerScore = 0;
		var targetScore = 11;
		var winner = 0;
		var serveCount = 0;
		var serveLeft = true;

		$("#restart").hide();
		$(".jumbotron").hide();
		$("#service-right").hide();

		var checkWinner = function() {
			if (firstPlayerScore == secondPlayerScore) {
				targetScore += 1;
				winner = 0;
			} else if (firstPlayerScore == targetScore) {
				winner = 1;
			} else if (secondPlayerScore == targetScore) { // secondPlayer == targetScore
				winner = 2;
			} else {
				winner = 0;
			}
			return winner;
		};

		var updateStats = function(winner) {
			var winnerId, looserId;

			if (winner == 1) {
				winnerId = ${playerStats[0].id}	;
				looserId = ${playerStats[1].id}	;
			} else {
				winnerId = ${playerStats[1].id}	;
				looserId = ${playerStats[0].id}	;
			}

			$.ajax({
				url : 'updateStats',
				type : 'POST',
				data : {
					winnerId : winnerId,
					looserId : looserId
				},
				success : function(responseText) {
					console.log("Database updated");
					$("#restart").show();
					$(".add-score").prop('disabled', true);
				},
				failure : function() {
					console.log("Error! Database updated failed");
				}
			});

		};

		$("#restart").click(function() {
			document.location.href = "/TableTennis";
		});

		$(".add-score")
				.click(
						function(evt) {

							var scoredPlayerId = $(evt.target).attr('id');
							var firstPlayerId = "#player-1-game";
							var secondPlayerId = "#player-2-game";
							var scoredPlayer;
							if (scoredPlayerId == "player-1-score") {
								firstPlayerScore++;
								$(firstPlayerId + " .score").text(
										firstPlayerScore);
							} else {
								secondPlayerScore++;
								$(secondPlayerId + " .score").text(
										secondPlayerScore);
							}

							serveCount++;
							if (serveCount == 2) {
								serveCount = 0;
								serveLeft = !serveLeft;
								$("#service-left").toggle(serveLeft);
								$("#service-right").toggle(!serveLeft);

							}

							if ((firstPlayerScore == 7 && secondPlayerScore == 0)) {
								winner = 1;
							} else if (firstPlayerScore == 0
									&& secondPlayerScore == 7) {
								winner = 2;
							}

							else if (firstPlayerScore >= 10
									|| secondPlayerScore >= 10) {
								winner = checkWinner();
							}

							if (winner != 0) {
								updateStats(winner);

								if (winner == 1) {
									$(".jumbotron h2")
											.html(
													" Winner is <b>${playerStats[0].playerName}</b>");
								} else {
									$(".jumbotron h2")
											.html(
													" Winner is <b>${playerStats[1].playerName}</b>");
								}
								$(".jumbotron").show();

							}
						});
	});
</script>
</head>
<body>

	<nav class="navbar navbar-default navbar-inverse navbar-static-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<span class="navbar-brand">Table Tennis Scoring App</span>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<h2 align="center" class="page-header">Table Tennis Game View</h2>
		</div>
		<div class="row">
			<div class="col-md-offset-1 col-md-4" id="player-1-game">
				<div class=" panel panel-default">
					<div class="panel-heading player-label" align="center">
						<b>${playerStats[0].playerName}</b>
					</div>
					<div class="panel-body">
						<div class="col-md-offset-4">
							<div class="row">
								<div class="col-md-3">
									<p class="score-label">Score</p>
								</div>
								<div class="col-md-5">
									<span class="score circle">0</span>
								</div>
							</div>

							<br />
							<button type="button" class="btn btn-primary add-score"
								id="player-1-score">Add score</button>
							<input type="hidden" value="${playerStats[0].id}"
								id="player-1-id"> <br />
							<div class="wins-board">
								<span class="circle wins">${playerStats[0].wins}</span> <span
									class="circle loss">${playerStats[0].losses}</span>
							</div>
							<div class="wins-label">
								<span>wins</span> <span>loss</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="row">
					<div class="col-md-offset-3 col-md-6">
						<button class="btn btn-primary" id="restart">Restart</button>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-5">
						<h3 class="glyphicon glyphicon-arrow-left service"
							id="service-left" aria-hidden="true"></h3>
					</div>
					<div class="col-md-offset-2 col-md-5">
						<h3 class="glyphicon glyphicon-arrow-right service"
							id="service-right" aria-hidden="true"></h3>
					</div>
				</div>
			</div>
			<div class="col-md-4" id="player-2-game">
				<div class="panel panel-default">
					<div class="panel-heading player-label" align="center">
						<b>${playerStats[1].playerName}</b>
					</div>
					<div class="panel-body">
						<div class="col-md-offset-4">
							<div class="row">
								<div class="col-md-3">
									<p class="score-label">Score</p>
								</div>
								<div class="col-md-5">
									<span class="score circle">0</span>
								</div>
							</div>
							<br />
							<button type="button" class="btn btn-primary add-score"
								id="player-2-score">Add score</button>
							<input type="hidden" value="${playerStats[1].id}"
								id="player-2-id"> <br />
							<div class="wins-board">
								<span class="circle wins">${playerStats[1].wins}</span> <span
									class="circle loss">${playerStats[1].losses}</span>
							</div>
							<div class="wins-label">
								<span>wins</span> <span>loss</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-offset-3 col-md-6">
			<div class="jumbotron">
				<div class="container">
					<h2 align="center"></h2>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
