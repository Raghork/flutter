// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pokedex/main_screen.dart';

void main() {
  runApp(Pokedex());
}

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}