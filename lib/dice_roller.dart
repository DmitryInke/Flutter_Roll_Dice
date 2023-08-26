import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var diceNumber = 1;
  var lastDiceNumber = 1;

  int generateDiceNumber() {
    var newDiceNumber = randomizer.nextInt(6) + 1;
    while (newDiceNumber == lastDiceNumber) {
      newDiceNumber = randomizer.nextInt(6) + 1;
    }
    lastDiceNumber = newDiceNumber;
    return newDiceNumber;
  }

  void rollDice() {
    setState(() {
      diceNumber = generateDiceNumber();
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$diceNumber.png',
          width: 200,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
