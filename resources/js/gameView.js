$(function(){

	var firstPlayerScore = 0;
	var secondPlayerScore = 0;
	var targetScore = 11;
	var winner = 0;
	
	var checkWinner = function() {
		if (firstPlayerScore == secondPlayerScore) {
			targetScore += 1;
			winner = 0;
		}
		else if (firstPlayerScore == targetScore) {
			winner = 1;
		} 
		else if (secondPlayerScore == targetScore) {			// secondPlayer == targetScore
			winner = 2;
		} else {
			winner = 0;
		}
		return winner;
	}
	
	$(".add-score").click(function(evt) {
		
		var scoredPlayerId = $(evt.target).attr('id');
		var firstPlayerId = "#player-1-game";
		var secondPlayerId = "#player-2-game";
		var scoredPlayer;
		if(scoredPlayerId == "player-1-score") {
			firstPlayerScore++;
			$(firstPlayerId + " .score").text(firstPlayerScore);
		} else {
			secondPlayerScore++;
			$(secondPlayerId + " .score").text(secondPlayerScore);
		}
		
		if (firstPlayerScore >= 10 || secondPlayerScore >= 10) {
			winner = checkWinner();
		}
		
		if (winner != 0)
			alert("Yay winner is " + winner);
		
	});
	
	
});