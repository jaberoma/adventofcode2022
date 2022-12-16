import 'dart:core';

enum Play {
  rock(1, ['A', 'X']),
  paper(2, ['B', 'Y']),
  scissors(3, ['C', 'Z']);

  final int score;
  final List<String> symbols;
  const Play(this.score, this.symbols);

  factory Play.parse(String play) {
    return Play.values.firstWhere((element) => element.symbols.contains(play));
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
  for (var strategy in strategyGuide) {
    List<String> parts = strategy.split(' ');
    totalScore +=
        Round(Play.parse(parts.first), Play.parse(parts.last)).myScore();
  }

  return totalScore;
}
