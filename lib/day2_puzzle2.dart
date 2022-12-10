import 'dart:core';

enum Play {
  rock(1, 'A'),
  paper(2, 'B'),
  scissors(3, 'C');

  final int score;
  final String symbol;
  const Play(this.score, this.symbol);

  static Play parse(String play) {
    return Play.values.firstWhere((element) => element.symbol.contains(play));
  }
}

enum RoundDesiredOutcomeForMe {
  win(6, 'Z'),
  draw(3, 'Y'),
  lost(0, 'X');

  final int score;
  final String symbol;
  const RoundDesiredOutcomeForMe(this.score, this.symbol);

  static RoundDesiredOutcomeForMe parse(String strategy) {
    return RoundDesiredOutcomeForMe.values
        .firstWhere((element) => element.symbol.contains(strategy));
  }

  Play decideMyPlay(Play opponentPlay) {
    switch (opponentPlay) {
      case Play.rock:
        {
          if (this == win) {
            return Play.paper;
          } else if (this == draw) {
            return Play.rock;
          } else {
            return Play.scissors;
          }
        }
      case Play.paper:
        {
          if (this == win) {
            return Play.scissors;
          } else if (this == draw) {
            return Play.paper;
          } else {
            return Play.rock;
          }
        }
      case Play.scissors:
        {
          if (this == win) {
            return Play.rock;
          } else if (this == draw) {
            return Play.scissors;
          } else {
            return Play.paper;
          }
        }
    }
  }
}

int puzzle2(List<String> strategyGuide) {
  int totalScore = 0;
  strategyGuide.forEach((strategy) {
    List<String> parts = strategy.split(' ');
    Play opponentPlay = Play.parse(parts.first);
    RoundDesiredOutcomeForMe roundDesiredOutcomeForMe =
        RoundDesiredOutcomeForMe.parse(parts.last);
    Play myPlay = roundDesiredOutcomeForMe.decideMyPlay(opponentPlay);
    totalScore += roundDesiredOutcomeForMe.score + myPlay.score;
  });

  return totalScore;
}
