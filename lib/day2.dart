enum Play {
  rock(1),
  paper(2),
  scissors(3);

  final int score;
  const Play(this.score);

  static Play parse(String play) {
    if (['A', 'X'].contains(play)) {
      return Play.rock;
    } else if (['B', 'Y'].contains(play)) {
      return Play.paper;
    } else if (['C', 'Z'].contains(play)) {
      return Play.scissors;
    } else {
      throw Exception('Not supported type');
    }
  }
}

enum RoundOutcomeForMe {
  win(6),
  draw(3),
  lost(0);

  final int score;
  const RoundOutcomeForMe(this.score);

  static RoundOutcomeForMe eval(Round round) {
    switch (round.opponentPlay) {
      case Play.rock:
        {
          if (round.myPlay == Play.paper) {
            return RoundOutcomeForMe.win;
          } else if (round.myPlay == Play.rock) {
            return RoundOutcomeForMe.draw;
          } else {
            return RoundOutcomeForMe.lost;
          }
        }
      case Play.paper:
        {
          if (round.myPlay == Play.paper) {
            return RoundOutcomeForMe.draw;
          } else if (round.myPlay == Play.rock) {
            return RoundOutcomeForMe.lost;
          } else {
            return RoundOutcomeForMe.win;
          }
        }
      case Play.scissors:
        {
          if (round.myPlay == Play.paper) {
            return RoundOutcomeForMe.lost;
          } else if (round.myPlay == Play.rock) {
            return RoundOutcomeForMe.win;
          } else {
            return RoundOutcomeForMe.draw;
          }
        }
    }
  }
}

class Round {
  final Play opponentPlay;
  final Play myPlay;

  Round(this.opponentPlay, this.myPlay);

  int myScore() {
    return myPlay.score + RoundOutcomeForMe.eval(this).score;
  }
}

int puzzle1(List<String> strategyGuide) {
  int totalScore = 0;
  strategyGuide.forEach((strategy) {
    List<String> parts = strategy.split(' ');
    totalScore +=
        Round(Play.parse(parts.first), Play.parse(parts.last)).myScore();
  });

  return totalScore;
}
