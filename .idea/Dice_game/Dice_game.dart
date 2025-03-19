import 'dart:io';
import 'dart:math';

// Dice Class
class Dice {
  final int sides;
  final Random _random = Random();

  Dice({this.sides = 6});

  int roll() {
    return _random.nextInt(sides) + 1;
  }
}

// Player Class
class Player {
  final String name;
  int score = 0;

  Player(this.name);

  void rollDice(List<Dice> diceList) {
    int roundScore = diceList.fold(0, (sum, die) => sum + die.roll());
    score += roundScore;
    print('$name kastaði og fékk $roundScore (Heildar fjöldi stiga: $score)');
  }
}

// Function to initialize players
List<Player> initializePlayers() {
  return [Player('Gunnar'), Player('Jón')];
}

// Function to initialize dice for a player
List<Dice> initializeDice(int numberOfDice) {
  return List.generate(numberOfDice, (_) => Dice());
}

// Function to play a single round
void playRound(Player player, List<Dice> diceList) {
  print('${player.name}, ýttu á enter til að kasta teningnum...');
  stdin.readLineSync();
  player.rollDice(diceList);
}

// Function to determine the winner


String determineWinner(Player player1, Player player2) {
  if (player1.score > player2.score) {
    return '${player1.name} vinnur!';
  } else if (player2.score > player1.score) {
    return '${player2.name} vinnur!';
  } else {
    return 'Jafnir!';
  }
}

// Function to play the full game
void playGame(int rounds) {
  List<Player> players = initializePlayers();
  List<Dice> player1Dice = initializeDice(2);
  List<Dice> player2Dice = initializeDice(2);

  for (int i = 1; i <= rounds; i++) {
    print('\nUmferð $i:');
    playRound(players[0], player1Dice);
    playRound(players[1], player2Dice);
  }

  print('\nLoka útkoma:');
  print('${players[0].name}: ${players[0].score}');
  print('${players[1].name}: ${players[1].score}');
  print(determineWinner(players[0], players[1]));
}

// Main Function
void main() {
  print('Velkominn í teningaleikinn!');
  print('Ýttu á enter til að hefja leikinn...');
  stdin.readLineSync();
  playGame(3);
}
